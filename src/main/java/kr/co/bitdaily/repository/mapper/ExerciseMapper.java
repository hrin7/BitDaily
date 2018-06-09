package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Exercise;

public interface ExerciseMapper {
	List<Exercise> selectExercise(Exercise exe);
	List<Exercise> searchExercise(String excerciseName);
	Exercise searchExerciseName(String excerciseName);
	void insertExercise(Exercise exercise);
	void deleteExercise(Exercise exercise);
}
