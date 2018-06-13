package kr.co.bitdaily.mini.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.mini.service.MiniService;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.repository.vo.StatExercise;

@Controller
@RequestMapping("/mini")
public class Mini {
	
	@Autowired
	private MiniService miniservice;
	
	@RequestMapping("/mini.json") 
	@ResponseBody 
	public Map<String, Integer> ministat(Member member) throws Exception { 
		System.out.println("session.Id " + member.getId()); //session.getId 확인 하기
		
		//세션에서 아이디 가져오기
		String id = member.getId();
		//아이디에 해당한 유저 정보
		Member userinfo = miniservice.selectUsersSeq(id);
		System.out.println("멤버 몸무게" + userinfo);
		
		//목표 칼로리
		int goalweight = userinfo.getGoalWeight();
		//하루 필요열량 Kal:
		int dailyKal = (goalweight * 31 ) - 500;
		
		
		Stat statMeal1= new Stat();
		statMeal1.setMealDate(new Date());
		statMeal1.setUserSeq(userinfo.getUserSeq());
		Stat statMeal= miniservice.selectUserDatePie(statMeal1);
		System.out.println(" ministat statMeal이 널인지" + statMeal);
		//하루 먹은 식단 :
		int dailyMeal = 0;
		if(statMeal != null) {
			dailyMeal = (int) statMeal.getMorning();
			dailyMeal += (int) statMeal.getLunch();
			dailyMeal += (int) statMeal.getDiner();
			dailyMeal += (int) statMeal.getSnack();
		}
		//남은 열량 칼로리
		int reCalories= dailyKal - dailyMeal + 100;
		
		//운동
		int userSeq = userinfo.getUserSeq();
		StatExercise statExercise = new StatExercise();
		statExercise.setExerciseDate(new Date());
		statExercise.setUserSeq(userSeq);
		StatExercise statExercise1= miniservice.selectUserExcerForMini(statExercise);
		int dailyExcer = 0;
		if(statExercise1 != null) {
			dailyExcer = statExercise1.getExerciseTime();
		}
		
		Map<String,Integer> result = new HashMap<>(); 
		result.put("dailyKal", dailyKal); 
		result.put("dailyMeal", dailyMeal); 
		result.put("dailyExcer", dailyExcer);
		result.put("reCalories", reCalories);
		
		return result; 
	}
	
	
	
	// 도넛 미니통계 
	@RequestMapping("/minidou.json") 
	@ResponseBody 
	public Map<String, Integer> miniDou(Member member) throws Exception {
		System.out.println("pi유저시퀀시" + member.getUserSeq());
		int userSeq = member.getUserSeq();
		Stat statMeal1= new Stat();
		statMeal1.setMealDate(new Date());
		statMeal1.setUserSeq(userSeq);
		
		Stat statMeal= miniservice.selectUserDatePie(statMeal1);
		double morning =  0;
		double lunch = 0;
		double dinner = 0;
		double snack = 0;
		if(statMeal != null) {
			morning =  statMeal.getMorning();
			lunch = statMeal.getLunch();
			dinner = statMeal.getDiner();
			snack = statMeal.getSnack();
		}
		
		
		int sum = (int) (morning + lunch + dinner + snack);
		int pmoring = 0;
		int plunch = 0;
		int pdinner = 0;
		int psnack = 0;
		if(sum > 0) {
			pmoring = (int) ((morning / sum) * 100);
			plunch = (int) ((lunch / sum) * 100);
			pdinner = (int) ((dinner / sum) * 100);
			psnack = (int) ((snack / sum) * 100);
		}
		
		Map<String,Integer> result = new HashMap<>(); 
		result.put("morning", pmoring); 
		result.put("lunch", plunch); 
		result.put("dinner", pdinner);
		result.put("snack", psnack);
		
		return result; 
		
	}
	
	
	
	
}












