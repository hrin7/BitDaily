package kr.co.bitdaily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitdaily.repository.mapper.DiaryMapper;
import kr.co.bitdaily.repository.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryMapper mapper;
	
	@Override
	public void insertDiary(Diary diary) {
		mapper.insertDiary(diary);
	}

	@Override
	public Diary selectDiary(Diary diary) {
		return mapper.selectDiary(diary);
	}
	
	public void updateDiary(Diary diary) {
		mapper.updateDiary(diary);
	}
}
