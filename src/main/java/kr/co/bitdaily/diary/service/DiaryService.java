package kr.co.bitdaily.diary.service;

import kr.co.bitdaily.repository.vo.Diary;

public interface DiaryService {
	void insertDiary(Diary diary);
	Diary selectDiary(Diary diary);
	void updateDiary(Diary diary);
}
