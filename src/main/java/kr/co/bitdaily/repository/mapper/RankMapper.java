package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Dates;
import kr.co.bitdaily.repository.vo.Rank;

public interface RankMapper {
	List<Rank> selectActive(Dates date);
	List<Rank> selectExercise(Dates date);
	List<Rank> selectWeight(Dates date);
	
	
}
