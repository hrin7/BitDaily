package kr.co.bitdaily.repository.vo;

import java.util.Date;

//일기 
public class Diary {

 // 유저 시퀀스 
 private Integer userSeq;

 // 일기 시퀀스 
 private Integer diarySeq;

 // 일기 제목 
 private String title;

 // 일기 내용 
 private String content;

 // 일기 작성 날짜 
 private Date diaryDate;

 public Integer getUserSeq() {
     return userSeq;
 }

 public void setUserSeq(Integer userSeq) {
     this.userSeq = userSeq;
 }

 public Integer getDiarySeq() {
     return diarySeq;
 }

 public void setDiarySeq(Integer diarySeq) {
     this.diarySeq = diarySeq;
 }

 public String getTitle() {
     return title;
 }

 public void setTitle(String title) {
     this.title = title;
 }

 public String getContent() {
     return content;
 }

 public void setContent(String content) {
     this.content = content;
 }

 public Date getDiaryDate() {
     return diaryDate;
 }

 public void setDiaryDate(Date diaryDate) {
     this.diaryDate = diaryDate;
 }

}
