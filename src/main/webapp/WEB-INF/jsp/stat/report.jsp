<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주간 Report</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="<c:url value='/css/stat/report.css'/>" rel="stylesheet">
</head>
<body>
<br><br>
<div id="outer">
  <div id="date">
	<a href="#" id="prev"><img src="<c:url value='/images/icon/before.png'/>" width="30px" height="30px"></a>
	<span id="start"></span>~<span id="end"></span>
	<a href="#" id="next"><img src="<c:url value='/images/icon/next.png'/>" width="30px" height="30px"></a><br><br>
  </div>
	<div class="content_box">
		<div id="statistics">
			<div class="graphBox" id="graphBox">
				<canvas id="barChart"></canvas>
			</div>
		</div>
	</div>
	
	<div id="side">
	<h2><img src="${pageContext.request.contextPath}/images/icon/diagnosis.png" width="50px" height="50px"> 요약</h2><hr>
		아침 <span id='m'></span>kcal
		<hr>
		점심 <span id='l'></span>kcal
		<hr>
		저녁 <span id='d'></span>kcal
		<hr>
		간식 <span id='s'></span>kcal
		<hr>
		<h5>총칼로리 <span id='total'>2000</span>kcal</h5>
	</div>
</div>

<%-- <script src="<c:url value='/js/stat/report.js'/>"></script> --%>
<script>
var start = $("#start").text();
var end = $("#end").text();

function modifyDate(arr){
// 	console.log(arr);
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
	var endDay = new Date(arr[6]);
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
	dateData(arr);
}

function setWeek(){
	$.ajax({
		url : "/spring-bitdiary/stat/setWeek.json"
	}).done(modifyDate)
}
// $(setWeek());
setWeek();

$("#prev").click(function(){
	$.ajax({
		url : "/spring-bitdiary/stat/prevWeek.json",
		data : {
			date : new Date($("#start").text())
		}
	}).done(modifyDate)
});

$("#next").click(function(){	
	$.ajax({
		url : "/spring-bitdiary/stat/nextWeek.json",
		data : {
			date : new Date($("#start").text())
		}
	}).done(modifyDate)
});


$("#nav-report").addClass("active");

// 차트의 데이터 받는 에이작스
function chartData(newWeek) {
	$.ajax({
		url: "<c:url value='/stat/report.do'/>",
		data: {
			userSeq: "${sessionScope.member.userSeq}",
			startDate: new Date($("#start").text()),
			endDate: new Date($("#end").text())
		},
		dataType: "json",
		success: function (result) {
// 			console.log('-------------------------------');
			var arr = [];
			for (let i = 0; i < result.length; i++) {
// 				console.log("결과 객채",result[i]);
// 				console.log("요일",new Date(result[i].mealDate).getDay());
				arr.push(new Date(result[i].mealDate).getDay());
			}
// 			console.log("arr",arr);
			var dateArr = [];
			var fake = {morning : 0 , lunch : 0 , diner : 0, snack:0};
			for(let prop in arr){
// 				console.log("arr 인덱스 번쨰", prop);
// 				console.log("arr 인덱스 값", arr[prop]);
				dateArr[arr[prop]] = result[prop];
			}
// 			console.log("새로운 배열 ",dateArr);
			for(let i = 0 ; i < 7 ; i++){
				if(!dateArr[i]){
					dateArr[i] = fake;
				}
			}
// 			console.log("정제된 데이터", dateArr);
			drawChart(newWeek,dateArr);
			SumWeekKcal(dateArr);
		}
	});
}

// 요약 통계(일주일 칼로리 더한거)
function SumWeekKcal(dateArr) {
	var sumM = 0;
	var sumL = 0;
	var sumD = 0;
	var sumS = 0;
	for (let i = 0; i < dateArr.length; i++) {
		sumM += dateArr[i].morning;
		sumL += dateArr[i].lunch;
		sumD += dateArr[i].diner;
		sumS += dateArr[i].snack;
	}
	$("span#m").text(sumM.toFixed(2));
	$("span#l").text(sumL.toFixed(2));
	$("span#d").text(sumD.toFixed(2));
	$("span#s").text(sumS.toFixed(2));
	$("span#total").text((sumM+sumL+sumD+sumS).toFixed(2));
}

// 차트 밑에 날짜 만드는 함수
function dateData(arr) {
// 	console.log("dateData",arr);
	var newWeek = [];
	for (let i = 0; i < arr.length; i++) {
		var week = new Date(arr[i]);
		var year = week.getFullYear();
		var month = week.getMonth()+1;
		var day = week.getDate();
		if(month < 10){
			month = '0' + month;
		}
		if(day < 10){
			day = '0' + day;
		}
		newWeek.push(month + '-' + day);
	}
// 	return newWeek;
// 	drawChart(newWeek);
	
	chartData(newWeek)
}

// 차트 그리는 함수
function drawChart(newWeek, result) {
// 	console.log(newWeek);
// 	console.log(result);
// 	console.log("--", result[5]);

	var data = {
		labels : newWeek,
		datasets : [ {
			type : 'bar',
			label : '아침',
			backgroundColor : "rgba(255, 99, 132, 0.2)",
			borderColor : "rgba(255, 99, 132)",
			borderWidth : 1,
			data : [ result[0].morning, result[1].morning, 
					 result[2].morning, result[3].morning,
					 result[4].morning, result[5].morning, result[6].morning ]
		}, {
			type : 'bar',
			label : '점심',
			backgroundColor : "rgba(255, 159, 64, 0.2)",
			borderColor : "rgba(255, 159, 64)",
			borderWidth : 1,
			data : [ result[0].lunch, result[1].lunch, 
				 result[2].lunch, result[3].lunch,
				 result[4].lunch, result[5].lunch, result[6].lunch ]
		}, {
			type : 'bar',
			label : '저녁',
			backgroundColor : "rgba(255, 205, 86, 0.2)",
			borderColor : "rgba(255, 205, 86)",
			borderWidth : 1,
			data : [ result[0].diner, result[1].diner, 
				 result[2].diner, result[3].diner,
				 result[4].diner, result[5].diner, result[6].diner ]
		}, {
			type : 'bar',
			label : '간식',
			backgroundColor : "rgba(75, 192, 192, 0.2)",
			borderColor : "rgba(75, 192, 192)",
			borderWidth : 1,
			data : [ result[0].snack, result[1].snack, 
				 result[2].snack, result[3].snack,
				 result[4].snack, result[5].snack, result[6].snack ]
		} ]
	};
	
	document.getElementById('graphBox').innerHTML = '<canvas id="barChart"></canvas>';
	var ctx = document.getElementById("barChart");
	window.myBar = new Chart(ctx, {
		type : 'bar',
		data : data,
		options : {
			title : {
				display : true,
				text : 'Weekly Kcal Chart'
			},
			tooltips : {
				mode : 'index',
				intersect : false
			},
			responsive : true,
			scales : {
				xAxes : [ {
					stacked : true,
				} ],
				yAxes : [ {
					stacked : true
				} ]
			}
		}
	});
}

</script>

</body>
</html>