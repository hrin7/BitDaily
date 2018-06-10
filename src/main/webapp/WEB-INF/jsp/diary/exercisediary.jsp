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
<link href="<c:url value='/css/diary/exercisediary.css'/>" rel="stylesheet">
<link href="<c:url value='/css/common/button.css'/>" rel="stylesheet">
</head>
<body>

<div class="date">
	<a href="#" id="preDate" ><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
	<span id="now"></span>
	<a href="#" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
	<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px">${member.goalCalorie}kcal</div>
</div><!-- end .date -->


<div class="diary">
	<div class="subMenu">
	<ul>
	<li><a href="<c:url value='/jsp/diary/fooddiary.jsp'/>">식단</a></li>
	<li><a href="#" class="sub_active">운동</a></li>
	<li><a href="<c:url value='/jsp/diary/dailydiary.jsp'/>">일기</a></li>
	</ul>
	</div>
	
	<div class="mainMenu">
		<p id="title"><img src="${pageContext.request.contextPath}/images/icon/dumbbell.png"/> 오늘의 운동 다이어리</p>
		<div id="exeTable"></div>
		<br>
		<form class="search-container">
		    <input type="text" id="search-bar" name="excerciseName" placeholder="운동 검색하기">
		    <a href="javascript:exeSearch();"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
	    </form>
	    
	    <div style="height: 100%; margin: 20px 0px 80px;">
	    	<table id="searchResult">
<%-- 	    	  <c:forEach var="exe" items="${list}"> --%>
<!-- 				<tr> -->
<%-- 					<td><a href="#t" class="exeName">${exe.excerciseName}</a></td> --%>
<!-- 					<td style="width: 12%; text-align: right;">1분</td> -->
<%-- 					<td style="width: 12%; text-align: right;" class="exeKcal">${exe.excerciseKcal}kcal</td> --%>
<!-- 				</tr> -->
<!-- 				<tr><td colspan="5"><hr></td></tr> -->
<%-- 	    	  </c:forEach> --%>
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
<script src="<c:url value='/js/diary/exercisediary.js'/>"></script>

<script>
	function exeDelete(exerciseRecordSeq) {
		$.ajax({
			url: "<c:url value='/diary/exeDelete.do'/>",
			data: {
				userSeq: "${sessionScope.member.userSeq}",
				exerciseRecordSeq: exerciseRecordSeq,
				exerciseDate : new Date()
			},
			dateType: "json",
			success: makeExeList
		});
	}

	function exeSearch() {
		$.ajax({
			url: "<c:url value='/diary/exeSearch.do'/>",
			data: {excerciseName: $("#search-bar").val()},
			dataType: "json",
			success: function (result) {
				var html = "";
				for (let i = 0; i < result.length; i++) {
					var exe = result[i];
					html += '  <tr>';
					html += '    <td><a href="#t" class="exeName">'+exe.excerciseName+'</a></td>';
					html += '    <td style="width: 12%; text-align: right;">1분</td>';
					html += '    <td style="width: 12%; text-align: right;" class="exeKcal">'+exe.excerciseKcal+'kcal</td>';
					html += '  </tr>';
					html += '  <tr><td colspan="5"><hr></td></tr>';
				}
				$("#searchResult").html(html);
			},
			error: function (e) {
				console.dir(e);
			}
		});
	}
	
	$(document).on("click", ".exeName", function() { 
//  		alert($(this).text());
		$.ajax({
			url: "<c:url value='/diary/exeSearchName.do'/>",
			data:  {excerciseName : $(this).text()},
			dataType: "json",
			success: function (result) {
				$("#searchResult").hide();
				var html = "";
				html += '<table id="footMenuTable">';
			    html += '    <tr>';
			    html += '	  <td style="width: 18%;"><span>'+result.excerciseName+'</span></td>';
			    html += '	  <td style="width: 15%; text-align: right;"> 운동시간</td>';
			    html += '	  <td style="width: 18%;"> <input type="text" name="exeHour" id="exeHour"/> 분</td>';
			    html += '	  <td style="width: 15%; text-align: right;"> 소모칼로리 </td>';
			    html += '	  <td style="width: 13%; text-align: right;"><span id="kcalSpan">'+result.excerciseKcal+'</span>kcal</td>';
			    html += '	  <td><button id="insertBtn">등록</button> <button id="cancelBtn" type="button">취소</button></td>';
			    html += '    </tr>';
		        html += '<input type="hidden" name="exerciseSeq" id="rExerciseSeq" value="'+result.excerciseSeq+'">';
		        html += '</table>';
		    	$(".footMenu").html(html);
		        
		        $("#exeHour").keyup(function () {
		    		// 칼로리 계산
		    	    var kcal = $(this).val()*result.excerciseKcal
		    	    // 문서 객체에 입력한다.
		    	    $("#kcalSpan").html(kcal);
		    	})
			},
			error: function (e) {
				console.dir(e);
			}
		});
	});
	
	$(document).on("click", "#cancelBtn", function() { 
		$("#footMenuTable").hide();
	});
	
	$("#insertForm").submit(function (e) {
		e.preventDefault();
		$.ajax({
			url: "<c:url value='/diary/exeInsert.do'/>",
			data: {
				userSeq: "${sessionScope.member.userSeq}",
				exerciseSeq: $("#rExerciseSeq").val(),
				exerciseTime: $("#exeHour").val(),
				exerciseDate : new Date()
			},
			dataType: "json",
			success: function (result) {
				$("#exeHour").val("");
				makeExeList(result);
			},
			error: function(e) {
				console.dir(e);
			}
		})
	})
	

	function makeExeList(result) {
// 		console.dir(result);
		var html = "";
		html += '<table>';
		var timeSum = 0;
		var kcalSum = 0;
		for (let i = 0; i < result.length; i++) {
			var exe = result[i];
			html += '	<tr>';
			html += '		<td>'+exe.excerciseName+'</td>';
			html += '		<td style="width: 12%; text-align: right;">'+exe.exerciseTime+'분</td>';
			html += '		<td style="width: 12%; text-align: right;">'+exe.excerciseKcal+'kcal</td>';
			html += '		<td style="width: 5%;"><img src="${pageContext.request.contextPath}/images/icon/edit.png"/></td>';
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

	function exeList() {
		$.ajax({
			url: "<c:url value='/diary/exeDiaryList.do'/>",
			data:  { 
				userSeq : "${sessionScope.member.userSeq}",
				exerciseDate : new Date()
			},
			dataType: "json",
			success: makeExeList
		});
	}
	exeList();
	
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
// 		console.log(new Date($("#now").text()));
// 		console.log('전광판',date);
		var month = date.getMonth()+1;
		var day = date.getDate();
// 		console.log(date.getMonth()+1);
// 		console.log(date.getDate());
		var today = new Date();
// 		console.log('오늘',today);
		var todayMonth = today.getMonth()+1;
// 		console.log(todayMonth);
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
	
// 	function kal (data) {
// 		var html= "";
// 		data.dailyKal
// 		html += '<p> 1 일 필요 열량 :'+ data.dailyKal + 'kcal </p>';
// 		html += '<p> 하루 섭취 열량 :'+ data.dailyMeal + 'kcal </p>';  
// 		html += '<p> 운동(소모한)열량 :'+ data.dailyExcer + 'kcal </p>';
// 		html += '<p> 남은 열량:'+ data.reCalories + 'kcal </p>';
// 		if(data.reCalories <= 0){
// 			html += '<p> 더 드시면 곤란해요..ㅠ ^ ㅠ </p>';	
// 			return false;
// 		}
		
// 		$("#writeMiniStatis").html(html);
// 	}
	
// 	function KalUserSeq() {
// 		var id = "${sessionScope.member.id}";
// 		console.log(id);
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/mini/mini.json",
// 			data: {"id" : "${sessionScope.member.id}"},
// 			dataType: "json",
// 			success: function (data) {
// 				kal(data);
// 				console.log(data);
// 			},
// 			error : function(data){
// 				console.log('에러',data);
// 			}
// 		});
// 	}
	
// KalUserSeq();
</script>
</body>
</html>