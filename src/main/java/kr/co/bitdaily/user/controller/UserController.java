package kr.co.bitdaily.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.login.service.LoginService;
import kr.co.bitdaily.repository.vo.Member;


@Controller 
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/userInfo.do") 
	public String userinfo() {
		return "user/userInfo";
	}	
	@RequestMapping("/uodateEmail.json") 
	public @ResponseBody String email(Member member) throws Exception {
		
		
		return null; 
	}
	
	
	
}
