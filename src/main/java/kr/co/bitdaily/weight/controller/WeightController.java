package kr.co.bitdaily.weight.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void weightRecord(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		
		model.addAttribute("member", member);
		
	}
	
	@RequestMapping("/weightupdate.json")
	@ResponseBody
	public void weightUpdate(@RequestParam String weight, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		int goalWeight = member.getGoalWeight();
		//tb_user의 current_weight업데이트하기
		//memberMapper:updateCurrentWeight
		member.setCurrentWeight(Integer.parseInt(weight));
		
		//tb_stat_weight에 insert하기
		Weight w = new Weight();
		w.setUserSeq(userSeq);
		w.setGoalWeight(goalWeight);
		w.setCurrentWeight(Integer.parseInt(weight));
		weightService.insertWeight(w, member);
		
	}
	
	@RequestMapping("/weightList.json")
	@ResponseBody
	public List<Weight> selectWeight(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		int userSeq = member.getUserSeq();
		return weightService.selectWeight(userSeq);

	}
	@RequestMapping("/getSession.json")
	@ResponseBody
	public Member getSession(HttpSession session) {
		return (Member) session.getAttribute("member");
		
	}
	
	

}
