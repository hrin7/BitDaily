package kr.co.bitdaily.recipe.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitdaily.recipe.service.RecipeService;
import kr.co.bitdaily.repository.vo.Recipe;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping("/list.do")
	public ModelAndView retrieveListRecipe(@RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		ModelAndView mav = new ModelAndView("recipe/recipeList");
		mav.addObject("result", recipeService.retrieveListRecipe(pageNo));
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
}
