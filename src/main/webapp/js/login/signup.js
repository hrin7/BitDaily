$(".inputDetail, .privacyDetail , #userEmail").focus(function(){
		$(this).prev().addClass("hide");
});
$(".inputDetail, .privacyDetail, #userEmail").blur(function(){
	if(!$(this).val()){
		$(this).prev().removeClass("hide");
	}
});

$("#userId").keyup(function () {
	if($(this).val() == ""){
		$("#userId").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	console.log("작동중..");
	$.ajax({
		url: "/spring-bitdiary/login/signUpForm.json",
		data: {
			"id" : $(this).val()	
		},
		dataType: "json",
		success: function (data) {
			var	result = "";
			if (data == false) {
				result = "사용가능한 아이디입니다.";
				$("#userId").data("flag","yes");
			}else{
				result = "사용이 불가능한 아이디입니다.";
				$("#userId").data("flag","no");
			}
			$("#userId").next().text(result);
		}
	});
});

$("#userPassCheck").keyup(function(){
	console.log($(this).val().length)
	if($(this).val() == ""){
		$("#userPass").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	if($(this).val() == $("#userPass").val()){
		$("#userPass").next().text("비밀번호가 일치합니다.");
		$("#userPass").data("flag","yes");
	}else{
		$("#userPass").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPass").data("flag","no");
	}
});
$("#userPass").keyup(function(){
	if($(this).val() == ""){
		$("#userPass").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	if($(this).val() == $("#userPassCheck").val()){
		$("#userPass").next().text("비밀번호가 일치합니다.");
		$("#userPass").data("flag","yes");
	}else{
		$("#userPass").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPass").data("flag","no");
	}
})

$("#userEmailDomain").change(function(){
	var emailAddr = $("#userEmailDomain option:selected").val();
	if(emailAddr == "etc"){
		$("#userEmailDetail").attr("readonly",false);
	}else{
		$("#userEmailDetail").attr("readonly",true);
		$("#userEmailDetail").val(emailAddr.substring(1));
	}
	if($("#userEmail").val() == "" || $("#userEmailDetail").val() == ""){
		$("#userEmail").data("flag","no");
		$("#emailResult > p").text("이메일을 입력하세요");
	}else{
		$("#userEmail").data("flag","yes");
		$("#emailResult > p").text("");
	}
});

$("#userEmail").keyup(function(){
	if($("#userEmail").val() == "" || $("#userEmailDetail").val() == ""){
		$("#userEmail").data("flag","no");
		$("#emailResult > p").text("이메일을 입력하세요");
	}else{
		$("#userEmail").data("flag","yes");
		$("#emailResult > p").text("");
	}
});

$("#userHeight , #userCurrentWeight, #userGoalWeight").keyup(function(){
	if($("#userHeight").val() == "" || $("#userCurrentWeight").val() == "" || $("#userGoalWeight").val() == "" ){
		$("#userHeight").data("flag","no");
		$("#userCurrentWeight").data("flag","no");
		$("#userGoalWeight").data("flag","no");
		$("#privacyResult").text("모든 정보를 입력하세요.");
	}else{
		$("#userHeight").data("flag","yes");
		$("#userCurrentWeight").data("flag","yes");
		$("#userGoalWeight").data("flag","yes");
		$("#privacyResult").text("");
	}
})

$("#userName").keyup(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})

$("#submitBtn").click(function(){
	var id = $("#userId").data("flag");
	var pass = $("#userPass").data("flag");
	var name = $("#userName").data("flag");
	var email = $("#userEmail").data("flag");
	var height = $("#userHeight").data("flag");
	var currentWeight = $("#userCurrentWeight").data("flag");
	var goalWeight = $("#userGoalWeight").data("flag");
	id = isEmpty($("#userId"), id , "아이디를 입력해주세요");
	pass = isEmpty($("#userPass"), pass , "비밀번호를 입력해주세요");
	name = isEmpty($("#userName"), name , "이름을 입력해주세요");
	email = isEmpty($("#userEmail"), email , "이메일를 입력해주세요");
	height = isEmpty($("#userHeight"), height , "키를 입력해주세요");
	currentWeight = isEmpty($("#userCurrentWeight"), currentWeight , "현재 몸무게를 입력해주세요");
	goalWeight = isEmpty($("#userGoalWeight"), goalWeight , "목표 몸무게를 입력해주세요");
	if(id == false || pass == false || name == false || email == false || height == false || currentWeight == false || goalWeight == false){
		return;
	}
	email = $("#userEmail").val();
	$("#userEmail").val(email+ '@'+ $("#userEmailDetail").val());
	
	$("#userForm").submit();
})

function isEmpty(obj, flag ,msg) {
	if(flag != "yes"){
		obj.focus();
		alert(msg);
		return false;
	}
	return true;
}	
	