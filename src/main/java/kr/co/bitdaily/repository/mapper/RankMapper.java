package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Rank;
import kr.co.bitdaily.repository.vo.Week;

public interface RankMapper {
	List<Rank> selectCalorie(Week week);
	List<Rank> selectExercise(Week week);
	List<Rank> selectWeight(Week week);
	
	
}
