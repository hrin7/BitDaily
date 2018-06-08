package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Weight;

public interface WeightMapper {
	
	public void insertWeight(Weight weight);
	
	List<Weight> selectWeight(int userSeq);

}
