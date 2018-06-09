
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

$(".tab").click(function(){
	var html = "";
	if ($(this).data("kind")  == "1") {
		// 화면 식단 정보 설정
		setFood();
	}else if($(this).data("kind") == "2"){
		html = "운동";
		$(".mainMenu").html(html);
	}else {		
		
	}
	$(".tab").removeClass("sub_active");
	$(this).addClass("sub_active");
})

$(".mainMenu").on("click", ".addFood", function(){
	$(this).parent().hide();
	$(this).parent().prev().show();
});

$(".mainMenu").on("click", ".cancle", function(){
	$(this).parent().prev().prev().children().first().val("")
	$(this).parent().prev().empty();
	$(this).parent().parent().hide();
	$(this).parent().parent().next().show();
})



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
			
		}
		});
	
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
			whatIsTheDate();
			makeList();
		}
		});
	
})

$(".mainMenu").on("click", function(){
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

function setFood() {
	var html = $("#foodDetail").html();
	console.log(html)
	$(".mainMenu").html(html);
	
	setDate();
	makeList();
	whatIsTheDate();
}

function setDiary(){
	var html = $("#diaryDetail").htmal();
	console.log(html);
	$(".mainMenu").html(html);
	
}

$(function () {
	$(".searchBox").hide();
	$("#nav-diary").addClass("active");

	var tabNo = 1;
	if (tabNo == 1) {
		setFood();  // 식단 초기 설정하기
	} 
});