<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/signup.css" />
<style>

</style>
</head>
<body>
<div class="signup">
	<div class="signup-box">
		<hgroup>
			<h1>Sign up for your Account</h1>
		</hgroup>
		<form name="mForm" action="${pageContext.request.contextPath}/login/join.do" method="POST" onsubmit="return doAction()">
		<p class="input">ID</p>
		<input class="place" type="text" name="id">
		<a id="idcheck" href="javascript:void(0);">중복확인</a>		
		<p class="input">Name</p>
		<input class="place" type="text" name="name">
		<p class="input">Email</p>
		<input class="place" type="text" name="email">
		<p class="input">Password</p>
		<input class="place" type="text" name="pass">
 		<p class="input">Confirm password</p> 
 		<input class="place" type="text" name="conformpass">
 		<br><br>
		<span class="input1">Gender&nbsp;&nbsp;</span>
        <input type="radio" id="fmale" value="F" name="gender">
        <label for="female" class="light">Female</label>
        <input type="radio" id="male" value="M" name="gender">
        <label for="male" class="light">Male</label><br><br>
		<span class="input1">Age</span>
	    <input class="place1" type="text" name="age">
		<span class="input1">&nbsp;height(cm)</span>
		<input class="place1" type="text" name="userHeight">
		<span class="input1">&nbsp;Weight(kg)</span>
		<input class="place1" type="text" name="userWeight"><br><br>
		<span class="input1">Current Weight(kg)</span>
		<input class="place1" type="text" name="currentWeight"><br><br>
		<span class="input1">Goal Weight(kg)&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input class="place1" type="text" name="goalWeight">
		<span class="input1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Goal Calorie(kg)</span>
		<input class="place1" type="text" name="goalCalorie"><br>					
		<footer>
			<input class="btn" type="button" value="Sign Up">
		</footer>
		</form>
	</div>
</div>
<script>

		$(function () {
			$(".white").css("transform","translateX(60px)");
			$(".white").css("width","350px");
			$(".white").css("height","420px");
		});

		var f = document.mForm;
		
		function isEmpty(obj, msg) {
			if(typeof(obj) == "string") {
				obj = $("#"+obj);
			}
			if(obj.value == "") {
				alert(msg);
				obj.focus();
				return true;
			}
			return false;
		}

		function doAction() {
			if(isEmpty(f.id, "아이디를 입력하세요")) {return false;}
			if(isEmpty(f.name, "이름을 입력하세요")) {return false;}
			if(isEmpty(f.email, "이메일을 입력하세요")) {return false;}
			if(isEmpty(f.pass, "비밀번호를 입력하세요")) {return false;}
			if(isEmpty(f.conformpass, "비밀번호 확인을 입력하세요")) {return false;}
			if(isEmpty(f.age, "나이을 입력하세요")) {return false;}
			if(isEmpty(f.userHeight, "사용자의 키를 입력하세요")) {return false;}
			if(isEmpty(f.userWeight, "몸무게를 입력하세요")) {return false;}
			if(isEmpty(f.goalWeight, "목표 몸무게를 입력하세요")) {return false;}
			if(isEmpty(f.goalCalorie, "목표 칼로리를 입력하세요")) {return false;}
			
			
			if(f.pass.value != f.conformpass.value) {
				alert("비밀번호가 일치하지 않습니다.");
				f.password.focus();
				f.password.select();
				f.repassword.value = "";
				return false;
			}
			
// 			if(f.idDuplication.value != "idCheck") {
// 				alert("아이디 중복체크를 해주세요");
// 				return false;
// 			}
// 			return true;
			
		}
		
		
		$("#idcheck").click(function () {
			console.log("아이디 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/login/signUpForm.json",
				data: {
					"id" : f.id.value	
				},
				dataType: "json",
				success: function (data) {
					console.log('아이디 들어옴');
					if (data == false) {
						result = "사용가능한 아이디입니다.";
					}else{
						result = "이미 사용중인 아이디입니다.";
					}
					alert(result);
				}
			});
		});
		
		</script>
</body>
</html>