package kr.co.bitdaily.service;

import kr.co.bitdaily.repository.vo.Member;

public interface LoginService {
	
	public Member retrieveMemberInfo(String id) throws Exception;

//	public void registMember(Member memberVO) throws Exception;
//	public void deleteMember(String id) throws Exception;
}
