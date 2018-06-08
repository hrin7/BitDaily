<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT DAILY</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath}/css/stat/weightrecord.css" rel="stylesheet">
<script defer src="${pageContext.request.contextPath}/js/stat/weightrecord.js"></script>
<style>
#animation {
	margin: 0 auto;
	box-sizing: border-box;                   
	width: 460px;
}
.runner:not(#scale) {
	text-align: left;
	position: relative;  
 	margin: 0 20px;
 	box-sizing: border-box;
}
#percentage {
	color: rgba(255,99,132,1);
}
</style>
</head>
<body>

<div class="content_box">
<div id="scale">
<img src="${pageContext.request.contextPath}/images/icon/thescale.png" width="100px" height="100px"><br>
<h3>${member.currentWeight}Kg</h3>

<div id="animation">
<div class="runner" >
<p id="percentage"></p>
<img src="${pageContext.request.contextPath}/images/icon/runner.png" width="50px" height="50px">
</div>
<p>${member.userWeight}Kg_________________________________________________${member.goalWeight}kg</p>
</div>

<script>

</script>

</div>
<div id="weight_statistics">
<div class="graphBox">
<canvas id="lineCanvas" width="600" height="250"></canvas>
</div>
</div>
</div>

<div id="side">
<h2><img src="${pageContext.request.contextPath}/images/icon/ruler.png" width="50px" height="50px"> 체중기록</h2><hr>
	<div class="but">　 <a href="#" id="weight"><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px"> 오늘체중기록</a></div>
	<div id="sideList">
	</div>
</div>

</body>
</html>