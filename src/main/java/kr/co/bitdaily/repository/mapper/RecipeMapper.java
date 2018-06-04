package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Recipe;

public interface RecipeMapper {
	List<Recipe> selectRecipe();
}
