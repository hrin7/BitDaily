package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Food;

public interface MealMapper {

	List<Food> selectFood(String keyword);

}
