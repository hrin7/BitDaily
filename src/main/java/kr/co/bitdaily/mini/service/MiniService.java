package kr.co.bitdaily.mini.service;

import java.util.List;

import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Stat;

public interface MiniService {
	public Member selectUsersSeq(String id) throws Exception;
	
	public List<Stat> selectUserMeal(int userSeq) throws Exception;
}
