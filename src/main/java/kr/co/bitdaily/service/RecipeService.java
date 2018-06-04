package kr.co.bitdaily.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bitdaily.repository.vo.Recipe;

public interface RecipeService {
	List<Recipe> retrieveListBoard(int pageNo);
}
