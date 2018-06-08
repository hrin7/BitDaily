package kr.co.bitdaily.weight.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Weight;

public interface WeightService {
	
	public void insertWeight(Weight weight, Member member);
	
	public List<Weight> selectWeight(int userSeq);

}
