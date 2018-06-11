package kr.co.bitdaily.meal.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.Image;
import com.google.protobuf.ByteString;

import kr.co.bitdaily.repository.mapper.MealMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;
import kr.co.bitdaily.repository.vo.Stat;

@Service
public class MealServiceImpl implements MealService {
	
	@Autowired
	private MealMapper mealMapper;
	@Autowired
	private StatMapper statMapper;
	
	@Override
	public Image getImage(String filePath) throws IOException {
        Image image;

            ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
            image = Image.newBuilder().setContent(imgBytes).build();

        return image;
    }
	
	@Override
	public String fileUpload(MultipartFile file, HttpServletRequest req) throws IllegalStateException, IOException {

			String oriFileName = file.getOriginalFilename();
			String saveFileName = "";
			if(oriFileName != null && !oriFileName.equals("")) {
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				// 고유한 파일명 만들기	
				saveFileName = "fooddiary-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
				
				// 데이터베이스에 파일 정보 저장

				// 임시저장된 파일을 원하는 경로에 저장
//				File f = new File("C:/java-lec/git/bitdaily/src/main/webapp/images/fooddiary");
				String uploadPath = req.getServletContext().getRealPath("/")+"images/fooddiary";
				System.out.println("uploadPath:"+uploadPath);
				File f = new File(uploadPath);
				if (!f.exists()) f.mkdirs();
				file.transferTo(new File(f, saveFileName));
				
			}
			return saveFileName;
	}
	@Override
	public List<Food> selectFood(String keyword) {
		return mealMapper.selectFood(keyword);
	}

	@Override
	public Meal selectMealSeq(Meal meal) {
		
		Meal mealResult = mealMapper.selectMealSeq(meal);
		Meal mealSeq = null;
		
		if(mealResult == null ) {
			mealMapper.insertMealSeq(meal);
			mealSeq = mealMapper.selectMealSeq(meal);
		} else {
			mealSeq = mealMapper.selectMealSeq(meal);
		}
		
		return mealSeq;
	}

	@Override
	public void insertFood(MealDetail detail, int userSeq, Date mealDate) {
		
		//식단등록
		mealMapper.insertMealDetail(detail);
		
		//통계테이블등록
//		int mealSeq = detail.getMealSeq();
		Meal meal = new Meal();
		meal.setMealDate(mealDate);
		meal.setUserSeq(userSeq);
		Meal resultMeal = mealMapper.selectMealSeq(meal);
		int mealSeq = resultMeal.getMealSeq();
		System.out.println("밀스퀀스"+mealSeq);
		
		Stat newStat = new Stat();
		newStat.setMealSeq(mealSeq);
		newStat.setUserSeq(userSeq);
		newStat.setMealDate(mealDate);
		
		String mealType = detail.getMealType();
		
		int foodSeq = detail.getFoodSeq();
		
		double foodKcal = mealMapper.getFoodKcal(foodSeq);
		double mealGram = detail.getMealGram();
		double calorie = foodKcal * mealGram;
		
		Stat stat = statMapper.selectStatByMealSeq(mealSeq);
		
		if(stat == null) {
			switch(mealType) {
			case "1" : newStat.setMorning(calorie); break;
			case "2" : newStat.setLunch(calorie); break;
			case "3" : newStat.setDiner(calorie); break;
			case "4" : newStat.setSnack(calorie); break;
			}
			statMapper.insertStat(newStat);
		} else {
			switch(mealType) {
			case "1" : newStat.setMorning(stat.getMorning() + calorie); 
					   newStat.setLunch(stat.getLunch());
					   newStat.setDiner(stat.getDiner());
					   newStat.setSnack(stat.getSnack());
					   break;
			case "2" : newStat.setLunch(stat.getLunch() + calorie);
					   newStat.setMorning(stat.getMorning());
					   newStat.setDiner(stat.getDiner());
					   newStat.setSnack(stat.getSnack());
					   break;
			case "3" : newStat.setDiner(stat.getDiner() + calorie);
					   newStat.setMorning(stat.getMorning());
					   newStat.setLunch(stat.getLunch());
					   newStat.setSnack(stat.getSnack());
					   break;
			case "4" : newStat.setSnack(stat.getSnack() + calorie);
				       newStat.setMorning(stat.getMorning());
					   newStat.setLunch(stat.getLunch());
					   newStat.setDiner(stat.getDiner());
					   break;
			}
			statMapper.updateStat(newStat);
		}
		
		
	}

	@Override
	public List<MealDetail> selectMealDetail(int mealSeq) {
		return mealMapper.selectMealDetail(mealSeq);
	}


}
