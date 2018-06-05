package kr.co.bitdaily.weight.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.WeightMapper;
import kr.co.bitdaily.repository.vo.Weight;

@Service
public class WeightServiceImpl implements WeightService {
	
	@Autowired
	private WeightMapper mapper;

	@Override
	public void insertWeight(Weight weight) {
		mapper.insertWeight(weight);
	}

}
