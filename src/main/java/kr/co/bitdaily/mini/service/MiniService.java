package kr.co.bitdaily.mini.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;

public interface MiniService {
	public Member selectUsersSeq(String id) throws Exception;
	
	public Stat selectUserMeal(int userSeq) throws Exception;
	//도넛 차트
	public Stat selectMeal(int mealSeq) throws Exception;
	//도넛 차트
	public Meal selectUserDate(int userSeq) throws Exception;
}
