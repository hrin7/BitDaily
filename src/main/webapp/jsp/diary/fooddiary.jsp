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


<style type="text/css">
.food_record {
	width: 90%;
}
table {
	margin: 20px auto;
	paddFoodBoxing: 10px;
}


.select {
	margin-left:30px;
	border: 1px dashed #133668;
	width: 600px;
	height: auto;
	border-radius: 20px;
		display: inline-block;
		paddFoodBoxing : 20px 0;
}


.result_pic {
	margin: 8px 8px;
}
.result_content {
	width: 185px;
	height: auto;
	text-align: center;
	paddFoodBoxing: 4px 4px;
	margin: 7px 7px;
}

.buts:hover { cursor: pointer; }
.buts:focus { outline: none; }
.buts:active { background-color: rgba(0,50,200,0.1) }



.result_img {
	border-radius: 20px;
}

a, a:hover {
text-decoration: none;
color : black;
}
#title { font-size: 25px;
    paddFoodBoxing: 20px;
    margin: 10px 32px; 
}

a.addFood {
	display:inline-block;
	margin-left: 50px;
	height: 30px;
	line-height: 30px;
}
a > img {
	margin-right: 10px;
}
<!-- ----------------------------------------------------------------------------------->

.inputBox {
	width: 75%;
}
.hiddenBox {
	width: 65%;
	visibility: hidden;
}

.mealType {
	color: #062859;
	font-weight: bold;
	font-size: large;
	text-shadow: 1px 1px 1px #c6d5f2;
}

.searchFood {
	margin-left: 30px;
	width: 65%;
	border: 1px solid #aaa;
}

.buts { 
 	border: 1px solid #00AFFF; 
 	border-radius: 8px; 
 	width: 50px; height: 25px; 
 	color: #00AFFF; 
 	font-size: 13px; 
 	margin-left: 10px;
}



.search_list {
	width:75%;
}

.searchedFood {
	position: relative;
	margin-left: 30px;
	margin-top: auto;
	margin-bottom: auto;
	padding: 0px;
	width: 100%;
	height : 35px;
}
input[id^=result] {
	margin: 10px;
}

.keyword {
	margin: 0 10px;
	line-height: 35px;
}
.gram {
	position: absolute;
	width : 15%;
	text-align: right;
	right: 0;
	margin: 5px;
}

.result {
	margin-left:30px;
	margin-top: 3px;
	border: 1px solid #133668;
	width: 75%;
	height: auto;
	border-radius: 20px;
	display: inline-block;
}

.addFoodBox {
	margin-left:30px;
	margin-top: 3px;
	border: 1px dashed #133668;
	width: 75%;
	height: 30px;
	border-radius: 20px;
	display: inline-block;
}

.meal {
	position: relative;
	width: 100%;
	height: auto;
	margin: 50px;
	box-sizing: border-box;
}

.result_area {
	float: left;
	margin: 10px 10px;
	width: 30%;
	overflow: hidden;
}

</style>
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
<script>

// --------------------------------------------------------------------------- 

/*결과리스트호출*/
function makeList() {
	$.ajax({
		url : "/spring-bitdiary/diary/makeList.json",
		data : { 
			userSeq : "32",
			mealDate : new Date($("#now").text())
		},
		success : function(mealList) {
			$("#morning").empty();
			$("#lunch").empty();
			$("#dinner").empty();
			$("#snack").empty();
			for(var i = 0; i < mealList.length; i++) {
				var flag = mealList[i].mealType;
				//List출력
				var list = "";
					list += "<div class='result_area'><div class='result_pic'><img class='result_img' src='/spring-bitdiary/images/icon/defaultimage.png' width='182px' height='182px'>";
					list += "</div><div class='result_content'><p><strong>" + mealList[i].food.foodName + "</strong></p>";
					list += "<p>" +(mealList[i].mealGram * mealList[i].food.foodKcal).toFixed(2)+" kcal</p></div></div>";
				switch (flag) {
				case "1":
					$("#morning").append(list);
					break;
				case "2":
					$("#lunch").append(list);
					break;
				case "3":
					$("#dinner").append(list);
					break;
				case "4":
					$("#snack").append(list);
					break;
					
				}
			}
		}
	});
}

function setDate(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if(month <  10){
		month = '0'+month;
	}
	if(day < 10){
		day = "0" + day;
	}
	$("#now").text(year+"-"+month+"-"+day);
}


function whatIsTheDate(){
	console.log($("#now").text());
	var date = new Date($("#now").text());
	var month = date.getMonth();
	var day = date.getDate();
	console.log(date.getMonth());
	console.log(date.getDate());
	var today = new Date();
	var todayMonth = today.getMonth();
	var todayDay = today.getDate();
	if(month == todayMonth && day == todayDay){
		console.log("오늘");
		$("#today").text("오늘");
		return;
	}
	if(date > today){
		console.log("내일");
		$("#today").text("내일");
		return;
	}
	if(date < today){
		console.log("어제");
		$("#today").text("어제");
		return;
	}
}

$(".tab").click(function(){
	$(".tab").removeClass("sub_active");
	$(this).addClass("sub_active");
})

$(".addFood").click(function(){
	$(this).parent().hide();
	$(this).parent().prev().show();
})

$(".cancle").click(function(){
	$(this).parent().prev().prev().children().first().val("")
	$(this).parent().prev().empty();
	$(this).parent().parent().hide();
	$(this).parent().parent().next().show();
})



$(".searching").click(function(){
	var that = $(this);
	$.ajax({
		url : "/spring-bitdiary/diary/foodSearch.json",
		data : {
			keyword : $(this).prev().val()
		}
	}).done(function(result){
		that.parent().next().html("");
		var list = "";
		for(let i = 0; i < result.length; i++){
			list += '<div class="searchedFood">';
			list += '<input type="radio" name="food" id="result' + result[i].foodSeq + '" value=' + result[i].foodSeq+'><label class="keyword" for="result' + result[i].foodSeq + '">'+ result[i].foodName+'</label>'
			list += '<input type="text" name="gram" class="gram" placeholder="gram/ml" maxlength="10"></div>'
		}
		that.parent().next().html(list);
	})
})

$("#preDate").click(function(){
	$.ajax({
		url : "/spring-bitdiary/diary/fooddiary.json",
		data : { 
			"currentDate" : new Date($("#now").text()),
			"bntId" : "preDate"
		},
		success : function(date) {
			var result = new Date(date);
			var year = result.getFullYear();
			var month = result.getMonth() + 1;
			var day = result.getDate();
			if(month <  10){
				month = '0'+month;
			}
			if(day < 10){
				day = "0" + day;
			}
			$("#now").text(year+"-"+month+"-"+day);
			
		}
		});
	whatIsTheDate();
	makeList();
})

$("#nextDate").click(function(){
	$.ajax({
		url : "/spring-bitdiary/diary/fooddiary.json",
		data : { 
			"currentDate" : new Date($("#now").text()),
			"bntId" : "nextDate"
		},
		success : function(date) {
			var result = new Date(date);
			var year = result.getFullYear();
			var month = result.getMonth() + 1;
			var day = result.getDate();
			var resultDate = year+"-"+month+"-"+day;
			var cur = new Date($("#now").text());
			var curDate = cur.getFullYear() +"-"+ (cur.getMonth() + 1) +"-"+ cur.getDate();
			if(resultDate==curDate) {
				alert("가장 최신 날짜입니다.");
				return;
			}
			if(month <  10){
				month = '0'+month;
			}
			if(day < 10){
				day = "0" + day;
			}
			$("#now").text(year+"-"+month+"-"+day);
		}
		});
	whatIsTheDate();
	makeList();
})

$(".insert").click(function(){
	var that = $(this);
	$.ajax({
		url : "/spring-bitdiary/diary/insertFood.json",
		data : { 
			mealDate : new Date($("#now").text()),
			userSeq : "32",
			mealType : $(this).prev().prev().val(),
			foodSeq : $(this).parent().prev().children().find("input:checked").val(),
			mealGram : $(this).parent().prev().children().find("input:checked+label+input").val(),
			filePath : "test"
		},
		success : function() {
			alert("등록되었습니다.");
			makeList();
		}
	});
})

$(".searchBox").hide();

$("#nav-diary").addClass("active");

setDate();
makeList();
whatIsTheDate();
</script>
</body>
</html>