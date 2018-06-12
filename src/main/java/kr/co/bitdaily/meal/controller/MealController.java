package kr.co.bitdaily.meal.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

import kr.co.bitdaily.meal.service.MealService;
import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.util.DiaryCalendar;
import kr.co.bitdaily.util.TranslationAPI;

@Controller
@RequestMapping("/diary")
public class MealController {
	
	@Autowired
	private MealService mealService;
	
	@RequestMapping("/vision.json")
	@ResponseBody
	public List<String> detectLabels(String fileName, HttpServletRequest req) throws Exception {

	    ImageAnnotatorClient vision = ImageAnnotatorClient.create();

//	    String filePath = "C:/java-lec/git/bitdaily/src/main/webapp/images/fooddiary/" + fileName;
	    String filePath = req.getServletContext().getRealPath("/")+"images/fooddiary/" + fileName;

	    Path path = Paths.get(filePath);

	    byte[] data = Files.readAllBytes(path);

	    ByteString imgBytes = ByteString.copyFrom(data);

	    List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();

	    Image img = Image.newBuilder().setContent(imgBytes).build();

	    Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();

	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder()

	        .addFeatures(feat)

	        .setImage(img)

	        .build();

	    requests.add(request);

	    BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
	    List<AnnotateImageResponse> responses = response.getResponsesList();
	    List<String> list = new ArrayList<String>();
	    
	    for (AnnotateImageResponse res : responses) {
	      if (res.hasError()) {
	        System.out.printf("Error: %s\n", res.getError().getMessage());
	      }
	      
	      TranslationAPI translate = new TranslationAPI();
	      for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
	    	  String description = annotation.getDescription();
	    	  String koDescription = translate.translate(description);
//	        annotation.getAllFields().forEach((k, v)->list.add(v.toString()));
	    	  list.add(koDescription);
	      }
	    }
	    return list;
	    
	   
	    
	}


	@RequestMapping("/upload.json")
	@ResponseBody
	public Map<String, String> fileUpload(@RequestParam MultipartFile file, HttpServletRequest req) throws IOException {
		String fileName = mealService.fileUpload(file, req);
		Map<String, String> map = new HashMap<>();
		map.put("fileName", fileName);
		return map;
	}
	
	@RequestMapping("/fooddiary.do")
	public void foodList() {
	}
	
	@RequestMapping("/fooddiary.json")
	@ResponseBody
	public Date mealListMove(@RequestParam String bntId, Date currentDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DiaryCalendar cal = new DiaryCalendar();
		Date date = null;
		if(bntId.equals("preDate")) {
			date = cal.getPreDate(currentDate);
		} else {
			if(sdf.format(new Date()).equals(sdf.format(currentDate))) {
				date = currentDate;
			}else {
				date = cal.getNextDate(currentDate);
			}
		}
		return date;
	}
	
	@RequestMapping("/mealSeq.json")
	@ResponseBody
	public Meal selectMealSeq(@RequestParam Date currentDate, HttpSession session) {
		Meal meal = new Meal();
		meal.setMealDate(currentDate);
		
		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		meal.setUserSeq(userSeq);
		
		Meal mealResult = mealService.selectMealSeq(meal);
		session.setAttribute("mealSeq", mealResult.getMealSeq());
		return mealResult;
	}
	
	
	@RequestMapping("/makeList.json")
	@ResponseBody
	public List<MealDetail> makeList(@RequestParam String userSeq , Date mealDate) {
		Meal meal = new Meal();
		meal.setUserSeq(Integer.parseInt(userSeq));
		meal.setMealDate(mealDate);
		meal = mealService.selectMealSeq(meal);
		return mealService.selectMealDetail(meal.getMealSeq());
	}
	
	
	@RequestMapping("/insertFood.json")
	@ResponseBody
	public void insertFood(@RequestParam Date mealDate, String userSeq, String mealType, String foodSeq , String mealGram, String filePath) {
		
		System.out.println("식사 날짜" + mealDate);
		System.out.println("유저 시퀀스" + userSeq);
		System.out.println("식사 타입" + mealType);
		System.out.println("음식 시퀀스" + foodSeq);
		System.out.println("식사 그람" + mealGram);
		System.out.println("파일" + filePath);
		
		Meal meal = new Meal();
		meal.setUserSeq(Integer.parseInt(userSeq));
		meal.setMealDate(mealDate);
		meal = mealService.selectMealSeq(meal);
		
		MealDetail detail = new MealDetail();
		detail.setMealSeq(meal.getMealSeq());
		detail.setMealType(mealType);
		detail.setFoodSeq(Integer.parseInt(foodSeq));
		detail.setMealGram(Integer.parseInt(mealGram));
		detail.setFilePath(filePath);
		mealService.insertFood(detail, Integer.parseInt(userSeq), mealDate);

	}
	
	
	@RequestMapping("/foodSearch.json")
	@ResponseBody
	public List<Food> foodSearch(@RequestParam String keyword) {
		System.out.println("서칭 작동중...............");
		System.out.println("키워드 명 : " + keyword);
		return mealService.selectFood(keyword);
	}
	
	
	@RequestMapping("/deleteMeal.json")
	@ResponseBody
	public void deleteMeal(@RequestParam int mealDetailSeq, int userSeq, Date mealDate, double kcal) throws IOException {
		
		//tb_meal_detail 삭제
		MealDetail detail = mealService.selectMealByDetailSeq(mealDetailSeq);
		mealService.deleteMealDetail(mealDetailSeq);
		
		String mealType = detail.getMealType();
		int mealSeq = detail.getMealSeq();
		
		Stat oriStat = mealService.selectStatByMealSeq(mealSeq);
		
		//tb_stat 수정
		Stat stat = new Stat();
		stat.setMealSeq(mealSeq);
		stat.setMealDate(mealDate);
		stat.setUserSeq(userSeq);
		
		
		switch(mealType) {
		case "1" : stat.setMorning(oriStat.getMorning()-kcal); 
				   stat.setLunch(oriStat.getLunch());
				   stat.setDiner(oriStat.getDiner());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "2" : stat.setLunch(oriStat.getLunch()-kcal); 
				   stat.setMorning(oriStat.getMorning());
				   stat.setDiner(oriStat.getDiner());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "3" : stat.setDiner(oriStat.getDiner()-kcal);
				   stat.setMorning(oriStat.getMorning());
				   stat.setLunch(oriStat.getLunch());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "4" : stat.setSnack(oriStat.getSnack()-kcal);
				   stat.setMorning(oriStat.getMorning());
				   stat.setLunch(oriStat.getLunch());
				   stat.setDiner(oriStat.getDiner());
				   break;
		}
		
		
		mealService.updateStat(stat);

	}
	
	@RequestMapping("/updateMeal.json")
	@ResponseBody
	public void updateMeal(@RequestParam double mealGram, int mealDetailSeq, int userSeq, Date mealDate, int foodSeq, double kcal) throws IOException {
		
		//tb_meal_detail 업데이트
		MealDetail mealDetail = new MealDetail();
		mealDetail.setMealGram(mealGram);
		mealDetail.setMealDetailSeq(mealDetailSeq);
		mealService.updateGramDetail(mealDetail);
		
		//tb_stat 업데이트
			//새로운 kcal 얻어오기
			double foodKcal = mealService.getKcalByFoodSeq(foodSeq);
			double newKcal = foodKcal*mealGram;
			
			//기존 kcal 빼기 : -kcal
		
		MealDetail detail = mealService.selectMealByDetailSeq(mealDetailSeq);
		String mealType = detail.getMealType();

		int mealSeq = detail.getMealSeq();
		
		Stat oriStat = mealService.selectStatByMealSeq(mealSeq);
			
		Stat stat = new Stat();
		stat.setMealSeq(mealSeq);
		stat.setMealDate(mealDate);
		stat.setUserSeq(userSeq);
		
		switch(mealType) {
		case "1" : stat.setMorning(oriStat.getMorning()-kcal+newKcal);
				   stat.setLunch(oriStat.getLunch());
				   stat.setDiner(oriStat.getDiner());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "2" : stat.setLunch(oriStat.getLunch()-kcal+newKcal);
				   stat.setMorning(oriStat.getMorning());
				   stat.setDiner(oriStat.getDiner());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "3" : stat.setDiner(oriStat.getDiner()-kcal+newKcal);
				   stat.setMorning(oriStat.getMorning());
				   stat.setLunch(oriStat.getLunch());
				   stat.setSnack(oriStat.getSnack());
				   break;
		case "4" : stat.setSnack(oriStat.getSnack()-kcal+newKcal);
				   stat.setMorning(oriStat.getMorning());
				   stat.setLunch(oriStat.getLunch());
				   stat.setDiner(oriStat.getDiner());
				   break;
		}
		

		mealService.updateStat(stat);
		
	}
	
	
	
}
