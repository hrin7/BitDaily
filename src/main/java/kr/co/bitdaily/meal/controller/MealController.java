package kr.co.bitdaily.meal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.meal.service.MealService;
import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.util.DiaryCalendar;

@Controller
@RequestMapping("/diary")
public class MealController {
	
	@Autowired
	private MealService mealService;
	
	@RequestMapping("/fooddiary.do")
	public void foodList() {
	}
	
	@RequestMapping("/fooddiary.json")
	@ResponseBody
	public Date mealListMove(@RequestParam String bntId, Date currentDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DiaryCalendar cal = new DiaryCalendar();
		Date date = null;
		if(bntId.equals("preDate")) {
			date = cal.getPreDate(currentDate);
		} else {
			if(sdf.format(new Date()).equals(sdf.format(currentDate))) {
				date = currentDate;
			}else {
				date = cal.getNextDate(currentDate);
			}
		}
		return date;
	}
	
	@RequestMapping("/mealSeq.json")
	@ResponseBody
	public Meal selectMealSeq(@RequestParam Date currentDate, HttpSession session) {
		Meal meal = new Meal();
		meal.setMealDate(currentDate);
		
		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		meal.setUserSeq(userSeq);
		
		Meal mealResult = mealService.selectMealSeq(meal);
		session.setAttribute("mealSeq", mealResult.getMealSeq());
		return mealResult;
	}
	
	
	@RequestMapping("/makeList.json")
	@ResponseBody
	public List<MealDetail> makeList(@RequestParam String userSeq , Date mealDate) {
		Meal meal = new Meal();
		meal.setUserSeq(Integer.parseInt(userSeq));
		meal.setMealDate(mealDate);
		meal = mealService.selectMealSeq(meal);
		return mealService.selectMealDetail(meal.getMealSeq());
	}
	
	
	@RequestMapping("/insertFood.json")
	@ResponseBody
	public void insertFood(@RequestParam Date mealDate, String userSeq, String mealType, String foodSeq , String mealGram, String filePath) {
		
		System.out.println("식사 날짜" + mealDate);
		System.out.println("유저 시퀀스" + userSeq);
		System.out.println("식사 타입" + mealType);
		System.out.println("음식 시퀀스" + foodSeq);
		System.out.println("식사 그람" + mealGram);
		System.out.println("파일" + filePath);
		
		Meal meal = new Meal();
		meal.setUserSeq(Integer.parseInt(userSeq));
		meal.setMealDate(mealDate);
		meal = mealService.selectMealSeq(meal);
		
		MealDetail detail = new MealDetail();
		detail.setMealSeq(meal.getMealSeq());
		detail.setMealType(mealType);
		detail.setFoodSeq(Integer.parseInt(foodSeq));
		detail.setMealGram(Integer.parseInt(mealGram));
		detail.setFilePath(filePath);
		mealService.insertFood(detail, Integer.parseInt(userSeq));
		
		
//		MealDetail detail = new MealDetail();
//		detail.setMealSeq(mealSeq);
//		detail.setMealType(mealType);
//		detail.setFoodSeq(foodSeq);
//		detail.setMealGram(Integer.parseInt(mealGram));
//		detail.setFilePath(filePath);
//		Member member = (Member) session.getAttribute("member");
//		int userSeq = member.getUserSeq();
//		mealService.insertFood(detail, userSeq);
	}
	
	
	@RequestMapping("/foodSearch.json")
	@ResponseBody
	public List<Food> foodSearch(@RequestParam String keyword) {
		System.out.println("서칭 작동중...............");
		System.out.println("키워드 명 : " + keyword);
		return mealService.selectFood(keyword);
	}
	
	
	
}
