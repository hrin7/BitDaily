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
		<span>2018-05-21 ~ 2018-05-27</span>
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
	function setRank(){
		$.ajax({
			url : "<c:url value=""/>"
		}).done(setRank)
	}
	function setRank(data){
		if(data.calorie){
			$("#calorie > ul > li").each(function(index){
				$(this).text(data.calorie[index])
			});
		}
		if(data.workout){
			$("#workout > ul > li").each(function(index){
				$(this).text(data.workout[index])
			});
		}
		if(data.weight){
			$("#weight > ul > li").each(function(index){
				$(this).text(data.weight[index])
			})
		}
	}
</script>
</body>
</html>