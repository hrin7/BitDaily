package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;

public interface MealMapper {

	List<Food> selectFood(String keyword);
	double getFoodKcal(int foodSeq);
	
	
	Meal selectMealSeq(Meal meal);
	void insertMealSeq(Meal meal);
	void insertMealDetail(MealDetail detail);
	List<MealDetail> selectMealDetail(int mealSeq);


}
