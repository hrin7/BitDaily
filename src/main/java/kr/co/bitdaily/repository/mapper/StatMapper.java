package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Stat;

public interface StatMapper {
	
	void insertStat(Stat stat);
	
	void updateStat(Stat stat);
	
	Stat selectStatByMealSeq(int mealSeq);
	
	List<Stat> selectByUserSeq(int userSeq);

}
