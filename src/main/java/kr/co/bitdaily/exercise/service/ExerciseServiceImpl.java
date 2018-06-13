package kr.co.bitdaily.exercise.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.ExerciseMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Exercise;
import kr.co.bitdaily.repository.vo.StatExercise;

@Service
public class ExerciseServiceImpl implements ExerciseService {
	
	@Autowired
	private ExerciseMapper exeMapper;
	@Autowired
	private StatMapper statMapper;
	
	@Override
	public List<Exercise> retrieveListExe(Exercise exe) {
		return exeMapper.selectExercise(exe);
	}

	@Override
	public List<Exercise> searchExercise(String excerciseName) {
		return exeMapper.searchExercise(excerciseName);
	}

	@Override
	public Exercise searchExerciseName(String excerciseName) {
		return exeMapper.searchExerciseName(excerciseName);
	}

	@Override
	public void insertExercise(Exercise exercise) {
		// 운동 vo가 넘어온다 
		// 유저시퀀스랑 날짜를 받아서 tb_exercise_record 테이블 select 그 운동에 대한 타입이 존재하는지.
		Exercise exe = exeMapper.selecteExeRecByUserAndExe(exercise);
		// 등록할 운동시간
		int updateExeTime = exercise.getExerciseTime();
		// 없으면 insert문 작동 , 있으면 업데이트 
		if (exe == null) {
			exeMapper.insertExercise(exercise);
		} else {
			int oriExeTime = exe.getExerciseTime();
			System.out.println("원래운동시간" + oriExeTime);
			exercise.setExerciseTime(updateExeTime + oriExeTime);
			System.out.println("등록할 운동시간"+updateExeTime);
			exercise.setExerciseRecordSeq(exe.getExerciseRecordSeq());
			exeMapper.updateExercise(exercise);
		}
		
		//통계테이블등록
		int userSeq = exercise.getUserSeq();
		int exeTime = exercise.getExerciseTime();
		Date exeDate = exercise.getExerciseDate();
		
		StatExercise newStat = new StatExercise();
		newStat.setUserSeq(userSeq);
		newStat.setExerciseTime(exeTime);
		newStat.setExerciseDate(exeDate);
		
		StatExercise statExe = statMapper.selectStatExeByUserSeq(newStat);
		
		if(statExe == null) {
			statMapper.insertStatExercise(newStat);
		} else {
			newStat.setExerciseTime(statExe.getExerciseTime() + updateExeTime);
			statMapper.updateStatExercise(newStat);
		}
	}

	@Override
	public void deleteExercise(Exercise exercise) {
		exeMapper.deleteExercise(exercise);
		
		// 통계데이터 삭제
		int userSeq = exercise.getUserSeq();
		int exeTime = exercise.getExerciseTime();
		Date exeDate = exercise.getExerciseDate();
		
		StatExercise newStat = new StatExercise();
		newStat.setUserSeq(userSeq);
		newStat.setExerciseTime(exeTime);
		newStat.setExerciseDate(exeDate);
		
		StatExercise statExe = statMapper.selectStatExeByUserSeq(newStat);
		
		newStat.setExerciseTime(statExe.getExerciseTime() - exeTime);
		statMapper.updateStatExercise(newStat);
	}

	@Override
	public void updateExercise(Exercise exercise) {
		// 운동 vo가 들어온다.
		// 유저시퀀스, 날짜, 운동시퀀스을 받아서 tb_exercise_record 테이블 select 해서 해당하는 운동의 시간을 얻어온다.
		Exercise exe = exeMapper.selecteExeRecByUserAndExe2(exercise);
		// tb_stat_exercise 테이블을 update 작동시키는데 set에 select해온 시간을  빼고 파라마터로 받은 운동 vo에 있는 시간 값을 더 한다.
		// 원래 운동시간
		int oriExeTime = exe.getExerciseTime();
		System.out.println("원래운동시간"+oriExeTime);
		
		//통계테이블 업데이트
		int userSeq = exercise.getUserSeq();
		int exeTime = exercise.getExerciseTime(); // 받아온 운동시간
		Date exeDate = exercise.getExerciseDate();
		System.out.println("jsp에서 받아온 운동시간"+exeTime);
		
		StatExercise newStat = new StatExercise();
		newStat.setUserSeq(userSeq);
		newStat.setExerciseTime(exeTime);  // 새로운 객체에 받아온 운동시간을 set해준다.
		newStat.setExerciseDate(exeDate);
		
		StatExercise statExe = statMapper.selectStatExeByUserSeq(newStat);
		
		newStat.setExerciseTime(statExe.getExerciseTime() - oriExeTime + exeTime);
		statMapper.updateStatExercise(newStat);
		
		exeMapper.updateExercise(exercise);
	}


}
