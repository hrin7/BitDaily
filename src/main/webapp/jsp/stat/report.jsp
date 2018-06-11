<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="<c:url value='/css/stat/report.css'/>" rel="stylesheet">
</head>
<body>
<br><br>
<div id="outer">
	<a href="#"><img src="<c:url value='/images/icon/before.png'/>" width="30px" height="30px"></a>
	<span id="date">2018-05-21 ~ 2018-05-27</span>
	<a href="#"><img src="<c:url value='/images/icon/next.png'/>" width="30px" height="30px"></a><br><br>
	<div class="content_box">
		<div id="statistics">
			<div class="graphBox">
				<canvas id="barChart"></canvas>
			</div>
		</div>
	</div>
	
	<div id="side">
	<h2><img src="${pageContext.request.contextPath}/images/icon/diagnosis.png" width="50px" height="50px"> 요약</h2><hr>
		아침 500kcal
		<hr>
		점심 500kcal
		<hr>
		저녁 500kcal
		<hr>
		간식 500kcal
		<hr>
		<h5>총칼로리 2000kcal</h5>
	</div>
</div>

<script src="<c:url value='/js/stat/report.js'/>"></script>

</body>
</html>