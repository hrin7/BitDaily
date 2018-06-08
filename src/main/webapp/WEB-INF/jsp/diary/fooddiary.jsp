<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT DAILY</title>
<link href="${pageContext.request.contextPath}/css/diary/commondiary.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/dailydiary.css" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
</head>
<body>

<div class="date">
	<a href="#" id="preDate" ><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
	<span id="now"></span>
	<a href="#" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
	<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px">${member.goalCalorie}kcal</div>
</div><!-- end .date -->


<div class="diary">
	<div class="subMenu">
		<ul>
			<li><a href="#" class="tab">식단</a></li>
			<li><a href="#" class="tab">운동</a></li>
			<li><a href="#" class="tab">일기</a></li>
		</ul>
	</div>
	<div class="mainMenu">
		<p id="title"><img src="${pageContext.request.contextPath}/images/icon/fooddiary.png" width="40px"/> <span id="today">오늘</span>의 식단</p>
		
		<div class="meal">
			<p class="mealType">아침</p>
			<div class="mealContent">
				<div class="result" id="morning">
				</div>
				<div class='searchBox'>
					<div class="inputbox">
						<input type='text' name='foodName' class='searchFood'/>
						<img src='/spring-bitdiary/images/icon/search.png' width='30px' height='30px' class='searching'>
						<a class='popup' data-toggle='modal' href='#visionModal'><img src='/spring-bitdiary/images/icon/camera.png' width='40px' height='40px'></a>
					</div>
					<div class='search_list'>
					</div>
					<div id='buttons'>
						<input class="hiddenBox" readonly="readonly" value="1">
						<button type='button' class='buts cancle'>취소</button><button type='button' class='buts insert'>등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		
		<div class="meal">
			<p class="mealType">점심</p>
			<div class="mealContent">
				<div class="result" id="lunch"></div>
				<div class='searchBox'>
					<div class="inputbox">
						<input type='text' name='foodName' class='searchFood'/>
						<img src='/spring-bitdiary/images/icon/search.png' width='30px' height='30px' class='searching'>
						<a class='popup' data-toggle='modal' href='#visionModal'><img src='/spring-bitdiary/images/icon/camera.png' width='40px' height='40px'></a>
					</div>
					<div class='search_list'></div>
					<div id='buttons'>
						<input class="hiddenBox" readonly="readonly" value="2">
						<button type='button' class='buts cancle'>취소</button><button type='button' class='buts insert'>등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		<div class="meal">
			<p class="mealType">저녁</p>
			<div class="mealContent">
				<div class="result" id="dinner"></div>
				<div class='searchBox'>
					<div class="inputbox">
						<input type='text' name='foodName' class='searchFood'/>
						<img src='/spring-bitdiary/images/icon/search.png' width='30px' height='30px' class='searching'>
						<a class='popup' data-toggle='modal' href='#visionModal'><img src='/spring-bitdiary/images/icon/camera.png' width='40px' height='40px'></a>
					</div>
					<div class='search_list'>
					</div>
					<div id='buttons'>
						<input class="hiddenBox" readonly="readonly" value="3">
						<button type='button' class='buts cancle'>취소</button><button type='button' class='buts insert'>등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		<div class="meal">
			<p class="mealType">간식</p>
			<div class="mealContent">
				<div class="result" id="snack"></div>
				<div class='searchBox'>
					<div class="inputbox">
						<input type='text' name='foodName' class='searchFood'/>
						<img src='/spring-bitdiary/images/icon/search.png' width='30px' height='30px' class='searching'>
						<a class='popup' data-toggle='modal' href='#visionModal'><img src='/spring-bitdiary/images/icon/camera.png' width='40px' height='40px'></a>
					</div>
					<div class='search_list'></div>
					<div id='buttons'>
						<input class="hiddenBox" readonly="readonly" value="4">
						<button type='button' class='buts cancle'>취소</button>
						<button type='button' class='buts insert'>등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
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
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diary/mini.js"></script>
<script src="${pageContext.request.contextPath}/js/diary/fooddiary.js"></script>
</body>
</html>