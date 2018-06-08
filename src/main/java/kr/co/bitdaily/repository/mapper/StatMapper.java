package kr.co.bitdaily.repository.mapper;



import kr.co.bitdaily.repository.vo.Stat;

public interface StatMapper {
	
	void insertStat(Stat stat);
	
	void updateStat(Stat stat);
	
	Stat selectStatByMealSeq(int mealSeq);
	
	Stat selectByUserSeq(int userSeq);

}
