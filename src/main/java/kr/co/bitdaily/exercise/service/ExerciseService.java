package kr.co.bitdaily.exercise.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Exercise;

public interface ExerciseService {
	List<Exercise> retrieveListExe(Exercise exe);
	List<Exercise> searchExercise(String excerciseName);
	Exercise searchExerciseName(String excerciseName);
	void insertExercise(Exercise Exercise);
}
