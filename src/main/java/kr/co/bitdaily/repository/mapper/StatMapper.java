package kr.co.bitdaily.repository.mapper;



import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.repository.vo.StatExercise;

public interface StatMapper {
	
	void insertStat(Stat stat);
	
	void updateStat(Stat stat);
	
	Stat selectStatByMealSeq(int mealSeq);
	
	Stat selectByUserSeq(int userSeq);
	
	
	/* 운동 stat */
	StatExercise selectStatExeByUserSeq(int userSeq);
	void insertStatExercise(StatExercise statExe);
	void updateStatExercise(StatExercise statExe);
	StatExercise selectStatExeByDate(StatExercise statExe);
}
