package kr.co.bitdaily.report.service;

import java.util.Date;
import java.util.List;

import kr.co.bitdaily.repository.vo.Stat;

public interface ReportService {
	public Date[] setWeek();
	public Date[] prevWeek(Date date);
	public Date[] nextWeek(Date date);
	
	List<Stat> selectStatByUserSeqAndDate(Stat stat);
}
