package kr.co.bitdaily.login.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.MemberMapper;
import kr.co.bitdaily.repository.vo.Member;


@Service("loginservice")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private MemberMapper mapper;
	public Member retrieveMemberInfo(String id) throws Exception {
		return mapper.selectMemberById(id);
	}
	
}
