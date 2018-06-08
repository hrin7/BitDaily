package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class Weight {
	
	int weightSeq;
	int userSeq;
	int currentWeight;
	int goalWeight;
	Date weightDate;
	
	
	public int getWeightSeq() {
		return weightSeq;
	}
	public void setWeightSeq(int weightSeq) {
		this.weightSeq = weightSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getCurrentWeight() {
		return currentWeight;
	}
	public void setCurrentWeight(int currentWeight) {
		this.currentWeight = currentWeight;
	}
	public int getGoalWeight() {
		return goalWeight;
	}
	public void setGoalWeight(int goalWeight) {
		this.goalWeight = goalWeight;
	}
	public Date getWeightDate() {
		return weightDate;
	}
	public void setWeightDate(Date weightDate) {
		this.weightDate = weightDate;
	}
	
	

	

}
