<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" href="/bitdaily/css/diary/commondiary.css" >
<link rel="stylesheet" href="/bitdaily/css/diary/dailydiary.css" >
</head>
<body>

<c:set var="today" value="<%=new java.util.Date()%>" />
<div class="date">
<a href="#"><img src="/bitdaily/images/icon/before.png" width="30px" height="30px"></a>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
<a href="#"><img src="/bitdaily/images/icon/next.png" width="30px" height="30px"></a>
<div class="calorie">목표칼로리 <img src="/bitdaily/images/icon/fork.png" width="35px" height="35px"> 1200 kcal</div>
</div><!-- end .date -->

<div class="diary">
	
	<div class="subMenu">
		<ul>
			<li><a href="/bitdaily/jsp/diary/fooddiary.jsp">식단</a></li>
			<li><a href="/bitdaily/jsp/diary/exercisediary.jsp" >운동</a></li>
			<li><a href="#" class="sub_active">일기</a></li>
		</ul>
	</div>
	
	<div class="mainMenu">
		<p><img src="${pageContext.request.contextPath}/images/icon/diary.png"/> 오늘의 일기</p>
		<div id="content">
			<div id="titleregist"><input type="text" name="title" id="title" placeholder="제목을 입력하세요"></div>
			<form id="note">
				<div id="summernote"></div>
			</form>
			<div id="noteregist"><input><button>등록</button></div>
		</div>
		
		
	</div>

</div><!-- end .diary -->

<!-- 일일 통계 -->
<div class="dailyStatistics">
	<p>Daily Statistics</p>
	<div class="writeStatis">
		<p>하루 권장 소모 칼로리 : 0000kal</p>
		<p>하루 소모한 칼로리 : 0000kal</p>
		<p>하루 섭취 칼로리: 0000kal</p>
		<p>소모해야 할 칼로리? : 0000kal</p>
	</div><br>
	<canvas id="pieCanvas" width="20%" height="20%"></canvas>
</div>

<script src="/bitdaily/js/diary/summernote.js"></script>
<script src="/bitdaily/js/diary/mini.js"></script>
<script src="/bitdaily/js/diary/diaryActive.js"></script>
</body>
</html>