package kr.co.bitdaily.rank.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Rank;
import kr.co.bitdaily.repository.vo.Week;

public interface RankService {
	public List<Rank> selectCalorie(Week week);
	public List<Rank> selectExercise(Week week);
	public List<Rank> selectWeight(Week week);
}
