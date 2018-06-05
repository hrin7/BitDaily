package kr.co.bitdaily.meal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MealMapper;
import kr.co.bitdaily.repository.vo.Food;

@Service
public class MealServiceImpl implements MealService {
	
	@Autowired
	private MealMapper mapper;
	
	@Override
	public List<Food> selectFood(String keyword) {
		return mapper.selectFood(keyword);
	}
}
