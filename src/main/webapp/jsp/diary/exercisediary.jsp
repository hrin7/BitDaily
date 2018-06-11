<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="<c:url value='/css/diary/commondiary.css'/>" rel="stylesheet">
<link href="<c:url value='/css/common/button.css'/>" rel="stylesheet">
<style type="text/css">


input#search-bar:focus {
  border: 1px solid #008ABF;
  transition: 0.35s ease;
  color: #008ABF;
}
input#search-bar:focus::-webkit-input-placeholder {
  transition: opacity 0.45s ease;
  opacity: 0;
}

#title { font-size: 25px;
    padding: 20px;
    margin: 10px 32px; }
    
table {
	width: 80%;
	margin: 0px 75px;
	padding: 10px;
}
tr,td { padding: 0px 5px; }

/* 변경    */


/* span { font-weight: bold; font-size: 20px; } */
.footMenu {
	 width: 100%; 
	 position:absolute; 
	 bottom: 20px; 
	 margin: 0px 10px; 
}
	 
.search-container {
	position:relative;
	width: 100%;
	display: block;
	margin: 0 auto;
	text-align: center;
}	 

input#search-bar {
  width: 80%;
  margin-left : 60px;
  height: 45px;
  padding: 0 20px;
  border: 1px solid #D0CFCE;
  outline: none;
}

.search-icon {
  position: relative;
  height: 75px;
  right: 65px;
}

.btn {
	border: 1px solid #062859;
	border-radius: 8px;
	width: 50px; height: 25px;
	color: #062859;
	font-size: 13px;
}
.btn:hover { cursor: pointer; }
.btn:focus { outline: none; }
.btn:active { background-color: rgb(6,40,89,0.2) }

#exerciseMinute {
	border: 1px solid silver;
	width: 60px;
	text-align: right;
}

#insertBtn ,#cancelBtn {
	line-height: 25px;
	padding: 0;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
</head>
<body>

<div class="date">
	<a href="#1" id="preDate" ><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
	<span id="now"></span>
	<a href="#1" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
	<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px">${member.goalCalorie}kcal</div>
</div><!-- end .date -->


<div class="diary">
	<div class="subMenu">
		<ul>
			<li><a href="#1" class="tab" data-kind="1">식단</a></li>
			<li><a href="#2" class="tab" data-kind="2">운동</a></li>
			<li><a href="#3" class="tab" data-kind="3">일기</a></li>
		</ul>
	</div>
	
	<div class="mainMenu">
		<p id="title"><img src="${pageContext.request.contextPath}/images/icon/dumbbell.png"/><span id="today">오늘</span>의 운동 다이어리</p>
		<div id="exeTable"></div>
		<form class="search-container">
		    <input type="text" id="search-bar" name="excerciseName" placeholder="운동 검색하기">
		    <a href="#1" id="searching"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
	    </form>
	    
	    <div style="height: 100%; margin: 20px 0px 80px;">
	    	<table id="searchResult">

			</table>
	    </div>
	    
	    <form id="insertForm">
	      <div class="footMenu"></div>
	    </form>
	</div>
</div><!-- end .diary -->

<!-- 일일 통계 -->
<div class="dailyStatistics">
	<p>Daily Statistics</p>
	<div class="writeStatis" id="writeMiniStatis">
	</div><br>
	<canvas id="pieCanvas" width="20%" height="20%"></canvas>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="<c:url value='/js/diary/mini.js'/>"></script>

<script>

	
function exeDelete(exerciseRecordSeq) {
	$.ajax({
		url: "<c:url value='/diary/exeDelete.do'/>",
		data: {
			userSeq: "41",
			exerciseRecordSeq: exerciseRecordSeq,
			exerciseDate : new Date($("#now").text())
		},
		success: makeExeList
	});
}
function exeUpdate(exerciseRecordSeq) {
	console.log($(".updateTime"));
// 	$.ajax({
// 		url: "<c:url value='/diary/exeUpdate.do'/>",
// 		data: {
// 			userSeq: "41",
// 			exerciseRecordSeq: exerciseRecordSeq,
// 			exerciseTime : $("#exerciseMinute").val(),
// 			exerciseDate : new Date($("#now").text())
// 		},
// 		success: makeExeList
// 	});
}

$(".mainMenu").on("click",".updateTime",function(){
	console.dir($(this));
	console.dir($(this).data("value"))
	$(this).parent().find(".exeTime").html('<input type="text" width="100px" value="'+  +'">')
})


	
$(".mainMenu").on("click","#searching" , function(){
	$("#searchResult").html("");
	$.ajax({
		url: "<c:url value='/diary/exeSearch.do'/>",
		data: {excerciseName: $("#search-bar").val()},
		success: function (result) {
			var html = "";
			for (let i = 0; i < result.length; i++) {
				var exe = result[i];
				html += '  <tr>';
				html += '    <td><a href="#t" class="searchedExercise">'+exe.excerciseName+'</a></td>';
				html += '    <td style="width: 12%; text-align: right;">1분</td>';
				html += '    <td style="width: 12%; text-align: right;" class="exeKcal">'+exe.excerciseKcal+'kcal</td>';
				html += '  </tr>';
				html += '  <tr><td colspan="5"><hr></td></tr>';
			}
			if(result.length === 0){
				html += '  <tr>';
				html += '    <td><a href="#t" class="searchedExercise">검색된 결과가 없습니다.</a></td>';
				html += '  </tr>';
				html += '  <tr><td colspan="5"><hr></td></tr>';
			}
			$("#searchResult").html(html);
			$("#searchResult").show();
			$(".footMenu").hide();
		}
	});
})
	
$(".mainMenu").on("click", ".searchedExercise",function(){
	$.ajax({
		url: "<c:url value='/diary/exeSearchName.do'/>",
		data:  {excerciseName : $(this).text()},
		success : function(result){
			$("#searchResult").hide();
			var html = "";
			html += '<table id="footMenuTable">';
		    html += '    <tr>';
		    html += '	  <td style="width: 18%;"><span>'+result.excerciseName+'</span></td>';
		    html += '	  <td style="width: 15%; text-align: right;"> 운동시간</td>';
		    html += '	  <td style="width: 18%;"> <input type="text" name="exeHour" id="exerciseMinute" maxlength="4"/> 분</td>';
		    html += '	  <td style="width: 15%; text-align: right;"> 소모칼로리 </td>';
		    html += '	  <td style="width: 13%; text-align: right;"><span id="kcalSpan">'+result.excerciseKcal+'</span>kcal</td>';
		    html += '	  <td><button id="insertBtn" class="btn">등록</button> <button id="cancelBtn" class="btn" type="button">취소</button></td>';
		    html += '    </tr>';
	        html += '<input type="hidden" name="exerciseSeq" id="rExerciseSeq" value="'+result.excerciseSeq+'">';
	        html += '</table>';
	    	$(".footMenu").html(html);
	    	$(".footMenu").show();

	        $("#exerciseMinute").keyup(function (e) {
	        	if(e.keyCode < 48 || 57 < e.keyCode){
	        		var text = $("#exerciseMinute").val();
	        		console.log(text.substring(text.length));
	        		$("#exerciseMinute").val(text.substring(text.length))
	        	}
	    		// 칼로리 계산
	    	    var kcal = $(this).val()*result.excerciseKcal
	    	    // 문서 객체에 입력한다.
	    	    $("#kcalSpan").html(kcal);
	    	})
		}
	})
})
	
	
	
$(document).on("click", "#cancelBtn", function() { 
	$("#searchResult").show();
	$("#footMenuTable").hide();
});
	
$("#insertForm").submit(function (e) {
	e.preventDefault();
	if($("#exerciseMinute").val() <= 0 && $("#exerciseMinute").val() == "" ){
		alert("운동 시간은 0분 이상만 입력 가능합니다.");
		return;
	}
	$.ajax({
		url: "<c:url value='/diary/exeInsert.do'/>",
		data: {
			userSeq: "41",
			exerciseSeq: $("#rExerciseSeq").val(),
			exerciseTime: $("#exerciseMinute").val(),
			exerciseDate : new Date($("#now").text())
		},
		dataType: "json",
		success: function (result) {
			$("#exerciseMinute").val("");
			makeExeList(result);
		}
	})
})
	

function makeExeList(result) {
	var html = "";
	html += '<table>';
	var timeSum = 0;
	var kcalSum = 0;
	for (let i = 0; i < result.length; i++) {
		var exe = result[i];
		html += '	<tr>';
		html += '		<td>'+exe.excerciseName+'</td>';
		html += '		<td style="width: 12%; text-align: right;" class="exeTime">'+exe.exerciseTime+'분</td>';
		html += '		<td style="width: 12%; text-align: right;">'+exe.excerciseKcal+'kcal</td>';
		html += '		<td style="width: 5%;"><a href="#1" class="updateTime" data-value='+exe.exerciseRecordSeq+' "><img src="${pageContext.request.contextPath}/images/icon/edit.png"/></a></td>';
		html += '		<td style="width: 5%;"><a href="javascript:exeDelete('+exe.exerciseRecordSeq+');"><img src="${pageContext.request.contextPath}/images/icon/trash.png"/></a></td>';
		html += '	</tr>';
		html += '	<tr><td colspan="5"><hr></td></tr>';
		timeSum += exe.exerciseTime;
		kcalSum += exe.excerciseKcal;
	}
	html += '	<tr>';
	html += '		<td><span>Total</span></td>';
	html += '		<td style="width: 12%; text-align: right;"><span>'+timeSum+'</span>분</td>';
	html += '		<td style="width: 12%; text-align: right;"><span>'+kcalSum+'</span>kcal</td>';
	html += '		<td style="width: 5%;"></td>';
	html += '		<td style="width: 5%;"></td>';
	html += '	</tr>';
	html += '	<tr><td colspan="5"><hr></td></tr>';
	if (result.length == 0) {
		html += '<tr><td colspan="5">오늘은 등록된 운동이 아직 없네요!</td></tr>';
		html += '<tr><td colspan="5"><hr></td></tr>';
	}
	html += '</table>';
	$("#exeTable").html(html);
}

function makeExerciseList() {
	$.ajax({
		url: "<c:url value='/diary/exeDiaryList.do'/>",
		data:  { 
			userSeq : "41",
			exerciseDate : new Date($("#now").text())
		},
		dataType: "json",
		success: makeExeList
	});
}
$(makeExerciseList);
	
function setDate(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if(month <  10){
		month = '0'+month;
	}
	if(day < 10){
		day = "0" + day;
	}
	$("#now").text(year+"-"+month+"-"+day);
}

function whatIsTheDate(){
	var date = new Date($("#now").text());
	var month = date.getMonth()+1;
	var day = date.getDate();
	var today = new Date();
	var todayMonth = today.getMonth()+1;
	var todayDay = today.getDate();
	if(month == todayMonth && day == todayDay){
		console.log("오늘");
		$("#today").text("오늘");
		return;
	}
	if(date > today){
		console.log("내일");
		$("#today").text("내일");
		return;
	}
	if(date < today){
		console.log("어제");
		$("#today").text("어제");
		return;
	}
}
	
setDate();
whatIsTheDate();
</script>
</body>
</html>