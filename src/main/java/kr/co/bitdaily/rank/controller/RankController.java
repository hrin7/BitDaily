package kr.co.bitdaily.rank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bitdaily.rank.service.RankService;
import kr.co.bitdaily.repository.vo.Rank;
import kr.co.bitdaily.repository.vo.Week;

@RestController
@RequestMapping("/stat")
public class RankController {
	
	@Autowired
	private RankService rankService;
	
	@RequestMapping("/rank.do")
	public void rankPage() {}
	
	@RequestMapping("rank.json")
	public @ResponseBody Map<String,List<Rank>> rankStat(Week week) {
		List<Rank> calorie = rankService.selectCalorie(week);
		List<Rank> exercise = rankService.selectExercise(week);
		List<Rank> weight = rankService.selectWeight(week);
		Map<String , List<Rank>> map = new HashMap<>();
		map.put("calorie", calorie);
		map.put("exercise", exercise);
		map.put("weight", weight);
		return map;
	}
}
