package kr.co.bitdaily.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bitdaily.report.service.ReportService;

@Controller
@RequestMapping("/stat")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/report.do")
	public String selectStatByMealSeq(@RequestParam(value="mealSeq") int mealSeq, Model model) {
		model.addAttribute("stat", reportService.selectStatByMealSeq(mealSeq));
		return "/stat/report";
	}
}
