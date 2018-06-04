package kr.co.bitdaily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.RecipeMapper;
import kr.co.bitdaily.repository.vo.Recipe;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeMapper mapper;

	@Override
	public List<Recipe> retrieveListBoard(int pageNo) {
		return mapper.selectRecipe();
	}
	
}
