package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.repository.vo.RecipeComment;
import kr.co.bitdaily.repository.vo.RecipeFile;

public interface RecipeMapper {
	int selectRecipeCount(Recipe recipe);
	List<Recipe> selectRecipe(Recipe recipe);
	Recipe selectRecipeByNo(int recipeSeq);
	void insertRecipe(Recipe recipe);
	void deleteRecipe(int recipeSeq);
	void updateRecipe(Recipe recipe);
	void updateRecipeViewCnt(int recipeSeq);
	List<Recipe> searchRecipeByTitle(String title);
	
	int selectRecipeCommentCount(int recipeSeq);
	List<RecipeFile> selectRecipeFileByNo(int recipeSeq);
	void insertRecipeFile(RecipeFile recipeFile);
	
	List<RecipeComment> selectCommentByNo(int recipeSeq);
	void insertComment(RecipeComment recipeComment);
	void deleteComment(int commentSeq);
	void updateComment(RecipeComment recipeComment);
}
