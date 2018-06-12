<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT DAILY</title>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link href="${pageContext.request.contextPath}/css/diary/commondiary.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/dailydiary.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/fooddiary.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/exercisediary.css" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
</head>
<body>

<div class="date">
	<a href="#1" id="preDate" ><img src="${pageContext.request.contextPath}/images/icon/before.png" width="30px" height="30px"></a>
	<span id="now"></span>
	<a href="#1" id="nextDate"><img src="${pageContext.request.contextPath}/images/icon/next.png" width="30px" height="30px"></a>
	<div class="calorie">목표칼로리 <img src="${pageContext.request.contextPath}/images/icon/fork.png" width="35px" height="35px">${member.goalCalorie}kcal</div>
</div><!-- end .date -->


<div class="diary">
	<div class="subMenu">
		<ul>
			<li><a href="#1" class="tab" data-kind="1">식단</a></li>
			<li><a href="#2" class="tab" data-kind="2">운동</a></li>
			<li><a href="#3" class="tab" data-kind="3">일기</a></li>
		</ul>
	</div>
	<div class="mainMenu">
		
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

  <!-- VisionAPI Modal -->
  <div class="modal fade" id="visionModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">사진으로 식단 등록하기</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body" style="text-align: center">
          
          <div id="form">
          <form method="post" class="dropzone" enctype="multipart/form-data" action="${pageContext.request.contextPath}/diary/upload.json" 
          id="my-awesome-dropzone">
            <div class="dz-message alert" id="dropzone-previews">
                <br><p>사진을 이곳에 끌어놓거나 클릭해 주세요.</p>
            </div>
          </form>
          </div>
          
			<div id="wait">
			<p><h2>분석중...잠시만 기다려주세요.</h2></p>
			</div>
          
          
          <div id="visionResult">
          <div id="visionImage"></div>
          <div id="visionText" class="dropzone-previews hide"></div>
          </div>

        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="visionClose" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="visionBnt">등록</button>
        </div>
      </div>
      
    </div>
  </div> <!-- End VisionAPI Modal -->
  
  
    <!-- Modal : 식단 수정,삭제 -->
   <div class="modal fade" id="updateModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">식단 정보 수정/삭제</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-meal-body" style="text-align: center">
          <div id="modal-but">
          <input type="text" name="gram" id="gram" placeholder="섭취량을 수정하거나 식단을 삭제할 수 있습니다." /> 
          　	  <img src="/spring-bitdiary/images/icon/edit.png" id="updateMeal" />
          <img src="/spring-bitdiary/images/icon/trash.png" id="deleteMeal"/>
          <input type="hidden" name="hiddenSeq" id="hiddenSeq" value="" />
          <input type="hidden" name="foodSeq" id="foodSeq" value="" />
          <input type="hidden" name="hiddenKcal" id="hiddenKcal" value="" />
          </div>
        </div>
      </div>
      
    </div>
  </div><!-- End Modal : 식단 수정,삭제 -->
  
  
  <div id="foodDetail" style="display: none;">

	<p id="title"><img src="${pageContext.request.contextPath}/images/icon/fooddiary.png"width="40px"/><span id="today">오늘</span>의식단</p><div class="meal">

  		<div class="meal">
			<p class="mealType">아침</p>
			<div class="mealContent">
				<div class="result" id="morning">
				</div>
				<div class="searchBox">
					<div class="inputbox">
						<input type="text" name="foodName" class="searchFood"/>
						<img src="/spring-bitdiary/images/icon/search.png" width="30px" height="30px" class="searching">
						<a class="popup" data-toggle="modal" href="#visionModal"><img src="/spring-bitdiary/images/icon/camera.png" width="40px" height="40px"></a>
					</div>
					<div class="search_list">
					</div>
					<div id="buttons">
						<input type="hidden" name="filePath" id="filePath" value="">
						<input class="hiddenBox" readonly="readonly" value="1">
						<button type="button" class="buts cancle">취소</button><button type="button" class="buts insert">등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#1" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		
		<div class="meal">
			<p class="mealType">점심</p>
			<div class="mealContent">
				<div class="result" id="lunch"></div>
				<div class="searchBox">
					<div class="inputbox">
						<input type="text" name="foodName" class="searchFood"/>
						<img src="/spring-bitdiary/images/icon/search.png" width="30px" height="30px" class="searching">
						<a class="popup" data-toggle="modal" href="#visionModal"><img src="/spring-bitdiary/images/icon/camera.png" width="40px" height="40px"></a>
					</div>
					<div class="search_list"></div>
					<div id="buttons">
						<input type="hidden" name="filePath" id="filePath" value="">
						<input class="hiddenBox" readonly="readonly" value="2">
						<button type="button" class="buts cancle">취소</button><button type="button" class="buts insert">등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#1" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		
		<div class="meal">
			<p class="mealType">저녁</p>
			<div class="mealContent">
				<div class="result" id="dinner"></div>
				<div class="searchBox">
					<div class="inputbox">
						<input type="text" name="foodName" class="searchFood"/>
						<img src="/spring-bitdiary/images/icon/search.png" width="30px" height="30px" class="searching">
						<a class="popup" data-toggle="modal" href="#visionModal"><img src="/spring-bitdiary/images/icon/camera.png" width="40px" height="40px"></a>
					</div>
					<div class="search_list">
					</div>
					<div id="buttons">
						<input type="hidden" name="filePath" id="filePath" value="">
						<input class="hiddenBox" readonly="readonly" value="3">
						<button type="button" class="buts cancle">취소</button><button type="button" class="buts insert">등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#1" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
		
		<div class="meal">
			<p class="mealType">간식</p>
			<div class="mealContent">
				<div class="result" id="snack"></div>
				<div class="searchBox">
					<div class="inputbox">
						<input type="text" name="foodName" class="searchFood"/>
						<img src="/spring-bitdiary/images/icon/search.png" width="30px" height="30px" class="searching">
						<a class="popup" data-toggle="modal" href="#visionModal"><img src="/spring-bitdiary/images/icon/camera.png" width="40px" height="40px"></a>
					</div>
					<div class="search_list"></div>
					<div id="buttons">
						<input type="hidden" name="filePath" id="filePath" value="">
						<input class="hiddenBox" readonly="readonly" value="4">
						<button type="button" class="buts cancle">취소</button>
						<button type="button" class="buts insert">등록</button>
					</div>
				</div>
				<div class="addFoodBox">
					<a href="#1" class="addFood" ><img src="${pageContext.request.contextPath}/images/icon/plus.png" width="20px" height="20px">음식 추가</a>
				</div>
			</div>
		</div>
	</div>
  </div><!-- End foodDetail -->
  
  <div id="diaryDetail" style="display: none">
	<p id="title"><img src="${pageContext.request.contextPath}/images/icon/fooddiary.png" width="40px"/> <span id="today">오늘</span>의 식단</p>
	<div id="content">
		<div id="titleRegist"><input type="text" name="diaryTitle" id="diaryTitle" placeholder="제목을 입력하세요"></div>
		<form id="note">
			<div id="summernote"></div>
		</form>
		<div id="noteRegist"><input id="diaryContext" readonly="readonly"><button id="regist">등록</button></div>
	</div>
  </div>
  
  <div id="exerciseDetail" style="display: none;">
  	<p id="title"><img src="${pageContext.request.contextPath}/images/icon/dumbbell.png"/><span id="today">오늘</span>의 운동 다이어리</p>
		<div id="exeTable"></div>
		<form class="search-container">
		    <input type="text" id="search-bar" name="excerciseName" placeholder="운동 검색하기">
		    <a href="#1" id="searching"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
	    </form>
	    <div style="height: 100%; margin: 20px 0px 80px;">
	    	<table id="searchResult">
			</table>
	    </div>
	    <form id="insertForm">
	      <div class="footMenu"></div>
	    </form>
  </div>
 <script>
 var tabNo = ${param.page};
 var userSeq = ${member.userSeq};
 console.log(userSeq);
 //dropzone 설정 및 visionAPI AJAX
	  Dropzone.options.myAwesomeDropzone = {
	          paramName: "file",
	          maxFilesize: 10,
	          addRemoveLinks: true,
	          url: "/spring-bitdiary/diary/upload.json",
	          previewsContainer: "#dropzone-previews",
	          uploadMultiple: false,
	          init: function() {
	              this.on("success", function(file, response) {
	            	  console.log("드랍존 석세스");
	                  $('#form').hide();
	                  $("#wait").show();
//	                   console.log(file);
	                  console.log(response);
	                  console.log(response.fileName);
	                  $(".modal-body").css("cursor","wait");
	                  
	          		$.ajax({
	        			type : "POST",
	        			url : "/spring-bitdiary/diary/vision.json",
	        			data : { 
	        				"fileName" : response.fileName
	        			},
	        			success : function(result) {
	        				console.log("비전API작동성공");
	        				$("#wait").hide();
	        				$("#visionResult").show();
	        				$(".modal-body").css("cursor","");
	        				
	        				var resultPage = "";
	        				for(var i = 0 ; i <result.length; i++) {
	        					resultPage += "<input type='radio' name='food' value='"+result[i]+"' /> "+result[i]+"<br>"
	        				}
	        				$("#visionText").html(resultPage);
	        				$("#visionImage").html("<img src='/spring-bitdiary/images/fooddiary/"+response.fileName+"' width='200px' height='200px'>");
	        				$("input[name=filePath]").val(response.fileName);
	        				console.log("파일밸류설정"+$("input[name=filePath]").val());
	        			}
	        		});
	              });
	              this.on("addedfile", function(file) {
	                 
	              });
	          }
	      };
 </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diary/mini.js"></script>
<script src="${pageContext.request.contextPath}/js/diary/diary.js"></script>
<script src="${pageContext.request.contextPath}/js/diary/summernote.js"></script>
</body>
</html>