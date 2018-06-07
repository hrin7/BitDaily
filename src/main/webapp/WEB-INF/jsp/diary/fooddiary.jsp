<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT DAILY</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="${pageContext.request.contextPath}/css/diary/commondiary.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/diary/fooddiary.css" rel="stylesheet">
<script defer src="${pageContext.request.contextPath}/js/diary/mini.js"></script>
<script defer src="${pageContext.request.contextPath}/js/diary/fooddiary.js"></script>

</head>
<body>

<div class="date">
<a href="#" id="preDate" onclick="return false"><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
<%-- <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /> --%>
<span id="curDate"></span>
<a href="#" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px"> ${member.goalCalorie} kcal</div>
</div><!-- end .date -->


<div class="diary">

	<div class="subMenu">
	<ul>
	<li><a href="#" class="sub_active">식단</a></li>
	<li><a href="${pageContext.request.contextPath}/jsp/diary/exercisediary.jsp">운동</a></li>
	<li><a href="${pageContext.request.contextPath}/jsp/diary/dailydiary.jsp">일기</a></li>
	</ul>
	</div>

<input type="hidden" value="${mealSeq}" id="mealSeq">
	
	<div class="mainMenu">
	<p id="title"><img src="${pageContext.request.contextPath}/images/icon/fooddiary.png" width="40px"/> 오늘의 식단</p>
	<div id="morning">
	<div class="icon">아침</div>
	<input type="hidden" value="1" name="mealType">
	<div>
	<div class="result result1"></div>
	<div class="add">　　 <a href="#" class="foodAdd"><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">　음식 추가</a></div>
	</div>
	</div>
	

	<div id="lunch">
	<div class="icon">점심</div>
	<input type="hidden" value="2" name="mealType">
	<div>
	<div class="result result2"></div>
	<div class="add">　　 <a href="#" class="foodAdd"><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">　음식 추가</a></div>
	</div>
	</div>

	<div id="dinner">
	<div class="icon">저녁</div>
	<input type="hidden" value="3" name="mealType">
	<div>
	<div class="result result3"></div>
	<div class="add">　　 <a href="#" class="foodAdd"><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">　음식 추가</a></div>
	</div>
	</div>

<div id="snack">
	<div class="icon">간식</div>
	<input type="hidden" value="4" name="mealType">
	<div>

	<div class="result result4">
	
	<!-- 
	<div class="result_area">
	<div class="result_pic">
	<img class="result_img" src="${pageContext.request.contextPath}/images/yogurt.jpg" width="182px" height="182px">
	</div>
	<div class="result_content">
	<strong>요거트</strong><br>
	100kcal<br>
	</div>
	</div>
	 -->
	
	</div>
	
	<div class="add">　　 <a href="#" class="foodAdd"><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">　음식 추가</a></div>
	</div>
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

<!-- 일일 통계  까지-->

  <!-- Modal -->
  <div class="modal fade" id="visionModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">사진으로 식단 등록하기</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body" style="text-align: center">
          <img src="${pageContext.request.contextPath}/images/icon/image.png" width="150px" height="150px"><br>
          <input type="file">
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">등록</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>