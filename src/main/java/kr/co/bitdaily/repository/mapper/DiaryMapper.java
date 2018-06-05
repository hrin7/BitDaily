package kr.co.bitdaily.repository.mapper;

import kr.co.bitdaily.repository.vo.Diary;

public interface DiaryMapper {
	public void insertDiary(Diary diary);
	public Diary selectDiary(Diary diary);
	public void updateDiary(Diary diary);
}
