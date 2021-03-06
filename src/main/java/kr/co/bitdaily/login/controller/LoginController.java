package kr.co.bitdaily.login.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping("/kakaoForm.do") 
	public String kakaoForm(Member member, Model model) throws Exception { 
		System.out.println("kakaoForm 들어옴");
		Member rmember = loginService.retrieveMemberInfo(member.getId());
		if(rmember != null) {
			return "redirect:/main/main.do";
		}
		System.out.println(member.getId());
		model.addAttribute("id", member.getId());
		model.addAttribute("email", member.getEmail());
		return "login/signupform";
	} 
	
	
	
//카카오톡	
	@RequestMapping("/kakao.json") 
	public @ResponseBody Member kakao(Member member, Model model) throws Exception { 
//		List<Member> list = loginService.retrieveMember();
		Member rmember = loginService.retrieveMemberInfo(member.getId());
		
		System.out.println("kakao 들어옴");
		System.out.println(member.getName());
		System.out.println(member.getId());
		System.out.println(member.getEmail());
		
		return rmember;
	} 
	
	
	
	
	// ID찾기
	@RequestMapping("/fogetId.json") 
	@ResponseBody
	public Member fogetId(Member member) throws Exception { 
		Member dbmember = loginService.selectMemberByName(member);
		System.out.println("디비 멤버 : " + dbmember);
		if(dbmember.getEmail().equals(member.getEmail())){
			return dbmember;
		}
		return member;
	} 
	//비번찾기
	@RequestMapping("/fogetPass.json") 
	@ResponseBody
	public Member fogetPass(Member member) throws Exception { 
		System.out.println("forgetPAss" + member.getId());
		
		Member loginmember = loginService.retrieveMemberInfo(member.getId());
//		if(loginmember.getEmail().equals(member.getEmail())){
			if(loginmember != null){
			return loginmember;
		}
		return member;
	} 
	
	
	//아이디 체크
	@RequestMapping("/signUpForm.json") 
	public @ResponseBody boolean signUpForm(Member member) throws Exception { 
		List<Member> list = loginService.retrieveMember();
		for (Member rmember : list) {
			if(rmember.getId().equals(member.getId())) {
				return true;
			}
		}
		return false;
	} 
	
	
	//로그인 된 후..
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session,  RedirectAttributes attr) throws Exception{
		List<Member> list = loginService.retrieveMember();
		for (Member rmember : list) {
			if(rmember != null && rmember.getId().equals(member.getId()) && rmember.getPass().equals(member.getPass())) {
				Member loginmember = loginService.retrieveMemberInfo(member.getId());
				
				session.setAttribute("member", loginmember);
				return "redirect:/main/main.do";
			}
		}
		attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
		return "redirect:loginForm.do";
	}
	//로그 아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm.do";
	}
	
	//가입
	@RequestMapping("/signupform.do")
	public String signupform() {
		return "login/signupform";
	}
	//가입
	@RequestMapping("/join.do")
	public String join(Member member, RedirectAttributes attr, HttpSession session) throws Exception{
			int userlWe = member.getUserWeight();
			int goalWe = member.getGoalWeight();
			int goalCal = userlWe - goalWe;
			
			member.setGoalCalorie(goalCal);
			
			loginService.insertMemberInfo(member);
			
			System.out.println("가입 성공");
			return "redirect:loginForm.do"; //가입 후 로그인 페이지
	}
	
	
	

	//Naver 로그인
	@RequestMapping(value = "/callback.do")
	public String navLogin(HttpServletRequest request,Model model) throws Exception {	
		 String clientId = "MCZXY_QBmhXRmDMH4Rr7";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "OtarQBEwiE";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://localhost/spring-bitdiary/login/callback.do", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
//		     System.out.println("apiURL="+apiURL);
		    StringBuffer res = new StringBuffer();
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        System.out.println(res.toString());
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		    int json = res.indexOf(":");
		    String start = res.substring(json + 1);
		    String[] end = start.split(",");
		    
		    String token = end[0];// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가
	        StringBuffer response = new StringBuffer();
	        try {
	            apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	            }
	            String inputLine;
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(URLDecoder.decode(response.toString(), "utf-8"));
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        String naverid = null;
	        String[] result = response.toString().split("response");
	        System.out.println("결과 : " + result[1]);
	        String result1 = result[1].substring(3, result[1].length()-2);
	        System.out.println("결과 2번째 : " + result1);
	        
	        String[] result2 = result1.split(",");
	        Map<String,String> map = new HashMap<>();
	        for(String s : result2) {
	        	String[] result3 = s.split(":");
	        	map.put(result3[0].substring(1, result3[0].length()-1), result3[1].substring(1, result3[1].length()-1));
	        }
	        List<Member> list = loginService.retrieveMember();
	        Set<String> keys = map.keySet();
	        for(String s : keys) {
	        	if(s.equals("id")) {
	        		naverid = map.get(s);
	        	}
	        	for (Member rmember : list) {
	        		if(rmember.getId().equals(naverid)) {
	        			return "redirect:/main/main.do";
	        		}
	        	}
	        	System.out.println("키 : " + s + " 밸류 : " + map.get(s));
	        	model.addAttribute(s, map.get(s));
	        }
	        return "login/signupform";
	}	
	
	
}	
//	        	if(s.equals("name")) {
//	        		String name = map.get(s);
//	        		
//	        		System.out.println("---" +  name + "---");
//	        		
//	        		name = URLDecoder.decode(name, "utf-8");
//	        		System.out.println("이름 : " + name);
//	        	}
//		HttpSession session = request.getSession();
