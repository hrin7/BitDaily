package kr.co.bitdaily.recipe.service;

import java.util.List;
import java.util.Map;

import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.repository.vo.RecipeComment;

public interface RecipeService {
	Map<String,Object> retrieveListRecipe(int pageNo);
	Map<String,Object> detailRecipe(int recipeSeq);
	void writeRecipe(Recipe recipe) throws Exception;
	void deleteRecipe(int recipeSeq);
	Recipe updateFormRecipe(int recipeSeq);
	void updateRecipe(Recipe recipe);
	
	List<RecipeComment> retrieveListComment(int recipeSeq);
}
