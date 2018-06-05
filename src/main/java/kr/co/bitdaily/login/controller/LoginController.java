package kr.co.bitdaily.login.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitdaily.login.service.LoginService;
import kr.co.bitdaily.repository.vo.Member;


@Controller 
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do") 
	public String joinForm() { 
		System.out.println("로그인 폼 들어옴");
		return "login/loginForm";
	} 
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) throws Exception{
		Member loginmember = loginService.retrieveMemberInfo(member.getId());
		System.out.println(loginmember.getAge());
		
		if(member.getPass().equals(loginmember.getPass())) {
			System.out.println("로그인 성공");
			session.setAttribute("member", member);
			return "redirect:/main/main.do"; //로그인 후 이동 페이지
		}else {
			
			return "redirect:loginForm.do";
		}
	}
	
//	@RequestMapping("/logout.do")
//	@ResponseBody
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "success";
//	}
}
//		HttpSession session = request.getSession();
