package kr.co.bitdaily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping("/list.do")
	public ModelAndView retrieveListBoard(@RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		List<Recipe> list = recipeService.retrieveListBoard(pageNo);
		ModelAndView mav = new ModelAndView("recipe/recipeList");
		mav.addObject("list", list);
		return mav;
	}
}
