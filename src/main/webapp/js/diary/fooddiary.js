	$("#nav-diary").addClass("active");
	
	$(".foodAdd").on("click", function () {
		var result = $(this).parent().parent();
		$(this).parent().remove();
		//search블럭 만드는 함수
		makeSearchBox(result);
	});
		
	function makeSearchBox(result) {
		var search = "";
		search += "<div class='select'>";
		search += "<input type='text' name='foodName' class='searchBox'/> ";
		search += "<img src='/bitdaily/images/icon/search.png' width='30px' height='30px'>";
		search += "<a class='popup' data-toggle='modal' href='#visionModal'><img src='/bitdaily/images/icon/camera.png' width='40px' height='40px'></a>";
		search += "<div id='search_list'>";
		search += "<input type='checkbox' name='rice' id='rice' value='1' /><lable for='rice'> 밥</lable>";
		search += "<input type='text' name='gram' class='input_gram' placeholder=' gram, ml'/><br><br>";
		search += "<input type='checkbox' name='rice2' id='rice2' value='2' /><lable for='rice2'> 흑미밥</lable>";
		search += "<input type='text' name='gram' class='input_gram' placeholder=' gram, ml'/><br><br>";
		search += "<input type='checkbox' name='rice3' id='rice3' value='3' /><lable for='rice3'> 잡곡밥</lable>";
		search += "<input type='text' name='gram' class='input_gram' placeholder=' gram, ml'/><br><br>";
		search += "<div id='buttons'>";
		search += "<button type='button' class='buts cancle'>취소</button>　<button type='button' class='buts'>등록</button>";
		search += "</div></div>";
		result.html(search);
	}
	$(document).on("click",".popup",function(){
		
	})
//	$(".cancle").on("click", function () {
	
	//음식추가 버튼 만드는 함수...
// 		makeAddButton();
//	});
 
// 	function makeList() {
		
// 	}

// 	function makeAddButton() {
		
// 	}