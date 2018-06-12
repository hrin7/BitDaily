package kr.co.bitdaily.meal.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.Image;

import kr.co.bitdaily.repository.vo.Food;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.MealDetail;
import kr.co.bitdaily.repository.vo.Stat;

public interface MealService {

	List<Food> selectFood(String keyword);

	Meal selectMealSeq(Meal meal);

	void insertFood(MealDetail detail, int userSeq, Date mealDate);

	List<MealDetail> selectMealDetail(int mealSeq);
	
	String fileUpload(MultipartFile file, HttpServletRequest req) throws IllegalStateException, IOException;
	
	Image getImage(String filePath) throws IOException;

	void deleteMealDetail(int mealDetailSeq);
	
	MealDetail selectMealByDetailSeq(int mealDetailSeq);

	Stat selectStatByMealSeq(int mealSeq);

	void updateStat(Stat stat);

	void updateGramDetail(MealDetail detail);

	double getKcalByFoodSeq(int foodSeq);

}
