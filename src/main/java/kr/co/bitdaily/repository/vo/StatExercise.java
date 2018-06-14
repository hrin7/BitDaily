package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class StatExercise {
	// 유저 시퀀스 
    private Integer userSeq;

    // 금일 운동 총시간 
    private Integer exerciseTime;

    // 금일 운동 날짜 
    private Date exerciseDate;
    
    // 금일 운동 총 칼로리
    private Integer excerciseKcal;

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
