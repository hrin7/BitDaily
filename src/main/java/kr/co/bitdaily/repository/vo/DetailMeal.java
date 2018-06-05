package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class DetailMeal {
	
	int mealSeq;
	int mealDetailSeq;
	String mealType;
	Date regTime;
	int foodSeq;
	int mealGram;
	String filePath;
	
	
	public int getMealSeq() {
		return mealSeq;
	}
	public void setMealSeq(int mealSeq) {
		this.mealSeq = mealSeq;
	}
	public int getMealDetailSeq() {
		return mealDetailSeq;
	}
	public void setMealDetailSeq(int mealDetailSeq) {
		this.mealDetailSeq = mealDetailSeq;
	}
	public String getMealType() {
		return mealType;
	}
	public void setMealType(String mealType) {
		this.mealType = mealType;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public int getFoodSeq() {
		return foodSeq;
	}
	public void setFoodSeq(int foodSeq) {
		this.foodSeq = foodSeq;
	}
	public int getMealGram() {
		return mealGram;
	}
	public void setMealGram(int mealGram) {
		this.mealGram = mealGram;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	

}
