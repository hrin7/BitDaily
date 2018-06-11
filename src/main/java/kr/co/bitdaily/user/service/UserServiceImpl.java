package kr.co.bitdaily.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.vo.Member;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private MemberMapper mapper;
	
	//user 탈퇴 삭제
	public void deleteMember(String id) throws Exception {
		mapper.deleteMember(id);
	}
	
	//user정보 변경
	public void registMemberEmail(Member member) throws Exception {
		mapper.updateMemberEmail(member);
	}
	public void registMemberGoalWeight(Member member) throws Exception {
		mapper.updateMemberGoalWeight(member);
	}
	
	public void registMemberCurrentWeight(Member member) throws Exception {
		mapper.updateMemberCurrentWeight(member);
	}
	
	public void registMemberMemberHeight(Member member) throws Exception {
		mapper.updateMemberHeight(member);
	}
	public void registMemberPass(Member member) throws Exception {
		mapper.updateMemberPass(member);
	}
	public void registMemberAge(Member member) throws Exception {
		mapper.updateMemberAge(member);
	}
		
}
