package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class Stat {
	
	int mealSeq;
	int userSeq;
	double morning;
	double lunch;
	double diner;
	double snack;
	Date mealDate;
	Date startDate;
	Date endDate;
	
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getMealDate() {
		return mealDate;
	}
	public void setMealDate(Date mealDate) {
		this.mealDate = mealDate;
	}
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
	public double getMorning() {
		return morning;
	}
	public void setMorning(double morning) {
		this.morning = morning;
	}
	public double getLunch() {
		return lunch;
	}
	public void setLunch(double lunch) {
		this.lunch = lunch;
	}
	public double getDiner() {
		return diner;
	}
	public void setDiner(double diner) {
		this.diner = diner;
	}
	public double getSnack() {
		return snack;
	}
	public void setSnack(double snack) {
		this.snack = snack;
	}
	@Override
	public String toString() {
		return "Stat [mealSeq=" + mealSeq + ", userSeq=" + userSeq + ", morning=" + morning + ", lunch=" + lunch
				+ ", diner=" + diner + ", snack=" + snack + ", mealDate=" + mealDate + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}
	

	
}
