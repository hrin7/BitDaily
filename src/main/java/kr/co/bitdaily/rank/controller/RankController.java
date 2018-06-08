package kr.co.bitdaily.rank.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bitdaily.rank.service.RankService;
import kr.co.bitdaily.repository.vo.Dates;
import kr.co.bitdaily.repository.vo.Rank;

@RestController
@RequestMapping("/rank")
public class RankController {
	
	@Autowired
	private RankService service;
	
	@RequestMapping("/rank.do")
	public void rankPage() {}
	
	@RequestMapping("/rank.json")
	public @ResponseBody Map<String,List<Rank>> rankStat(Dates date) {
		System.out.println("들어옴");
		System.out.println("데이트 : "+ date.getStartDate().toString());
		System.out.println("데이트 : "+ date.getEndDate().toString());
		List<Rank> active = service.selectActive(date);
		List<Rank> exercise = service.selectExercise(date);
		List<Rank> weight = service.selectWeight(date);
		Map<String , List<Rank>> map = new HashMap<>();
		map.put("active", active);
		map.put("exercise", exercise);
		map.put("weight", weight);
		return map;
	}
	
	@RequestMapping("/setWeek.json")
	public @ResponseBody Date[] setWeek() {
		return service.setWeek();
	}
	
	@RequestMapping("/prevWeek.json")
	public @ResponseBody Date[] prevWeek(@RequestParam("date") Date date) {
		return service.prevWeek(date);
	}
	@RequestMapping("/nextWeek.json")
	public @ResponseBody Date[] nextWeek(@RequestParam("date") Date date) {
		return service.nextWeek(date);
	}
}
