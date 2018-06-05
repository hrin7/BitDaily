package kr.co.bitdaily.rank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.RankMapper;
import kr.co.bitdaily.repository.vo.Rank;
import kr.co.bitdaily.repository.vo.Week;

@Service
public class RankServiceImpl implements RankService {
	
	@Autowired
	private RankMapper mapper;

	@Override
	public List<Rank> selectCalorie(Week week) {
		return mapper.selectCalorie(week);
	}

	@Override
	public List<Rank> selectExercise(Week week) {
		return mapper.selectExercise(week);
	}

	@Override
	public List<Rank> selectWeight(Week week) {
		return mapper.selectWeight(week);
	}
	
	

}
