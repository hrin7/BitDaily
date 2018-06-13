package kr.co.bitdaily.weight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.mapper.WeightMapper;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Weight;

@Service
public class WeightServiceImpl implements WeightService {
	
	@Autowired
	private WeightMapper mapper;
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insertWeight(Weight weight, Member member) {
		
		
		mapper.insertWeight(weight);
		
		
		try {
			memberMapper.updateCurrentWeight(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Weight> selectWeight(int userSeq) {
		return mapper.selectWeight(userSeq);
	}

	@Override
	public void updateToday(Weight w, Member member) {
		mapper.updateTodayWeight(w);
		try {
			memberMapper.updateCurrentWeight(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
