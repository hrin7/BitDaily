package kr.co.bitdaily.exercise.service;

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
		exeMapper.insertExercise(exercise);
		
		//통계테이블등록
		int userSeq = exercise.getUserSeq();
		int exeTime = exercise.getExerciseTime();
		
		StatExercise newStat = new StatExercise();
		newStat.setUserSeq(userSeq);
		newStat.setExerciseTime(exeTime);
		
		StatExercise statExe = statMapper.selectStatExeByUserSeq(userSeq);
		
		if(statExe == null) {
			statMapper.insertStatExercise(newStat);
		} else {
			newStat.setExerciseTime(statExe.getExerciseTime() + exeTime);
			statMapper.updateStatExercise(newStat);
		}
	}

	@Override
	public void deleteExercise(Exercise exercise) {
		exeMapper.deleteExercise(exercise);
	}

	@Override
	public void updateExercise(Exercise exercise) {
		exeMapper.updateExercise(exercise);
		
	}


}
