package kr.co.bitdaily.repository.mapper;

import java.util.List;

import kr.co.bitdaily.repository.vo.Member;

public interface MemberMapper {
	public Member selectMemberById(String id) throws Exception;
	
	public void insertMember(Member member) throws Exception;
	
	public List<Member> selectMember() throws Exception;
	
	public Member selectUserSeq(String id) throws Exception;
	
	public void updateCurrentWeight(Member member)throws Exception;
	
}
