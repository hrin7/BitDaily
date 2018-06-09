package kr.co.bitdaily.exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bitdaily.exercise.service.ExerciseService;
import kr.co.bitdaily.repository.vo.Exercise;

@RestController
@RequestMapping("/diary")
public class ExerciseController {
	
	@Autowired
	private ExerciseService exeService;

	@RequestMapping("/exeDiaryList.do")
	public List<Exercise> retrieveListExe(Exercise exe) {
		return exeService.retrieveListExe(exe);
	}
	
	@RequestMapping("/exeSearch.do")
	public List<Exercise> searchExercise(Exercise exe) {
		return exeService.searchExercise(exe.getExcerciseName());
	}
	
	@RequestMapping("/exeSearchName.do")
	public Exercise searchExerciseName(String excerciseName) {
		return exeService.searchExerciseName(excerciseName);
	}
	
	@RequestMapping("/exeInsert.do")
	public List<Exercise> insertExercise(Exercise exercise) {
		exeService.insertExercise(exercise);
		return exeService.retrieveListExe(exercise);
	}
	
	@RequestMapping("/exeDelete.do")
	public List<Exercise> deleteExercise(Exercise exercise) {
		exeService.deleteExercise(exercise);
		return exeService.retrieveListExe(exercise);
	}
	
	
}
