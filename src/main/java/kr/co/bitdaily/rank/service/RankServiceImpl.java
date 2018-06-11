package kr.co.bitdaily.rank.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.RankMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Dates;
import kr.co.bitdaily.repository.vo.Rank;

@Service
public class RankServiceImpl implements RankService {
	
	@Autowired
	private RankMapper mapper;
	
	@Autowired
	private StatMapper statMapper;

	@Override
	public List<Rank> selectActive(Dates date) {
		return mapper.selectActive(date);
	}

	@Override
	public List<Rank> selectExercise(Dates date) {
		return mapper.selectExercise(date);
	}

	@Override
	public List<Rank> selectWeight(Dates date) {
		return mapper.selectWeight(date);
	}

	@Override
	public Date[] setWeek() {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_WEEK);
		if(day > 1) {
			cal.add(Calendar.DATE, 1 - day);
			Date start = cal.getTime();
			cal.add(Calendar.DATE, 6);
			Date end = cal.getTime();
			return new Date[] {start,end};
		}
		Date start = cal.getTime();
		cal.add(Calendar.DATE, 6);
		Date end = cal.getTime();
		return new Date[] {start,end};
	}
	public Date[] prevWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		Date end = cal.getTime();
		cal.add(Calendar.DATE, -6);
		Date start = cal.getTime();
		return new Date[] {start ,end};
	}
	public Date[] nextWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);cal.add(Calendar.DATE, 7);
		Date start = cal.getTime();
		cal.add(Calendar.DATE, 6);
		Date end = cal.getTime();
		return new Date[] {start ,end};
	}
}
