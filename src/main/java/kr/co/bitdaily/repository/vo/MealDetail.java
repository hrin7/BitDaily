package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class MealDetail {
	
	int mealSeq;
	int mealDetailSeq;
	String mealType;
	Date regTime;
	int foodSeq;
	double mealGram;
	String filePath;
	
	/*
	  mealType
	  1 : 아침
	  2 : 점심
	  3 : 저녁
	  4 : 간식 
	 */
	
	
	
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
	public double getMealGram() {
		return mealGram;
	}
	public void setMealGram(double mealGram) {
		this.mealGram = mealGram;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	

	

}
