	$("#nav-diary").addClass("active");

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
	});
	
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
		search += "<button type='button' class='buts cancle'>취소</button>　<button type='button' class='buts'>등록</button>";
		search += "</div></div></div>";
		result.html(search);
	}
	
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
					list += "<input type='checkbox' name='rice' id='rice' value='"+result[i].foodSeq+"' /><lable for='rice'>"+result[i].foodName+"</lable>"
					list += "<input type='text' name='gram' class='input_gram' placeholder=' gram, ml'/><br><br>";
				}
				$("#search_list").html(list);
			}
		});
	});

	
	//date
	
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
	setDate();
	
	$(document).on("click", "#preDate", function() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/diary/fooddiary.json",
			data : { 
				"currentDate" : new Date($("#curDate").text()),
				//이 currentDate로 select mealSeq
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
				
			}
			});
		
	});
 
// 	function makeList() {
		
// 	}
