package kr.co.bitdaily.recipe.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitdaily.repository.mapper.RecipeMapper;
import kr.co.bitdaily.repository.vo.PageResult;
import kr.co.bitdaily.repository.vo.Recipe;
import kr.co.bitdaily.repository.vo.RecipeComment;
import kr.co.bitdaily.repository.vo.RecipeFile;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeMapper mapper;

	@Override
	public Map<String,Object> retrieveListRecipe(Recipe recipe) {
		recipe.setPageNo(recipe.getPageNo());
		int commentCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		List<Recipe> recipes = mapper.selectRecipe(recipe);
		for (Recipe r : recipes) {
			List<RecipeFile> fileList = mapper.selectRecipeFileByNo(r.getRecipeSeq());
			r.setFileList(fileList);
			commentCount = mapper.selectRecipeCommentCount(r.getRecipeSeq());
			r.setCommentCount(commentCount);
		}
		int count = mapper.selectRecipeCount(recipe);
		
		map.put("list", recipes);
		map.put("pageResult", new PageResult(recipe.getPageNo(), count));
		return map;
	}

	@Override
	public Map<String,Object> detailRecipe(int recipeSeq) {
		mapper.updateRecipeViewCnt(recipeSeq);
		Map<String, Object> map = new HashMap<>();
		map.put("recipe", mapper.selectRecipeByNo(recipeSeq));
		map.put("fileList", mapper.selectRecipeFileByNo(recipeSeq));
		return map;
	}

	@Override
	public void writeRecipe(Recipe recipe) throws Exception {
		mapper.insertRecipe(recipe);
		
//		System.out.println(recipe.getFile());
		for (MultipartFile file : recipe.getFile()) {
			String oriFileName = file.getOriginalFilename();
			if(oriFileName != null && !oriFileName.equals("")) {
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				// 고유한 파일명 만들기	
				String saveFileName = "recipe-" + UUID.randomUUID().toString() + ext;
//				System.out.println("저장할 파일명 : " + saveFileName);
				
				// 임시저장된 파일을 원하는 경로에 저장
				File f = new File("C:/java-lec/git/spring-bitdaily/src/main/webapp/images/recipe");
				if (!f.exists()) f.mkdirs();
				file.transferTo(new File(f, file.getOriginalFilename()));
				
				// 데이터베이스에 파일 정보 저장
				RecipeFile recipeFile = new RecipeFile();
				recipeFile.setRecipeSeq(recipe.getRecipeSeq());
				recipeFile.setFilePath("/images/recipe");
				recipeFile.setFileSysName(saveFileName);
				recipeFile.setFileOriName(file.getOriginalFilename());
				
				mapper.insertRecipeFile(recipeFile);
			}
		}
	}
	
	@Override
	public void deleteRecipe(int recipeSeq) {
		mapper.deleteRecipe(recipeSeq);
	}

	@Override
	public Recipe updateFormRecipe(int recipeSeq) {
		return mapper.selectRecipeByNo(recipeSeq);
	}

	@Override
	public void updateRecipe(Recipe recipe) {
		mapper.updateRecipe(recipe);
	}

	@Override
	public List<RecipeComment> retrieveListComment(int recipeSeq) {
		return mapper.selectCommentByNo(recipeSeq);
	}

	@Override
	public void writeComment(RecipeComment recipeComment) {
		mapper.insertComment(recipeComment);
	}

	@Override
	public void deleteComment(int commentSeq) {
		mapper.deleteComment(commentSeq);
	}

	@Override
	public void updateComment(RecipeComment recipeComment) {
		mapper.updateComment(recipeComment);
	}
	
}
