package kr.co.bitdaily.repository.vo;

public class RecipeFile {
	// 레시피 시퀀스 
    private Integer recipeSeq;

	// 파일 시퀀스 
    private Integer fileSeq;

    // 파일 경로 
    private String filePath;

    // 파일 시스템이름 
    private String fileSysName;
    
    // 파일 오리지널이름 
    private String fileOriName;

    public String getFileOriName() {
		return fileOriName;
	}

	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}

	public Integer getRecipeSeq() {
    	return recipeSeq;
    }
    
    public void setRecipeSeq(Integer recipeSeq) {
    	this.recipeSeq = recipeSeq;
    }
    
	public Integer getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(Integer fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileSysName() {
		return fileSysName;
	}

	public void setFileSysName(String fileSysName) {
		this.fileSysName = fileSysName;
	}
}
