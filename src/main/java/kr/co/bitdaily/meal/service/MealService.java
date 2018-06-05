package kr.co.bitdaily.meal.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Food;

public interface MealService {

	List<Food> selectFood(String keyword);

}
