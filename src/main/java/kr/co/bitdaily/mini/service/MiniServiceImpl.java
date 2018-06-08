package kr.co.bitdaily.mini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;

@Service("miniService")
public class MiniServiceImpl implements MiniService{
	
	@Autowired
	private MemberMapper mapper;
	public Member selectUsersSeq(String id) throws Exception {
		return mapper.selectUserSeq(id);
	}
	
	@Autowired
	private StatMapper statmapper;
	public List<Stat> selectUserMeal(int userSeq) throws Exception {
		return statmapper.selectByUserSeq(userSeq);
	}
	
	
	
	
	
	
	
	
	
}
