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
		<a href="#"><img src="<c:url value="/images/icon/before.png" />" width="30px" height="30px"></a>
		<span id="start">2018-05-21</span>~<span id="end">2018-05-27</span>
		<a href="#"><img src="<c:url value="/images/icon/next.png" />" width="30px" height="30px"></a>
	</div>
	<div id="calorie">
		<h4>주간 칼로리</h4>
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
function makeWeekSelectOptions() {
    var start = $("#start").text();
    var end = $("#end").text();
 	
    var startDate = new Date(start);
    var endDate = new Date(end);
    
    var year = startDate.getFullYear();
    var month = startDate.getMonth();
 
    var beforeMonth = new Date(year, month-1, 01);
    var lastDay = (new Date(beforeMonth.getFullYear(), beforeMonth.getMonth()+1, 0)).getDate();
    var endDate = new Date(beforeMonth.getFullYear(), beforeMonth.getMonth(), lastDay);
 
    var week = sdate.getDay();
    sdate.setDate(sdate.getDate() - week);
    var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
 
    var obj = document.getElementById("sh_week");
    obj.options.length = 0;
    var seled = "";
    while(endDate.getTime() >= edate.getTime()) {
 
        var sYear = sdate.getFullYear();
        var sMonth = (sdate.getMonth()+1);
        var sDay = sdate.getDate();
 
        sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
        sDay = (sDay < 10) ? "0"+sDay : sDay;
 
        var stxt = sYear + "-" + sMonth + "-" + sDay;
 
        edate.setDate(sdate.getDate() + 6);
 
        var eYear = edate.getFullYear();
        var eMonth = (edate.getMonth()+1);
        var eDay = edate.getDate();
 
        eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
        eDay = (eDay < 10) ? "0"+eDay : eDay;
 
        var etxt = eYear + "-" + eMonth + "-" + eDay;
 
        if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
            seled = stxt+"|"+etxt;
        }
 
        obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);
 
        sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
        edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
    }
 
    if(seled) obj.value = seled;
}
</script>
</body>
</html>