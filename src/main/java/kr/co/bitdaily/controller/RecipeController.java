package kr.co.bitdaily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitdaily.service.BoardService;

@Controller
@RequestMapping("/board")
public class RecipeController {
	
	@Autowired
	private BoardService boardService;
	
	public ModelAndView retrieveListBoard(@RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		List<Board> list = 
	}
}
