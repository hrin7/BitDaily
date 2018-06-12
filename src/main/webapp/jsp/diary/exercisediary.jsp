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
	var exerciseRecordSeq = $(this).data("value");
	var minute = $(this).parent().prev().prev().children().text();
	$(this).parent().prev().prev().children().html('<input type="text" width="100px" class="changeMinute" maxlength="4"  value="'+ minute +'">')
})

$(makeExerciseList);
	
</script>
</body>
</html>