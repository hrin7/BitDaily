package kr.co.bitdaily.weight.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitdaily.repository.vo.Member;
import kr.co.bitdaily.repository.vo.Weight;
import kr.co.bitdaily.weight.service.WeightService;

@Controller
@RequestMapping("/stat")
public class WeightController {
	
	@Autowired
	private WeightService weightService;
	
	@RequestMapping("/weightrecord.do")
	public void weightRecord() {
	}
	
	@RequestMapping("/weightupdate.json")
	@ResponseBody
	public void weightUpdate(@RequestParam String weight, HttpSession session) {

		//세션에서 userSeq꺼내오기
//		int userSeq = 23452;
		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		
		//ajax weight받아오기
		//@RequestParam
		
		//tb_user의 current_weight업데이트하기
		//userService.updateWeight(User user);
	
		//tb_weight_record에 insert하기
		//userSeq, wright를 Weight에 담아서
		Weight w = new Weight();
		w.setUserSeq(userSeq);
		w.setRecordWeight(Integer.parseInt(weight));
		weightService.insertWeight(w);
		
	}
	
	

}
