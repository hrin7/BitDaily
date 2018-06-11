package kr.co.bitdaily.report.service;

import kr.co.bitdaily.repository.vo.Stat;

public interface ReportService {
	Stat selectStatByMealSeq(int mealSeq);
}
