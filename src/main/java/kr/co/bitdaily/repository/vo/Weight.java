package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class Weight {
	
	int userSeq;
	Date recordDate;
	int recordWeight;
	
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public int getRecordWeight() {
		return recordWeight;
	}
	public void setRecordWeight(int recordWeight) {
		this.recordWeight = recordWeight;
	}
	
	

}
