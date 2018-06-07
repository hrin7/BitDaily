package kr.co.bitdaily.meal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	
	/*
	@RequestMapping("/makeList.json")
	@ResponseBody
	public List<MealDetail> makeList(@RequestParam int userSeq) {

		return mealService.selectMealDetail(userSeq);
	}
	*/
	
	@RequestMapping("/insertFood.json")
	@ResponseBody
	public void insertFood(@RequestParam int mealSeq, String mealType, int foodSeq, String mealGram, String filePath, HttpSession session) {
		MealDetail detail = new MealDetail();
		detail.setMealSeq(mealSeq);
		detail.setMealType(mealType);
		detail.setFoodSeq(foodSeq);
		detail.setMealGram(Integer.parseInt(mealGram));
		detail.setFilePath(filePath);
		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		mealService.insertFood(detail, userSeq);
	}
	
	
	@RequestMapping("/foodSearch.json")
	@ResponseBody
	public List<Food> foodSearch(@RequestParam String keyword) {
		return mealService.selectFood(keyword);
	}

}
