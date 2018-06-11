/* 공용 파트  */

$(function () {
	$("#nav-diary").addClass("active");
	
	setDate();
	
	var tabNo = 1;
	if (tabNo == 1) {
		setFood();  // 식단 초기 설정하기
	} 
});

//식단 , 운동 , 일기 탭 눌렀을때 이벤트
$(".tab").click(function(){
	var html = "";
	if ($(this).data("kind")  == "1") {
		// 화면 식단 정보 설정
		setFood();
	}else if($(this).data("kind") == "2"){
		html = "운동";
		$(".mainMenu").html(html);
	}else {		
		setDiary();
	}
	$(".tab").removeClass("sub_active");
	$(this).addClass("sub_active");
})


//날짜 셋 하는 기능
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

//식단 탭 눌렀을때 태그 변경 이벤트
function setFood() {
	var html = $("#foodDetail").html();
	$(".mainMenu").html(html);
	$(".searchBox").hide();
	
	makeList();
	whatIsTheDate();
}

function setDiary(){
	var html = $("#diaryDetail").html();
	$(".mainMenu").html(html);
	
	makeDiary();
	whatIsTheDate();
}

//오늘의 일기 문구 수정하는 이벤트
function whatIsTheDate(){
	var date = new Date($("#now").text());
	console.log('전광판',date);
	var month = date.getMonth();
	var day = date.getDate();
	console.log(date.getMonth());
	console.log(date.getDate());
	var today = new Date();
	console.log('오늘',today);
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

//이전 날짜 버튼 이벤트
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
			whatIsTheDate();
			makeList();
			makeDiary();
		}
		});
	
})



// 이후 날짜 버튼 이벤트
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
			whatIsTheDate();
			makeList();
			makeDiary();
		}
		});
	
})




/* 공용 파트 끝 */

/* 식단 파트 시작*/


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

//음식 추가 버튼 눌렀을때 이벤트 
$(".mainMenu").on("click", ".addFood", function(){
	$(this).parent().hide();
	$(this).parent().prev().show();
});


// 음식 추가 버튼 후 취소 누를때 이벤트
$(".mainMenu").on("click", ".cancle", function(){
	$(this).parent().prev().prev().children().first().val("")
	$(this).parent().prev().empty();
	$(this).parent().parent().hide();
	$(this).parent().parent().next().show();
})


// 음식 키워드 입력후 돋보기 버튼 이벤트
$(".mainMenu").on("click", ".searching", function(){
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

// 등록 버튼 이벤트 
$(".mainMenu").on("click", ".insert" ,  function(){
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

/* 식단 파트 끝*/

/* 일기 파트 시작*/
function makeDiary(){
	$("#diaryTitle").val("");
	$(".note-editable p").text("");
	$.ajax({
		url : "/spring-bitdiary/diary/dailydiary/select.json",
		data : {
			userSeq : "1",
			diaryDate : new Date($("#now").text())
		}
	}).done(function(data){
		console.log(data);
		$("#diaryTitle").val(data.title);
		console.log($(".note-placeholder").text(""));
		$(".note-editable p").text(data.content);
		toggleBtn(data.title);
		makeDisabled();
	})
}

function insertDiary(){
	$.ajax({
		url : diaryPath(),
		data : {
			userSeq : "1",
			title : $("#diaryTitle").val(),
			content : $(".note-editable p").text(),
			diaryDate : new Date()
		}
	}).done(function(data){
		alert("성공");
		$("#regist").text("수정");
	})
}

function check(){
	console.log($("#diaryTitle").val());
	if($("#diaryTitle").val() == ""){
		alert("제목을 등록하세요.");
		return false;
	} 
	console.log($(".note-editable p").text());
	if($(".note-editable p").text() == ""){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}


function diaryPath(){
	var path = "/spring-bitdiary/diary/dailydiary/insert.json";
	if($("#regist").text() == "수정"){
		path = "/spring-bitdiary/diary/dailydiary/update.json";
	};
	return path;
}

$(".mainMenu").on("click", "#regist",function(){
	if(check())	insertDiary();
})

function toggleBtn(flag){
	if(flag) $("#regist").text("수정")
	else $("#regist").text("등록")
}

function makeDisabled(){
	var now = new Date($("#now").text());
	var month = now.getMonth();
	var date = now.getDate();
	var currentDate = new Date();
	var currentDateMonth = currentDate.getMonth();
	var currentDateDate = currentDate.getDate();
	alert("전광판 날짜 " + month + date + "오늘 날짜 " + currentDateMonth + currentDateDate);
	if(!(month === currentDateMonth && date === currentDateDate)){
		$("#diaryTitle").attr("disabled",true);
		$(".note-editable").attr("contenteditable","false");
		$("#regist").css("display","none");
		return;
	}
	$("#diaryTitle").attr("disabled",false);
	$(".note-editable").attr("contenteditable","true");
	$("#regist").css("display","inline");
	
}
/* 일기 파트 끝 */










