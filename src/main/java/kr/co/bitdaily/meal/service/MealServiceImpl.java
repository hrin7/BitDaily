package kr.co.bitdaily.meal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void insertFood(MealDetail detail, int userSeq) {
		
		//식단등록
		mealMapper.insertMealDetail(detail);
		
		//통계테이블등록
		int mealSeq = detail.getMealSeq();
		
		Stat newStat = new Stat();
		newStat.setMealSeq(mealSeq);
		newStat.setUserSeq(userSeq);
		
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
