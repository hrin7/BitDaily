package kr.co.bitdaily.repository.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("dates")
public class Dates {
	private Date startDate;
	private Date endDate;
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}
