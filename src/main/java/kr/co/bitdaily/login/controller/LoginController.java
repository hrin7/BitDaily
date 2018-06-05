package kr.co.bitdaily.login.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bitdaily.login.service.LoginService;
import kr.co.bitdaily.repository.vo.Member;


@Controller 
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do") 
	public String joinForm() { 
		return "login/loginForm";
	} 
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session,  RedirectAttributes attr) throws Exception{
		Member loginmember = loginService.retrieveMemberInfo(member.getId());
		
		if(member.getPass().equals(loginmember.getPass())) {
			System.out.println("로그인 성공");
			session.setAttribute("member", member);
			return "redirect:/main/main.do"; //로그인 후 이동 페이지
		}else {
			attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
			return "redirect:loginForm.do";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm.do";
	}
}






//		HttpSession session = request.getSession();
