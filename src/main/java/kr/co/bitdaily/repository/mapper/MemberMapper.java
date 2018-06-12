package kr.co.bitdaily.repository.mapper;

import java.util.List;


import kr.co.bitdaily.repository.vo.Member;

public interface MemberMapper {
	
	public Member selectName(Member member) throws Exception;
	
	public Member selectMemberById(String id) throws Exception;
	
	public void insertMember(Member member) throws Exception;
	
	public List<Member> selectMember() throws Exception;
	
	public Member selectUserSeq(String id) throws Exception;
	
	public void updateCurrentWeight(Member member)throws Exception;
	
	//user 탈퇴 삭제
	
	public void deleteMember(String id) throws Exception;
	
	//user정보 변경
	public void updateMemberEmail(Member member) throws Exception;
	public void updateMemberGoalWeight(Member member) throws Exception;
	public void updateMemberCurrentWeight(Member member) throws Exception;
	public void updateMemberHeight(Member member) throws Exception;
	public void updateMemberPass(Member member) throws Exception;
	public void updateMemberAge(Member member) throws Exception;
	
	
	
	
}
