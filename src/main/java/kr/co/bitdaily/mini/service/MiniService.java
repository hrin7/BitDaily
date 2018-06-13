package kr.co.bitdaily.mini.service;




import kr.co.bitdaily.repository.vo.Meal;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;
import kr.co.bitdaily.repository.vo.StatExercise;

public interface MiniService {
	public Member selectUsersSeq(String id) throws Exception;
	//운동
	public StatExercise selectUserExcerForMini(StatExercise statExercise) throws Exception;
	
	public Stat selectUserMeal(int userSeq) throws Exception;
	//도넛 차트
	public Stat selectMeal(int mealSeq) throws Exception;
	//도넛 차트
	public Meal selectUserDate(int userSeq) throws Exception;
	//도넛차트
	public Stat selectUserDatePie(Stat stat) throws Exception;
}
