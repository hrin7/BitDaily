package kr.co.bitdaily.report.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Stat;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private StatMapper mapper;

	@Override
	public List<Stat> selectStatByUserSeqAndDate(Stat stat) {
		return mapper.selectStatByUserSeqAndDate(stat);
	}

	@Override
	public Date[] setWeek() {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_WEEK);
		if(day > 1) {
			Date[] weekDate = new Date[7];
			cal.add(Calendar.DATE, 1 - day);
			weekDate[0] = cal.getTime();
			for (int i = 1; i < 7; i++) {
				cal.add(Calendar.DATE, 1);
				weekDate[i] = cal.getTime();
			}
			return weekDate;
		}
		Date[] weekDate = new Date[7];
		for (int i = 0; i < weekDate.length; i++) {
			weekDate[i] = cal.getTime();
			cal.add(Calendar.DATE, 1);
		}
		return weekDate;
	}
	public Date[] prevWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		Date[] weekDate = new Date[7];
		cal.add(Calendar.DATE, -7);
		for (int i = 0; i < weekDate.length; i++) {
			weekDate[i] = cal.getTime();
			cal.add(Calendar.DATE, 1);
		}
		return weekDate;
	}
	public Date[] nextWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		Date[] weekDate = new Date[7];
		cal.add(Calendar.DATE, 7);
		for (int i = 0; i < weekDate.length; i++) {
			weekDate[i] = cal.getTime();
			cal.add(Calendar.DATE, 1);
		}
		return weekDate;
	}
}
