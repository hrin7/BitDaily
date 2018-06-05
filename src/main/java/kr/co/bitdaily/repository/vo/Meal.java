package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class Meal {
	
	int mealSeq;
	int userSeq;
	Date mealDate;
	
	
	public int getMealSeq() {
		return mealSeq;
	}
	public void setMealSeq(int mealSeq) {
		this.mealSeq = mealSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public Date getMealDate() {
		return mealDate;
	}
	public void setMealDate(Date mealDate) {
		this.mealDate = mealDate;
	}
	
	

}
