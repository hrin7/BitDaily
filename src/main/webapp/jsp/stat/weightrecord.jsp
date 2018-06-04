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
</head>
<body>

<div class="content_box">
<div id="scale">
<img src="${pageContext.request.contextPath}/images/icon/thescale.png" width="100px" height="100px"><br>
<h3>45kg</h3><br>　50%<br>
<img src="${pageContext.request.contextPath}/images/icon/runner.png" width="50px" height="50px"><br>
50kg__________________________________________40kg
</div>
<div id="weight_statistics">
<div class="graphBox">
<canvas id="lineCanvas" width="600" height="250"></canvas>
</div>
</div>
</div>

<div id="side">
<h2><img src="/bitdaily/images/icon/ruler.png" width="50px" height="50px"> 체중기록</h2><hr>
	<div class="but">　 <a href="#" id="weight"><img src="/bitdaily/images/icon/plus.png" width="20px" height="20px"> 오늘체중기록</a></div>
	<hr>
	2018.05.23.　45kg
	<hr>
	2018.05.22.　48kg	
	<hr>
	2018.05.21.　53kg	
	<hr>
	2018.05.20.　55kg	
	<hr>
	2018.05.19.　51kg	
	<hr>
	2018.05.18.　49kg	
	<hr>
	2018.05.17.　53kg	
</div>

</body>
</html>