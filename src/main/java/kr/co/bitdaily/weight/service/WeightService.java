package kr.co.bitdaily.weight.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Weight;

public interface WeightService {
	
	public void insertWeight(Weight weight);
	
	public List<Weight> selectWeight(int userSeq);

}
