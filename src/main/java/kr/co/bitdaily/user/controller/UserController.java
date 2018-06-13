package kr.co.bitdaily.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.login.service.LoginService;
import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.user.service.UserService;


@Controller 
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/userInfo.do") 
	public String userinfo() {
		return "user/userInfo";
	}	
	
	
	@Autowired
	private UserService userService;
	//유저 정보 수정
	@RequestMapping("/updateEmail.json") 
	public @ResponseBody boolean updateEmail(Member member) throws Exception {
		System.out.println("updateEmail들어옴");
		System.out.println("업데이트 이메일 " + member.getEmail());
		userService.registMemberEmail(member);
		return false;
	}
	
	@RequestMapping("/updatePass.json") 
	public @ResponseBody boolean updatePass(Member member) throws Exception {
		System.out.println("updatePass들어옴");
		userService.registMemberPass(member);
		return false;
	}
	
	@RequestMapping("/updateAge.json") 
	public @ResponseBody boolean updateAge(Member member) throws Exception {
		System.out.println("updatePass들어옴");
		userService.registMemberAge(member);
		return false;
	}
	
	@RequestMapping("/updateHeight.json") 
	public @ResponseBody boolean updateHeight(Member member) throws Exception {
		System.out.println("updateHeight들어옴");
		userService.registMemberMemberHeight(member);
		return false;
	}
	@RequestMapping("/updateWeight.json") 
	public @ResponseBody boolean updateWeight(Member member) throws Exception {
		System.out.println("uodateWeight들어옴");
		userService.registMemberCurrentWeight(member);
		return false;
	}
	
	@RequestMapping("/updateGoalWeight.json") 
	public @ResponseBody boolean updateGoalWeight(Member member) throws Exception {
		userService.registMemberGoalWeight(member);
		System.out.println("GoalWeight 들어옴");
		return false;
	}
	
	
	
	@RequestMapping("/userInfodelete.do")
	public String deleteMember(String id) throws Exception {
		userService.deleteMember(id);
		System.out.println("삭제되었습니다.");
		return "login/loginForm";
		
	}
	
	
}
