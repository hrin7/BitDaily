package kr.co.bitdaily.repository.vo;

import java.util.Date;

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
