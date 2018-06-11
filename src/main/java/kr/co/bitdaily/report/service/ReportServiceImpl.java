package kr.co.bitdaily.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.StatMapper;
import kr.co.bitdaily.repository.vo.Stat;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private StatMapper mapper;

	@Override
	public Stat selectStatByMealSeq(int mealSeq) {
		return mapper.selectStatByMealSeq(mealSeq);
	}

}
