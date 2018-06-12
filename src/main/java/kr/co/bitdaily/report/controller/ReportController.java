package kr.co.bitdaily.report.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.report.service.ReportService;
import kr.co.bitdaily.repository.vo.Stat;

@Controller
@RequestMapping("/stat")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/report.do")
	@ResponseBody
	public List<Stat> selectStatByUserSeqAndDate(Stat stat) {
		System.out.println(stat.getUserSeq());
		return reportService.selectStatByUserSeqAndDate(stat);
	}
	
	@RequestMapping("/setWeek.json")
	public @ResponseBody Date[] setWeek() {
		return reportService.setWeek();
	}
	
	@RequestMapping("/prevWeek.json")
	public @ResponseBody Date[] prevWeek(@RequestParam("date") Date date) {
		return reportService.prevWeek(date);
	}
	@RequestMapping("/nextWeek.json")
	public @ResponseBody Date[] nextWeek(@RequestParam("date") Date date) {
		return reportService.nextWeek(date);
	}
}
