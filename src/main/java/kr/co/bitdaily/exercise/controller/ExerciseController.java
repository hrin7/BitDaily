package kr.co.bitdaily.exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.exercise.service.ExerciseService;
import kr.co.bitdaily.repository.vo.Exercise;

@Controller
@RequestMapping("/diary")
public class ExerciseController {
	
	@Autowired
	private ExerciseService exeService;

	@RequestMapping("/exeDiaryList.do")
	@ResponseBody
	public List<Exercise> retrieveListExe(Exercise exe) {
		return exeService.retrieveListExe(exe);
	}
	
	@RequestMapping("/exeSearch.do")
	@ResponseBody
	public List<Exercise> searchExercise(Exercise exe) {
		return exeService.searchExercise(exe.getExcerciseName());
	}
	
	@RequestMapping("/exeSearchName.do")
	@ResponseBody
	public Exercise searchExerciseName(String excerciseName) {
		return exeService.searchExerciseName(excerciseName);
	}
	
	@RequestMapping("/exeInsert.do")
	@ResponseBody
	public List<Exercise> insertExercise(Exercise Exercise) {
		exeService.insertExercise(Exercise);
		return exeService.retrieveListExe(Exercise);
	}
	
	
}
