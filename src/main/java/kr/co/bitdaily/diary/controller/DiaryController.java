package kr.co.bitdaily.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bitdaily.repository.vo.Diary;
import kr.co.bitdaily.service.DiaryService;

@RestController
@RequestMapping("/diary/dailydiary")
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping("/insert.json")
	public void insertDiary(Diary diary) {
		System.out.println("insert 들어옴");
		System.out.println("user : " + diary.getUserSeq() );
		System.out.println("title : " + diary.getTitle() );
		System.out.println("content : " + diary.getContent() );
		diaryService.insertDiary(diary);
		return;
	}
	
	@RequestMapping("/select.json")
	public @ResponseBody Diary selectDiary(Diary diary) {
		System.out.println("select 들어옴");
		System.out.println(diary.getUserSeq());
		System.out.println(diary.getDiaryDate());
		Diary userDiary = diaryService.selectDiary(diary);
		if(userDiary == null) {
			System.out.println("검색 되지 않았습니다.");
		}else {
			System.out.println("입력된 타이틀 : "+userDiary.getTitle());
			System.out.println("입력된 내용 : "+userDiary.getContent());
			System.out.println("입력된 시간 : "+userDiary.getDiaryDate());
		}
		return diaryService.selectDiary(diary);
	}
	
	@RequestMapping("/update.json")
	public void updateDiary(Diary diary) {
		System.out.println("update 들어옴");
		System.out.println("user : " + diary.getUserSeq() );
		System.out.println("title : " + diary.getTitle() );
		System.out.println("content : " + diary.getContent() );
		System.out.println("date : " + diary.getDiaryDate() );
		diaryService.updateDiary(diary);;
		return;
	}
}
