<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="<c:url value='/css/diary/commondiary.css'/>" rel="stylesheet">
<link href="<c:url value='/css/diary/exercisediary.css'/>" rel="stylesheet">
<link href="<c:url value='/css/common/button.css'/>" rel="stylesheet">
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
	<li><a href="#" class="sub_active">운동</a></li>
	<li><a href="/bitdaily/jsp/diary/dailydiary.jsp">일기</a></li>
	</ul>
	</div>
	
	<div class="mainMenu">
		<p id="title"><img src="${pageContext.request.contextPath}/images/icon/dumbbell.png"/> 오늘의 운동 다이어리</p>
		<table>
			<tr>
				<td>걷기</td>
				<td style="width: 12%; text-align: right;">200분</td>
				<td style="width: 12%; text-align: right;">100kcal</td>
				<td style="width: 5%;"><img src="${pageContext.request.contextPath}/images/icon/edit.png"/></td>
				<td style="width: 5%;"><img src="${pageContext.request.contextPath}/images/icon/trash.png"/></td>
			</tr>
			<tr><td colspan="5"><hr></td></tr>
			<tr>
				<td>빨리달리기</td>
				<td style="width: 12%; text-align: right;">30분</td>
				<td style="width: 12%; text-align: right;">90kcal</td>
				<td style="width: 5%;"><img src="${pageContext.request.contextPath}/images/icon/edit.png"/></td>
				<td style="width: 5%;"><img src="${pageContext.request.contextPath}/images/icon/trash.png"/></td>
			</tr>
			<tr><td colspan="5"><hr></td></tr>
			<tr>
				<td><span>Total</span></td>
				<td style="width: 12%; text-align: right;"><span>230</span>분</td>
				<td style="width: 12%; text-align: right;"><span>190</span>kcal</td>
				<td style="width: 5%;"></td>
				<td style="width: 5%;"></td>
			</tr>
			<tr><td colspan="5"><hr></td></tr>
		</table>
		<br>
		<form class="search-container">
		    <input type="text" id="search-bar" placeholder="운동 검색하기">
		    <a href="#"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
	    </form>
	    
	    <div style="height: 300px;"></div>
	    
	    <div class="footMenu">
	      <table>
	        <tr>
	    	  <td style="width: 18%;"><span>수영</span></td>
	    	  <td style="width: 15%; text-align: right;"> 운동시간</td>
	    	  <td style="width: 18%;"> <input type="text" name="exeHour" id="exeHour"/> 분</td>
	    	  <td style="width: 15%; text-align: right;"> 소모칼로리 </td>
	    	  <td style="width: 13%; text-align: right;"><span>0</span>kcal</td>
	    	  <td><button>등록</button> <button>취소</button></td>
	        </tr>
	      </table>
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

<script src="<c:url value='/jsp/stat/mini.js'/>"></script>
<script src="<c:url value='/js/diary/exercisediary.js'/>"></script>

</body>
</html>