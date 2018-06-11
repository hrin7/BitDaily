package kr.co.bitdaily.recipe.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitdaily.recipe.service.RecipeService;
import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.repository.vo.RecipeComment;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
//	@RequestMapping("/searchList.do")
//	@ResponseBody
//	public List<Recipe> searchRecipeByTitle(Recipe recipe) {
//		System.out.println(recipe.getTitle());
//		System.out.println(recipeService.searchRecipeByTitle(recipe.getTitle()));
//		return recipeService.searchRecipeByTitle(recipe.getTitle());
//	}
	
	@RequestMapping("/searchList.do")
	public String searchRecipeByTitle(Recipe recipe, Model model) {
		System.out.println(recipe.getTitle());
		System.out.println(recipeService.searchRecipeByTitle(recipe.getTitle()));
		model.addAttribute("list", recipeService.searchRecipeByTitle(recipe.getTitle()));
		return "/recipe/searchRecipeList";
	}
	
	@RequestMapping("/list.do")
	public ModelAndView retrieveListRecipe(@ModelAttribute("recipe") Recipe recipe,
            @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		ModelAndView mav = new ModelAndView("recipe/recipeList");
		mav.addObject("result", recipeService.retrieveListRecipe(recipe));
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView detailRecipe(int recipeSeq) {
		Map<String, Object> recipe = recipeService.detailRecipe(recipeSeq);
		ModelAndView mav = new ModelAndView("recipe/recipeDetail");
		mav.addObject("recipe", recipe.get("recipe"));
		mav.addObject("fileList", recipe.get("fileList"));
		return mav;
	}
	
	@RequestMapping("/write.do")
	public String writeRecipe(Recipe recipe) throws Exception {
		recipeService.writeRecipe(recipe);
		return "redirect:/recipe/list.do"; 
	}

	@RequestMapping("/delete.do")
	public String deleteRecipe(int recipeSeq) {
		recipeService.deleteRecipe(recipeSeq);
		return "redirect:/recipe/list.do";
	}
	
	@RequestMapping("/updateForm.do")
	public String updateFormRecipe(int recipeSeq, Model model) {
		model.addAttribute("recipe", recipeService.updateFormRecipe(recipeSeq));
		return "recipe/recipeUpdateForm";
	}
	
	@RequestMapping("/update.do")
	public String updateRecipe(Recipe recipe) {
		recipeService.updateRecipe(recipe);
		return "redirect:/recipe/detail.do?recipeSeq=" + recipe.getRecipeSeq();
	}
	
	@RequestMapping("/commentList.do")
	@ResponseBody
	public List<RecipeComment> retrieveListComment(int recipeSeq) {
		return recipeService.retrieveListComment(recipeSeq);
	}
	
	@RequestMapping("/commentWrite.do")
	@ResponseBody 
	public List<RecipeComment> writeComment(RecipeComment recipeComment) {
		recipeService.writeComment(recipeComment);
		return recipeService.retrieveListComment(recipeComment.getRecipeSeq());
	}
	
	@RequestMapping("/commentDelete.do")
	@ResponseBody
	public List<RecipeComment> deleteComment(RecipeComment recipeComment) {
		recipeService.deleteComment(recipeComment.getCommentSeq());
		return recipeService.retrieveListComment(recipeComment.getRecipeSeq());
	}
	
	@RequestMapping("/commentUpdate.do")
	@ResponseBody
	public List<RecipeComment> updateComment(RecipeComment recipeComment) {
		recipeService.updateComment(recipeComment);
		return recipeService.retrieveListComment(recipeComment.getRecipeSeq());
	}
}
