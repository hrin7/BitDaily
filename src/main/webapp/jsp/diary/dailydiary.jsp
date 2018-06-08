<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/diary/commondiary.css" />" >
<link rel="stylesheet" href="<c:url value="/css/diary/dailydiary.css" />" >
</head>
<body>

<div class="date">
<a href="#" id="preDate"><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
<span id="curDate"></span>
<a href="#" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px"> 1200 kcal</div>
</div><!-- end .date -->

<div class="diary">
	
	<div class="subMenu">
		<ul>
			<li><a href="/spring-bitdiary/jsp/diary/fooddiary.jsp">식단</a></li>
			<li><a href="/spring-bitdiary/jsp/diary/exercisediary.jsp" >운동</a></li>
			<li><a href="#" class="sub_active">일기</a></li>
		</ul>
	</div>
	
	<div class="mainMenu">
		<p><img src="<c:url value="/images/icon/diary.png"/>"> 오늘의 일기</p>
		<div id="content">
			<div id="titleRegist"><input type="text" name="diaryTitle" id="diaryTitle" placeholder="제목을 입력하세요"></div>
			<form id="note">
				<div id="summernote"></div>
			</form>
			<div id="noteRegist"><input id="diaryContext" readonly="readonly"><button id="regist">등록</button></div>
		</div>
		
		
	</div>

</div><!-- end .diary -->

<!-- 일일 통계 -->
<div class="dailyStatistics">
	<p>Daily Statistics</p>
	<div class="writeStatis">
		<p>하루 권장 소모 칼로리 : 0000kal</p>
		<p>하루 소모한 칼로리 : 0000kal</p>
		<p>하루 섭취 칼로리: 0000kal</p>
		<p>소모해야 할 칼로리? : 0000kal</p>
	</div><br>
	<canvas id="pieCanvas" width="20%" height="20%"></canvas>
</div>

<script src="<c:url value="/js/diary/summernote.js"/> "></script>
<script src="<c:url value="/js/diary/mini.js"/> "></script>
<script src="<c:url value="/js/diary/diaryActive.js"/> "></script>
<script>
function toggleBtn(flag){
	if(flag) $("#regist").text("수정")
	else $("#regist").text("등록")
}

function setDiary(){
	console.log("ready 다이어리 실행중");
	$.ajax({
		url : "/spring-bitdiary/diary/dailydiary/select.json",
		data : {
			userSeq : "1",
			diaryDate : new Date($("#curDate").text())
		}
	}).done(function(data){
		console.log(data);
		$("#diaryTitle").val(data.title);
		console.log($(".note-placeholder").text(""));
		$(".note-editable p").text(data.content);
		toggleBtn(data.title);
	})
}
function insertDiary(){
	$.ajax({
		url : update(),
		data : {
			userSeq : "1",
			title : $("#diaryTitle").val(),
			content : $(".note-editable p").text(),
			diaryDate : new Date()
		}
	}).done(function(data){
		alert("성공");
		$("#regist").text("수정");
	})
}
function check(){
	console.log($("#diaryTitle").val());
	if($("#diaryTitle").val() == ""){
		alert("제목을 등록하세요.");
		return false;
	} 
	console.log($(".note-editable p").text());
	if($(".note-editable p").text() == ""){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

function update(){
	var path = "/spring-bitdiary/diary/dailydiary/insert.json";
	if($("#regist").text() == "수정"){
		path = "/spring-bitdiary/diary/dailydiary/update.json";
	};
	return path;
}
$("#regist").click(function(){
	if(check())	insertDiary();
})
$(setDiary);

</script>
</body>
</html>