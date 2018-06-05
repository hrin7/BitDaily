package kr.co.bitdaily.repository.mapper;

import kr.co.bitdaily.repository.vo.Member;

public interface MemberMapper {
	Member selectMemberById(String id);
}
