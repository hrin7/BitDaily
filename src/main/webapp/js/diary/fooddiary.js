function makeAddBox(result) {
	var search = "<div class='add'>　　 <a href='#' class='foodAdd'><img src='/spring-bitdiary/images/icon/plus.png' width='20px' height='20px'>　음식 추가</a></div>";
	result.html(search);
}

function makeSearchBox(result) {
	var search = "";
	search += "<div id='selectWrap'><div class='select'>";
	search += "<input type='text' name='foodName' class='searchBox' id='searchBox'/> ";
	search += "<img src='/spring-bitdiary/images/icon/search.png' width='30px' height='30px' id='search'>";
	search += "<a class='popup' data-toggle='modal' href='#visionModal'><img src='/spring-bitdiary/images/icon/camera.png' width='40px' height='40px'></a>";
	search += "<div id='search_list'>";
	search += "</div><div id='buttons'>";
	search += "<button type='button' class='buts cancle'>취소</button>　<button type='button' class='buts insert'>등록</button>";
	search += "</div></div></div>";
	result.html(search);
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
	$("#curDate").text(year+"-"+month+"-"+day);
	return date;
}

function getSeq() {
	$.ajax({
		type : "POST",
		url : "/spring-bitdiary/diary/mealSeq.json",
		data : { 
			"currentDate" : new Date($("#curDate").text())
		},
		success : function(mealResult) {
			console.log(mealResult);
			console.log(mealResult.mealSeq);
			$("#mealSeq").val(mealResult.mealSeq);
		}
	});
}

/*결과리스트호출*/
function makeList() {
	$.ajax({
		type : "POST",
		url : "/spring-bitdiary/diary/makeList.json",
		cache : false,
		data : { 
			"mealSeq" : $("#mealSeq").val()
		},
		success : function(mealList) {
			console.log(mealList);
			for(var i = 0; i < mealList.length; i++) {
				/*
				console.log("위치:"+mealList[i].mealType); //출력위치지정
				console.log("음식명:"+mealList[i].food.foodName); //푸드네임 FK
				console.log("음식칼로리:"+mealList[i].mealGram * mealList[i].food.foodKcal); //칼로리
				*/
				
				var flag = mealList[i].mealType;
				//List출력
				var list = "";
					list += "<div class='result_area'>";
					list += "<div class='result_pic'>";
					list += "<img class='result_img' src='/spring-bitdiary/images/icon/defaultimage.png' width='182px' height='182px'>";
					list += "</div><div class='result_content'>";
					list += "<strong>"+mealList[i].food.foodName+"</strong><br>"+(mealList[i].mealGram * mealList[i].food.foodKcal).toFixed(2)+" kcal<br>";
					list += "</div></div>"
				$(".result"+flag).append(list);
		
			}
		},
		error:function(request,status,error){
	        console.log("에러코드 : "+request.status+"\n"+"responseText메세지 : "+request.responseText+"\n"+"에러 : "+error);
	       }
	});
}


$("#nav-diary").addClass("active");
setDate();
getSeq();
makeList();


$(document).on("click",".foodAdd",function(){
	var result = $(this).parent().parent();
	$(this).parent().remove();
	//search블럭 만드는 함수
	makeSearchBox(result);
});

$(document).on("click",".cancle",function(){
	var result = $(".cancle").parent().parent().parent();
	$(".cancle").parent().parent().remove();
	makeAddBox(result);
	makeList();
});

$(document).on("click", "#search", function() {
	$.ajax({
		type : "POST",
		url : "/spring-bitdiary/diary/foodSearch.json",
		data : {
			keyword : $("#searchBox").val()
		},
		success : function(result) {
			var list = "";
			for(var i = 0; i < result.length; i++) {
				list += "<input type='radio' name='food' value='"+result[i].foodSeq+"' /> "+result[i].foodName+""
				list += "<input type='text' name='gram' class='input_gram' placeholder=' gram, ml'/><br><br>";
			}
			$("#search_list").html(list);
		}
	});
});

/*등록*/
$(document).on("click", ".insert", function() {
	$.ajax({
		type : "POST",
		url : "/spring-bitdiary/diary/insertFood.json",
		data : {
			mealSeq : $("#mealSeq").val(),
			mealType : $(this).parent().parent().parent().parent().prev().val(),
			foodSeq : $("input:checked").val(),
			mealGram : $("input:checked").next().val(),
			filePath : "test"
		},
		success : function() {
			alert("등록되었습니다.");
			var result = $(".insert").parent().parent().parent().parent();
			makeAddBox(result);
			makeList();
		},
		error:function(request,status,error){
	        console.log("에러코드 : "+request.status+"\n"+"responseText메세지 : "+request.responseText+"\n"+"에러 : "+error);
	       }
	});
});
	
$(document).on("click", "#preDate", function() {
	$.ajax({
		type : "POST",
		cache : false,
		url : "/spring-bitdiary/diary/fooddiary.json",
		data : { 
			"currentDate" : new Date($("#curDate").text()),
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
			$("#curDate").text(year+"-"+month+"-"+day);
			
			getSeq();
			makeList();
		}
		});
});
	
$(document).on("click", "#nextDate", function() {
	
	$.ajax({
		type : "POST",
		url : "/spring-bitdiary/diary/fooddiary.json",
		data : { 
			"currentDate" : new Date($("#curDate").text()),
			"bntId" : "nextDate"
		},
		success : function(date) {
			var result = new Date(date);
			var year = result.getFullYear();
			var month = result.getMonth() + 1;
			var day = result.getDate();
			
			
			var resultDate = year+"-"+month+"-"+day;
			var cur = new Date($("#curDate").text());
			var curDate = cur.getFullYear() +"-"+ (cur.getMonth() + 1) +"-"+ cur.getDate();
			if(resultDate==curDate) {
				alert("가장 최신 날짜입니다.");
			}
			
			
			if(month <  10){
				month = '0'+month;
			}
			if(day < 10){
				day = "0" + day;
			}
			$("#curDate").text(year+"-"+month+"-"+day);
			getSeq();
			makeList();
		}
		});
	
});
 

