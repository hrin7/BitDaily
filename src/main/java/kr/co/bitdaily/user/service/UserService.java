package kr.co.bitdaily.user.service;

import kr.co.bitdaily.repository.vo.Member;

public interface UserService {
	//user정보 변경
	public void registMemberEmail(Member member) throws Exception;
	public void registMemberGoalWeight(Member member) throws Exception;
	public void registMemberCurrentWeight(Member member) throws Exception;
	public void registMemberMemberHeight(Member member) throws Exception;
	public void registMemberPass(Member member) throws Exception;
	public void registMemberAge(Member member) throws Exception;
	//user 탈퇴 삭제
	public void deleteMember(String id) throws Exception;
}
