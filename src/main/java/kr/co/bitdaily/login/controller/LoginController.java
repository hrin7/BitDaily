package kr.co.bitdaily.login.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
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
	//로그인 페이지
	@RequestMapping("/loginForm.do") 
	public String joinForm() { 
		return "login/loginForm";
	} 
	//로그인 된 후..
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
	//로그 아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm.do";
	}
	
	
	@RequestMapping("/signupform.do")
	public String signupform() {
		return "login/signupform";
	}
	
	@RequestMapping("/join.do")
	public String join(Member member, RedirectAttributes attr) throws Exception{
		Member loginmember = loginService.retrieveMemberInfo(member.getId());
		
		if(member.getCurrentWeight() == 0 ) {
			attr.addFlashAttribute("msg", "가입이 실패 하였습니다. 로그인 페이지로 이동합니다.");
			return "redirect:loginForm.do";
		}else {
			System.out.println("가입 성공");
			return "redirect:loginForm.do"; //가입 후 로그인 페이지
		}
	}
	
}






//		HttpSession session = request.getSession();
