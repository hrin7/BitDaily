package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class Exercise {
	// 유저 시퀀스 
    private Integer userSeq;

    // 운동 시간 
    private Integer exerciseTime;

    // 운동 날짜 
    private Date exerciseDate;
    
    // 운동 시퀀스 
    private Integer excerciseSeq;
    private Integer exerciseSeq;
    
    private Integer exerciseRecordSeq;

	public Integer getExerciseRecordSeq() {
		return exerciseRecordSeq;
	}

	public void setExerciseRecordSeq(Integer exerciseRecordSeq) {
		this.exerciseRecordSeq = exerciseRecordSeq;
	}

	public Integer getExerciseSeq() {
		return exerciseSeq;
	}

	public void setExerciseSeq(Integer exerciseSeq) {
		this.exerciseSeq = exerciseSeq;
	}

	// 운동이름 
    private String excerciseName;

    // 운동 칼로리 
    private Integer excerciseKcal;

	public Integer getExcerciseSeq() {
		return excerciseSeq;
	}

	public void setExcerciseSeq(Integer excerciseSeq) {
		this.excerciseSeq = excerciseSeq;
	}

	public String getExcerciseName() {
		return excerciseName;
	}

	public void setExcerciseName(String excerciseName) {
		this.excerciseName = excerciseName;
	}

	public Integer getExcerciseKcal() {
		return excerciseKcal;
	}

	public void setExcerciseKcal(Integer excerciseKcal) {
		this.excerciseKcal = excerciseKcal;
	}

	public Integer getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(Integer userSeq) {
		this.userSeq = userSeq;
	}

	public Integer getExerciseTime() {
		return exerciseTime;
	}

	public void setExerciseTime(Integer exerciseTime) {
		this.exerciseTime = exerciseTime;
	}

	public Date getExerciseDate() {
		return exerciseDate;
	}

	public void setExerciseDate(Date exerciseDate) {
		this.exerciseDate = exerciseDate;
	}

}
