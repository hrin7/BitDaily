package kr.co.bitdaily.login.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Member;


@Service("loginservice")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private MemberMapper mapper;
	
	
	public List<Member> retrieveMember() throws Exception {
		return mapper.selectMember();
	}
	
	public Member retrieveMemberInfo(String id) throws Exception {
		return mapper.selectMemberById(id);
	}
	
	public void insertMemberInfo(Member member) throws Exception {
		mapper.insertMember(member);
	}
	
	public Member selectMemberSeq(String id) throws Exception {
		return mapper.selectUserSeq(id);
	}
	
}
