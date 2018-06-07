package kr.co.bitdaily.recipe.service;

import java.util.Map;

import kr.co.bitdaily.repository.vo.Recipe;

public interface RecipeService {
	Map<String,Object> retrieveListRecipe(int pageNo);
	Map<String,Object> detailRecipe(int recipeSeq);
	void writeRecipe(Recipe recipe) throws Exception;
	void deleteRecipe(int recipeSeq);
	Recipe updateFormRecipe(int recipeSeq);
	void updateRecipe(Recipe recipe);
}
