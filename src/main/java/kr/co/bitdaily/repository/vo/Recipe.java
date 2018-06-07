package kr.co.bitdaily.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Recipe {
	// 유저 시퀀스 
    private Integer userSeq;

    // 레시피 시퀀스 
    private Integer recipeSeq;

    // 레시피 제목 
    private String title;

    // 레시피 내용 
    private String content;

    // 레시피 작성 날짜 
    private Date recipeDate;

    // 조회수 
    private Integer viewCount;

    // 파일 시퀀스 
    private Integer fileSeq;
    
    // 유저 네임
    private String name;
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private MultipartFile[] file;
    
    private List<RecipeFile> fileList;

	public List<RecipeFile> getFileList() {
		return fileList;
	}

	public void setFileList(List<RecipeFile> fileList) {
		this.fileList = fileList;
	}

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	public Integer getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(Integer userSeq) {
		this.userSeq = userSeq;
	}

	public Integer getRecipeSeq() {
		return recipeSeq;
	}

	public void setRecipeSeq(Integer recipeSeq) {
		this.recipeSeq = recipeSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRecipeDate() {
		return recipeDate;
	}

	public void setRecipeDate(Date recipeDate) {
		this.recipeDate = recipeDate;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(Integer fileSeq) {
		this.fileSeq = fileSeq;
	}
}
