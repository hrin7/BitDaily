package kr.co.bitdaily.rank.service;

import java.util.Date;
import java.util.List;

import kr.co.bitdaily.repository.vo.Dates;
import kr.co.bitdaily.repository.vo.Rank;

public interface RankService {
	public List<Rank> selectActive(Dates date);
	public List<Rank> selectExercise(Dates date);
	public List<Rank> selectWeight(Dates date);
	public Date[] setWeek();
	public Date[] prevWeek(Date date);
	public Date[] nextWeek(Date date);
}
