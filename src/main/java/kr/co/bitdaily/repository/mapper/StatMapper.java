package kr.co.bitdaily.repository.mapper;



import java.util.List;

import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.repository.vo.StatExercise;

public interface StatMapper {
	
	void insertStat(Stat stat);
	
	void updateStat(Stat stat);
	
	Stat selectStatByMealSeq(int mealSeq);
	
	List<Stat> selectStatByUserSeqAndDate(Stat stat);
	
	Stat selectByUserSeq(int userSeq);
	
	
	/* 운동 stat */
	StatExercise selectStatExeByUserSeq(int userSeq);
	void insertStatExercise(StatExercise statExe);
	void updateStatExercise(StatExercise statExe);
	StatExercise selectStatExeByDate(StatExercise statExe);
}
