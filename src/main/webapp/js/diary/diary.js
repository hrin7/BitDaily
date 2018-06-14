/* 공용 파트  */
$(function () {
	$("#nav-diary").addClass("active");
	setDate();
	if (tabNo == 3) {
		$("body > div.content > div.diary > div.subMenu > ul > li:nth-child(3) > a").addClass("sub_active");
		setDiary();  // 식단 초기 설정하기
	}else if(tabNo == 2){
		$("body > div.content > div.diary > div.subMenu > ul > li:nth-child(2) > a").addClass("sub_active");
		setExercise();
	}else {
		$("body > div.content > div.diary > div.subMenu > ul > li:nth-child(1) > a").addClass("sub_active");
		setFood();
	}
	KalUserSeq();
	dou();
});

//식단 , 운동 , 일기 탭 눌렀을때 이벤트
$(".tab").click(function(){
	var html = "";
	if ($(this).data("kind")  == "1") {
		// 화면 식단 정보 설정
		setFood();
	}else if($(this).data("kind") == "2"){
		setExercise();
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
	
//	setDropzone();
	$("#wait").hide();
	$("#visionResult").hide();
}

function setDiary(){
	var html = $("#diaryDetail").html();
	$(".mainMenu").html(html);
	
	makeDiary();
	whatIsTheDate();
}

function setExercise(){
	var html = $("#exerciseDetail").html();
	$(".mainMenu").html(html);
	
	makeExercise();
	whatIsTheDate();
}

//오늘의 일기 문구 수정하는 이벤트
function whatIsTheDate(){
	var date = new Date($("#now").text());
	var month = date.getMonth();
	var day = date.getDate();
	var today = new Date();
	var todayMonth = today.getMonth();
	var todayDay = today.getDate();
	if(month == todayMonth && day == todayDay){
		$("#today").text("오늘");
		return;
	}
	if(date > today){
		$("#today").text("내일");
		return;
	}
	if(date < today){
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
			makeExercise();
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
			makeExercise();
		}
		});
	
})




/* 공용 파트 끝 */



/* 일기 파트 시작*/
function makeDiary(){
	$("#diaryTitle").val("");
	$(".note-editable").text("");
	$.ajax({
		url : "/spring-bitdiary/diary/dailydiary/select.json",
		data : {
			userSeq : userSeq,
			diaryDate : new Date($("#now").text())
		}
	}).done(function(data){
		console.log(data);
		$("#diaryTitle").val(data.title);
		console.log($(".note-placeholder").text(""));
		$(".note-editable").first().text(data.content);
		toggleBtn(data.title);
		makeDisabled();
	})
}

function insertDiary(){
	$.ajax({
		url : diaryPath(),
		data : {
			userSeq : userSeq,
			title : $("#diaryTitle").val(),
			content : $(".note-editable").first().text(),
			diaryDate : new Date()
		}
	}).done(function(data){
		$("#regist").text("수정");
	})
}

function check(){
	console.log($("#diaryTitle").val());
	if($("#diaryTitle").val() == ""){
		alert("제목을 등록하세요.");
		return false;
	} 
	console.log($(".note-editable").text());
	if($(".note-editable").text() == ""){
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
	console.log('쿼리 날리기전 값', $(".note-editable").first().text());
	console.log('유저 시퀀스',userSeq);
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


/* 운동 파트 시작 */
function makeExercise() {
	$.ajax({
		url: "/spring-bitdiary/diary/exeDiaryList.do",
		data:  { 
			userSeq : userSeq,
			exerciseDate : new Date($("#now").text())
		},
		dataType: "json",
		success: makeExeList
	});
}

function makeExeList(result) {
	var html = "";
	html += '<table>';
	var timeSum = 0;
	var kcalSum = 0;
	for (let i = 0; i < result.length; i++) {
		var exe = result[i];
		html += '	<tr>';
		html += '		<td>'+exe.excerciseName+'</td>';
		html += '		<td style="width: 12%; text-align: right;" class="exeTime"><span>'+exe.exerciseTime+'</span>분</td>';
		html += '		<td style="width: 12%; text-align: right;"><span>'+exe.excerciseKcal+'</span>kcal</td>';
		html += '		<td style="width: 5%;"><a href="#1" class="updateTime" data-flag="yes" data-value='+exe.exerciseRecordSeq+' "><img src="/spring-bitdiary/images/icon/edit.png"/></a></td>';
		html += '		<td style="width: 5%;"><a href="#1" class="deleteExercise" data-value="' + exe.exerciseRecordSeq + '"><img src="/spring-bitdiary/images/icon/trash.png"/></a></td>';
		html += '	</tr>';
		html += '	<tr><td colspan="5"><hr></td></tr>';
		timeSum += exe.exerciseTime;
		kcalSum += exe.excerciseKcal;
	}
	html += '	<tr>';
	html += '		<td><span>Total</span></td>';
	html += '		<td style="width: 12%; text-align: right;"><span>'+timeSum+'</span>분</td>';
	html += '		<td style="width: 12%; text-align: right;"><span>'+kcalSum+'</span>kcal</td>';
	html += '		<td style="width: 5%;"></td>';
	html += '		<td style="width: 5%;"></td>';
	html += '	</tr>';
	html += '	<tr><td colspan="5"><hr></td></tr>';
	if (result.length == 0) {
		html += '<tr><td colspan="5">오늘은 등록된 운동이 아직 없네요!</td></tr>';
		html += '<tr><td colspan="5"><hr></td></tr>';
	}
	html += '</table>';
	$("#exeTable").html(html);
	$(".footMenu").hide();
}

$(".mainMenu").on("click","#searching" , function(){
	$("#searchResult").html("");
	$.ajax({
		url: "/spring-bitdiary/diary/exeSearch.do",
		data: {excerciseName: $("#search-bar").val()},
		success: function (result) {
			var html = "";
			for (let i = 0; i < result.length; i++) {
				var exe = result[i];
				html += '  <tr>';
				html += '    <td><a href="#t" class="searchedExercise">'+exe.excerciseName+'</a></td>';
				html += '    <td style="width: 12%; text-align: right;">1분</td>';
				html += '    <td style="width: 12%; text-align: right;" class="exeKcal">'+exe.excerciseKcal+'kcal</td>';
				html += '  </tr>';
				html += '  <tr><td colspan="5"><hr></td></tr>';
			}
			if(result.length === 0){
				html += '  <tr>';
				html += '    <td>검색된 결과가 없습니다.</td>';
				html += '  </tr>';
				html += '  <tr><td colspan="5"><hr></td></tr>';
			}
			$("#searchResult").html(html);
			$("#searchResult").show();
			$(".footMenu").hide();
		}
	});
})
	
$(".mainMenu").on("click", ".searchedExercise",function(){
	$.ajax({
		url: "/spring-bitdiary/diary/exeSearchName.do",
		data:  {excerciseName : $(this).text()},
		success : function(result){
			$("#searchResult").hide();
			var html = "";
			html += '<table id="footMenuTable">';
		    html += '    <tr>';
		    html += '	  <td style="width: 18%;"><span>'+result.excerciseName+'</span></td>';
		    html += '	  <td style="width: 15%; text-align: right;"> 운동시간</td>';
		    html += '	  <td style="width: 18%;"> <input type="text" name="exeHour" id="exerciseMinute" maxlength="4"/> 분</td>';
		    html += '	  <td style="width: 15%; text-align: right;"> 소모칼로리 </td>';
		    html += '	  <td style="width: 13%; text-align: right;"><span id="kcalSpan">'+result.excerciseKcal+'</span>kcal</td>';
		    html += '	  <td><button id="insertBtn" class="btn">등록</button> <button id="cancelBtn" class="btn" type="button">취소</button></td>';
		    html += '    </tr>';
	        html += '<input type="hidden" name="exerciseSeq" id="rExerciseSeq" value="'+result.excerciseSeq+'">';
	        html += '</table>';
	    	$(".footMenu").html(html);
	    	$(".footMenu").show();

	        $("#exerciseMinute").keyup(function (e) {
	        	var regex= /^[0-9]*$/;
	        	var text = $("#exerciseMinute").val();
	        	if(!regex.test(text)){
	        		$("#exerciseMinute").val(text.replace(regexp,''))
	        	}
	    		// 칼로리 계산
	    	    var kcal = $(this).val()*result.excerciseKcal
	    	    // 문서 객체에 입력한다.
	    	    $("#kcalSpan").html(kcal);
	    	})
		}
	})
})

$(".mainMenu").on("click", "#insertBtn" ,function(e){
	e.preventDefault();
	if($("#exerciseMinute").val() <= 0 && $("#exerciseMinute").val() == "" ){
		alert("운동 시간은 0분 이상만 입력 가능합니다.");
		return;
	}
	$.ajax({
		type : "POST",
		url: "/spring-bitdiary/diary/exeInsert.do",
		data: {
			userSeq: userSeq,
			exerciseSeq: $("#rExerciseSeq").val(),
			exerciseTime: $("#exerciseMinute").val(),
			excerciseKcal: $("#kcalSpan").text(),
			exerciseDate : new Date($("#now").text())
		},
		dataType: "json",
		success: function (result) {
			$("#exerciseMinute").val("");
			makeExeList(result);
		}
	})
})

$(document).on("click", "#cancelBtn", function() { 
	$("#searchResult").show();
	$("#footMenuTable").hide();
});

$(".mainMenu").on("click",".deleteExercise",function(){
	var that = $(this);
//	console.log('운동 시간 출력',that.parent().prev().prev().prev().find("span").text())
	var flag = $(this).parent().prev().find("a").data("flag");
	if(flag == "yes"){
		$.ajax({
			url: "/spring-bitdiary/diary/exeDelete.do",
			data: {
				userSeq: "41",
				exerciseRecordSeq: $(this).data("value"),
				exerciseTime: that.parent().prev().prev().prev().find("span").text(),
				excerciseKcal: that.parent().prev().prev().find("span").text(),
				exerciseDate : new Date($("#now").text())
			},
			success: makeExeList
		});
	}else {
		makeExercise();
	}
})




$(".mainMenu").on("click",".updateTime",function(){
	var exerciseName = $(this).parent().parent().children().first().text();
	var exerciseRecordSeq = $(this).data("value");
	var kcal = "";
	var that = $(this);
	if($(this).data("flag") == "yes"){
		$.ajax({
			url: "/spring-bitdiary/diary/exeSearchName.do",
			data:  {excerciseName : exerciseName },
			success : function(result){
				kcal = result.excerciseKcal;
				var exerciseTime = that.parent().prev().prev().children().text();
				var exerciseRecordSeq = that.data("value");
				that.parent().prev().prev().children().html('<input type="text" class="changeTime" maxlength="4" data-kcal="' + kcal +'" value="'+ exerciseTime+'">')
			}
		})
		$(this).data("flag","no");
	}else {
		var exerciseTime = that.parent().prev().prev().find('input').val();
		var excerciseKcal = that.parent().prev().find('span').text();
		console.log('운동 시간 출력',that.parent().prev().prev().find("span").text())
		console.log('수정된 운동 시간 출력',that.parent().prev().prev().find('input').val())
		$.ajax({
			url: "/spring-bitdiary/diary/exeUpdate.do",
			data: {
				userSeq: "41",
				exerciseTime: exerciseTime,
				excerciseKcal: excerciseKcal,
				exerciseRecordSeq : exerciseRecordSeq,
				exerciseDate : new Date($("#now").text())
			},
			dataType: "json",
			success: function (result) {
				$("#exerciseMinute").val("");
				makeExeList(result);
			}
		})
		$(this).data("flag","yes");
	}
})

$(".mainMenu").on("keyup",".changeTime",function(){
	var calKcal = $(this).val() * $(this).data("kcal");
})

/* 운동 파트 끝 */



/* 식단 파트 시작*/

//식단 리스트 출력
function makeList() {
	$(".searchBox").hide();
	$(".addFoodBox").show();
	$.ajax({
		url : "/spring-bitdiary/diary/makeList.json",
		data : { 
			userSeq : userSeq,
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
				var filePath;
				if(mealList[i].filePath==null) {
					filePath="icon/no-photo.PNG";
				}else {
					filePath="fooddiary/"+mealList[i].filePath;
				}
				var list = "";
					list += "<div class='result_area'><div class='result_pic'><img class='result_img' src='/spring-bitdiary/images/"+filePath+"' width='182px' height='182px'>";
					list += "<input type='hidden' name='detailSeq' id='detailSeq' value="+mealList[i].mealDetailSeq+" />";
					list += "<input type='hidden' name='listFoodSeq' id='listFoodSeq' value="+mealList[i].food.foodSeq+" />";
					list += "</div><div class='result_content'><p><strong>" + mealList[i].food.foodName + "</strong></p>";
					list += "<p><span id='mealGram'>" +mealList[i].mealGram+"</span>g(ml)";
					list += " ː <span id='kcal'>" +(mealList[i].mealGram * mealList[i].food.foodKcal).toFixed(2)+"</span>kcal</p></div></div>";
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
			
			var mealTypeName = ["morning", "lunch", "dinner", "snack"];
			for(var i = 0; i < mealTypeName.length; i++) {
				if($("#"+mealTypeName[i]).html()=="") {
					var zero = "";
					zero += "<div id='zero'><img src='/spring-bitdiary/images/icon/none.png' />";
					zero += "<p><strong>　아직 등록된 식단이 없습니다.</strong></p><div>"
						$("#"+mealTypeName[i]).html(zero);
				}
			}
		}
	});
}

//식단 수정,삭제 모달 설정
$(document).on("click", ".result_img", function(){
	$("#updateModal").modal(); //모달 열기
	
	$("#hiddenSeq").val($(this).next().val()); //mealDetailSeq 셋
	$("#foodSeq").val($(this).next().next().val()); //foodSeq 셋
	
	$("#hiddenKcal").val($(this).parent().next().children().children("#kcal").text()); //kcal 셋
});

//식단 수정
$(document).on("click", "#updateMeal", function(){
	
	$.ajax({
		url : "/spring-bitdiary/diary/updateMeal.json",
		data : { 
			mealDetailSeq : $(this).next().next().val(),
			foodSeq : $(this).next().next().next().val(),
			mealGram : $(this).prev().val(),
			userSeq : userSeq,
			mealDate : new Date($("#now").text()),
			kcal : $(this).next().next().next().next().val()
		},
		success : function(result) {
			$("#gram").val("");
			alert("수정이 완료되었습니다.");
			$("#updateModal").modal("hide");
			makeList();
		}
	});
	
});

//식단 삭제
$(document).on("click", "#deleteMeal", function(){
	console.log("삭제");
	console.log( $(this).next().next().val() );
	
	$.ajax({
		url : "/spring-bitdiary/diary/deleteMeal.json",
		data : { 
			mealDetailSeq : $(this).next().val(),
			userSeq : userSeq,
			mealDate : new Date($("#now").text()),
			kcal : $(this).next().next().next().val()
		},
		success : function(result) {
			alert("정상적으로 삭제되었습니다.");
			$("#updateModal").modal("hide");
			makeList();
		}
	});
	
});

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
		if(result.length==0) {
			list += '　　　검색 결과가 없습니다. 다른 음식을 찾아보세요!';
		} else {
			for(let i = 0; i < result.length; i++){
				list += '<div class="searchedFood">';
				list += '<input type="radio" name="food" id="result"' + result[i].foodSeq + '" value=' + result[i].foodSeq+'><label class="keyword" for="result' + result[i].foodSeq + '">'+ result[i].foodName+'</label>'
				list += '<input type="text" name="gram" class="gram" maxlength="10" disabled="true" />';
				list += '</div>';
			}
		}
		that.parent().next().html(list);
	})
});

//선택되었을 때만 disabled 해제
$(".mainMenu").on("click", "#result", function(){
	$(this).parent().siblings().children("input[name=gram]").attr("disabled", true).attr("placeholder","");
	$(this).next().next().attr("disabled", false).attr("placeholder","gram 또는 ml");
});

// 등록 버튼 이벤트 
$(".mainMenu").on("click", ".insert", function(){
	var that = $(this);
	console.log("들어옴");
	console.log("밀타입"+$(this).prev().prev().val());
	console.log("푸드시퀀스"+$(this).parent().prev().children().find("input:checked").val());
	console.log("밀그램"+$(this).parent().prev().children().find("input:checked+label+input").val());
	console.log("파일패스"+$(this).prev().prev().prev().val());
	$.ajax({
		url : "/spring-bitdiary/diary/insertFood.json",
		data : { 
			mealDate : new Date($("#now").text()),
			userSeq : userSeq,
			mealType : $(this).prev().prev().val(),
			filePath : $(this).prev().prev().prev().val(),
			foodSeq : $(this).parent().prev().children().find("input:checked").val(),
			mealGram : $(this).parent().prev().children().find("input:checked+label+input").val()
		},
		success : function() {
			$("input[name=filePath]").val("");
			that.parent().prev().empty();
			that.parent().prev().prev().children().first().val("")
			that.parent().parent().hide();
			that.parent().parent().next().show();
			alert("등록되었습니다.");
			$(".searchFood").val("");
			makeList();
		}
	});
})




  
  //비전API 후 등록
  $(document).on("click", "#visionBnt", function(){
		var keyword = $("input:checked").val();
		console.log(keyword);
		$("#visionModal").modal('hide');
		console.log(keyword);
		$(".searchFood").val(keyword);
		$("#visionResult").hide();
		$("#dropzone-previews").html("<p>사진을 이곳에 끌어놓거나 클릭해 주세요.</p>");
		$("#form").show();
	});
  
  //비전API 모달 닫기
  $(document).on("click", "#visionClose", function(){
	  console.log("비전모달닫힘");
		$("#visionResult").hide();
		$("#dropzone-previews").html("<p>사진을 이곳에 끌어놓거나 클릭해 주세요.</p>");
		$("#form").show();
  });
  /* 식단 파트 끝*/
