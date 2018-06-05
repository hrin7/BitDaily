package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.repository.vo.RecipeFile;

public interface RecipeMapper {
	List<Recipe> selectRecipe();
	Recipe selectRecipeByNo(int recipeSeq);
	void insertRecipe(Recipe recipe);
	
	List<RecipeFile> selectRecipeFileByNo(int recipeSeq);
	void insertRecipeFile(RecipeFile recipeFile);
}
