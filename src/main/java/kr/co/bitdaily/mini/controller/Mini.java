package kr.co.bitdaily.mini.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.mini.service.MiniService;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;

@Controller
@RequestMapping("/mini")
public class Mini {
	
	
	
	@Autowired
	private MiniService miniservice;
	
	
	@RequestMapping("/mini.json") 
	@ResponseBody 
	public Map<String, Integer> ministat(Member member) throws Exception { 
		int dailyMeal = 0;
		System.out.println("session.Id " + member.getId()); //session.getId 확인 하기
		
		//세션에서 아이디 가져오기
		String id = member.getId();
		
		Member userinfo = miniservice.selectUsersSeq(id);
		//목표 칼로리
		int goalweight = userinfo.getGoalWeight();
		//하루 필요열량 Kal:
		int dailyKal = (goalweight * 31 ) - 500;
		//하루 먹은 식단 :
		int userSeq = userinfo.getUserSeq();
		List<Stat> statList = miniservice.selectUserMeal(userSeq);
		
		for(Stat dailMeal : statList) {
			dailyMeal = (int) dailMeal.getMorning();
			dailyMeal += (int) dailMeal.getLunch();
			dailyMeal += (int) dailMeal.getDiner();
			dailyMeal += (int) dailMeal.getSnack();
		}
		//남은 열량 칼로리
		int reCalories= dailyKal - dailyMeal + 100;
		
		//운동잠시 임시로 100줌.
		Map<String,Integer> result = new HashMap<>(); 
		result.put("dailyKal", dailyKal); 
		result.put("dailyMeal", dailyMeal); 
		result.put("dailyExcer", 100);
		result.put("reCalories", reCalories);
		
		return result; 
	}
	
}
