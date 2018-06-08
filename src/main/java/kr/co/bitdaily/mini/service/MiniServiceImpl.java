package kr.co.bitdaily.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MealMapper;
import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;

@Service("miniService")
public class MiniServiceImpl implements MiniService{
	
	@Autowired
	private MemberMapper mapper;
	public Member selectUsersSeq(String id) throws Exception {
		return mapper.selectUserSeq(id);
	}
	
	@Autowired
	private StatMapper statmapper;
	public Stat selectUserMeal(int userSeq) throws Exception {
		return statmapper.selectByUserSeq(userSeq);
	}
	//도너차트
	public Stat selectMeal(int mealSeq) throws Exception {
		return statmapper.selectStatByMealSeq(mealSeq);
	}
	
	//도넛차트
	@Autowired
	private MealMapper mealmapper;
	public Meal selectUserDate(int userSeq) throws Exception {
		return mealmapper.selectByUserSeq(userSeq);
	}
	
	
	
//	Stat selectStatByMealSeq(int mealSeq);
	
	
	
	
	
}
