package kr.co.bitdaily.repository.vo;

import java.util.Date;

public class RecipeComment {
	// 유저 시퀀스 
    private Integer userSeq;

    // 레시피 시퀀스 
    private Integer recipeSeq;

    // 댓글 시퀀스 
    private Integer commentSeq;

    // 댓글 내용 
    private String commentText;

    // 댓글 작성시간 
    private Date commentDate;
    
    // 유저 네임
    private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Integer getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(Integer commentSeq) {
		this.commentSeq = commentSeq;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
}
