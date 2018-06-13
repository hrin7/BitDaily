package kr.co.bitdaily.repository.mapper;



import java.util.List;

import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.repository.vo.StatExercise;

public interface StatMapper {
	
	void insertStat(Stat stat);
	
	void updateStat(Stat stat);
	
	Stat selectStatByMealSeq(int mealSeq);
	
	//pie
	Stat selectStatByDateUser(Stat stat);
	
	
	List<Stat> selectStatByUserSeqAndDate(Stat stat);
	
	Stat selectByUserSeq(int userSeq);
	
	
	/* 운동 stat */
	StatExercise selectStatExeByUserSeq(StatExercise statExe);
	void insertStatExercise(StatExercise statExe);
	void updateStatExercise(StatExercise statExe);
	StatExercise selectStatExeByDate(StatExercise statExe);
	StatExercise selectStatExeByDateUser(StatExercise statExe);
}
