package kr.co.bitdaily.meal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitdaily.meal.service.MealService;
import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.util.DiaryCalendar;

@Controller
@RequestMapping("/meal")
public class MealController {
	
	@Autowired
	private MealService mealService;
	
	@RequestMapping(value="/mealList.do", method=RequestMethod.GET)
	public ModelAndView mealList() {
		ModelAndView mav = new ModelAndView("diary/fooddiary");
		DiaryCalendar cal = new DiaryCalendar();
		mav.addObject("date", cal.getTodayDate());
		return mav;
	}
	
	@RequestMapping("/mealList.json")
	@ResponseBody
	public Date mealListMove(@RequestParam String bntId, Date currentDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DiaryCalendar cal = new DiaryCalendar();
		Date date = null;
		if(bntId.equals("preDate")) {
			date = cal.getPreDate(currentDate);
//			Meal meal = new Meal();
//			meal.setUserSeq(1234);
//			meal.setMealDate(date);
//			mealService.selectMealSeq(meal);
		} else {
			System.out.println(sdf.format(new Date()));
			System.out.println(sdf.format(currentDate));
			if(sdf.format(new Date()).equals(sdf.format(currentDate))) {
				System.out.println("이퀄");
				date = currentDate;
			}else {
				System.out.println("엘스");
				date = cal.getNextDate(currentDate);
			}
		}
		return date;
	}
	
	@RequestMapping("/foodSearch.json")
	@ResponseBody
	public List<Food> foodSearch(@RequestParam String keyword) {
		return mealService.selectFood(keyword);
	}

}
