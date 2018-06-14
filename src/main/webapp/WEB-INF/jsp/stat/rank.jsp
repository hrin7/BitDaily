<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bitdaily</title>
<link rel="stylesheet" href="<c:url value="/css/stat/rank.css" />" />
</head>
<body>
<div id="outer">
	<br><br>
	<div id="date">
		<a href="#" id="prev"><img src="<c:url value="/images/icon/before.png" />" width="30px" height="30px"></a>
		<span id="start"></span>~<span id="end"></span>
		<a href="#" id="next"><img src="<c:url value="/images/icon/next.png" />" width="30px" height="30px"></a>
	</div>
	<div id="activeRank">
		<h4>주간 게시판 활동</h4>
		<ul>
			<li class="lines first"><p class="box rankdeco firstcolor">1</p><p class="box namedeco">홍길동</p></li>
			<li class="lines second"><p class="box rankdeco secondcolor">2</p><p class="box namedeco">홍길동</p></li>
			<li class="lines third"><p class="box rankdeco thirdcolor">3</p><p class="box namedeco">홍길동</p></li>
			<li class="lines forth"><p class="box rankdeco forthcolor">4</p><p class="box namedeco">홍길동</p></li>
			<li class="lines fifth"><p class="box rankdeco fifthcolor">5</p><p class="box namedeco">홍길동</p></li>
		</ul>
		<div id="clear"></div>
	</div>
	
	<div id="workout">
		<h4>주간 운동</h4>
		<ul>
			<li class="lines first"><p class="box rankdeco firstcolor">1</p><p class="box namedeco">홍길동</p></li>
			<li class="lines second"><p class="box rankdeco secondcolor">2</p><p class="box namedeco">홍길동</p></li>
			<li class="lines third"><p class="box rankdeco thirdcolor">3</p><p class="box namedeco">홍길동</p></li>
			<li class="lines forth"><p class="box rankdeco forthcolor">4</p><p class="box namedeco">홍길동</p></li>
			<li class="lines fifth"><p class="box rankdeco fifthcolor">5</p><p class="box namedeco">홍길동</p></li>
		</ul>
		<div id="clear"></div>
	</div>
	
	<div id="weight">
		<h4>주간 몸무게</h4>
		<ul>
			<li class="lines first"><p class="box rankdeco firstcolor">1</p><p class="box namedeco">홍길동</p></li>
			<li class="lines second"><p class="box rankdeco secondcolor">2</p><p class="box namedeco">홍길동</p></li>
			<li class="lines third"><p class="box rankdeco thirdcolor">3</p><p class="box namedeco">홍길동</p></li>
			<li class="lines forth"><p class="box rankdeco forthcolor">4</p><p class="box namedeco">홍길동</p></li>
			<li class="lines fifth"><p class="box rankdeco fifthcolor">5</p><p class="box namedeco">홍길동</p></li>
		</ul>
		<div id="clear"></div>
	</div>
	<div id="clear"></div>
</div>
<script>
var start = $("#start").text();
var end = $("#end").text();

function modifyDate(arr){
	var startDay = new Date(arr[0]);
	var year = startDay.getFullYear();
	var month = startDay.getMonth()+1;
	if(month < 10){
		month = '0' + month;
	}
	var day = startDay.getDate();
	if(day < 10){
		day = '0' + day;
	}
	$("#start").text(year + '-' + month + '-' + day);
	var endDay = new Date(arr[1]);
	year = endDay.getFullYear();
	month = endDay.getMonth()+1;
	if(month < 10){
		month = '0' + month;
	}
	var day = endDay.getDate();
	if(day < 10){
		day = '0' + day;
	}
	$("#end").text(year + '-' + month + '-' + day);
	setRank();
}


function setWeek(){
	$.ajax({
		url : "/spring-bitdiary/rank/setWeek.json"
	}).done(modifyDate)
}
setWeek();

$("#prev").click(function(){
	
	$.ajax({
		url : "/spring-bitdiary/rank/prevWeek.json",
		data : {
			date : new Date($("#start").text())
		}
	}).done(modifyDate)
});

$("#next").click(function(){	
	$.ajax({
		url : "/spring-bitdiary/rank/nextWeek.json",
		data : {
			date : new Date($("#start").text())
		}
	}).done(modifyDate)
});

function setRank(){
	console.log($("#start").text());
	console.log(new Date($("#end").text()));
	$.ajax({
		url : "/spring-bitdiary/rank/rank.json",
		data : {
				startDate : new Date($("#start").text()),
				endDate : new Date($("#end").text())
		}
	}).done(function(result){
		$("#activeRank > ul > li > p:last-child").each(function(index){
			console.log("활동 인덱스",result.active[index]);
			$(this).text("없음");
			if(result.active[index]){
				console.log("들어오세요 제발~");
				$(this).text(result.active[index].name);
			}
		})
// 		console.log(result.active[0].userSeq);
		$("#workout > ul > li > p:last-child").each(function(index){
			console.log("운동 인덱스",result.exercise[index]);
			$(this).text("없음");
			if(result.exercise[index]){
				console.log("들어오세요 제발~");
				$(this).text(result.exercise[index].name);
			}
		})
		$("#weight > ul > li > p:last-child").each(function(index){
			console.log("몸무게 인덱스",result.weight[index]);
			$(this).text("없음");
			if(result.weight[index]){
				console.log("들어오세요 제발~");
				$(this).text(result.weight[index].name);
			}
		})
		
	})
}

</script>
</body>
</html>