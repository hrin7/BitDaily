package kr.co.bitdaily.meal.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;

public interface MealService {

	List<Food> selectFood(String keyword);

	Meal selectMealSeq(Meal meal);

	void insertFood(MealDetail detail, int userSeq);

	List<MealDetail> selectMealDetail(int mealSeq);

}
