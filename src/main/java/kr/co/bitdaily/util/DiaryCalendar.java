package kr.co.bitdaily.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DiaryCalendar {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	
	public Date getTodayDate() {
		Date today = new Date();
		return today;
	}
	
	public Date getPreDate(Date currentDate) throws ParseException {
		cal.setTime(currentDate);
		cal.add(Calendar.DATE , -1);
		return cal.getTime();
	}
	
	public Date getNextDate(Date currentDate) throws ParseException {
		cal.setTime(currentDate);
		cal.add(Calendar.DATE , 1);
		return cal.getTime();
	}
	

}
