package kr.co.bitdaily.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller 
@RequestMapping("/user")
public class UserController {
	
//	@Autowired
//	private LoginService loginService;
	
	@RequestMapping("/userInfo.do") 
	public String userinfo() {
		return "user/userInfo";
	}
	
}
