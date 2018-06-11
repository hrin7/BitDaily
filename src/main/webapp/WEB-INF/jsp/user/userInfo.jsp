<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/bitdaily/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/sweetalert/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/userinfo.css" />
<style>
</style>
</head>
<body>

<div class="signup">
	<div class="signup-box">
		<span id="userInfoNameSpan"> ${sessionScope.member.name} 님의 회원 정보 </span><br>
		<form name="mForm" action="${pageContext.request.contextPath}/user/userInfodelete.do" method="POST" id="mForm">
		<p class="input">ID</p>
		<input class="place" type="text" name="id" value="${sessionScope.member.id}">
		<p class="input">이름</p>
		<input class="place" type="text" name="name" value="${sessionScope.member.name}">
		<p class="input">Email</p>
		<input class="place" type="text" name="email" value="${sessionScope.member.email}">
		<input class="btn-update" id="updateemail" type="button" value="수정">
		<p class="input">Password</p>
		<input class="place" type="text" name="pass" value="${sessionScope.member.pass}">
 		<input class="btn-update" id="updatepass" type="button" value="수정">
		<p class="input">키(cm)</p>
		<input class="place" type="text" name="userHeight" value="${sessionScope.member.userHeight}">
		<input class="btn-update" id="updateuserHeight" type="submit" value="수정">
		<p class="input">나이</p>
	    <input class="place" type="text" name="age" value="${sessionScope.member.age}">
	    <input class="btn-update" id="updateage" type="button" value="수정">
		<p class="input">현재 몸무게(kg)</p>
		<input class="place" type="text" name="currentWeight" value="${sessionScope.member.currentWeight}">
		<input class="btn-update" id="updatecurrentWeight" type="button" value="수정">
		<p class="input">목표 몸무게(kg)</p>
		<input class="place" type="text" name="goalWeight" value="${sessionScope.member.goalWeight}">
		<input class="btn-update" id="updatgoalweight" type="button" value="수정">
		
		<input class="btn-deletuser" type="button" id="deletuser"value="탈퇴">
		</form>
		
	</div>
</div>
	<script>
	var f = document.mForm;
	
	
	//이메일 수정
	$("#updateemail").click(function () {
		console.log("updateemail 체크중");
		$.ajax({
			url: "${pageContext.request.contextPath}/user/updateEmail.json",
			data: {
				"email" : f.email.value,
				"id" : "${sessionScope.member.id}"
			},
			dataType: "json",
			success: function (data) {
				if(data == false){
				swal('이메일 수정 완료!');
				}
			}
		});
	});
	
	//pass비밀번호 수정
		$("#updatepass").click(function () {
			console.log("updatepass 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/user/updatePass.json",
				data: {
					"pass" : f.pass.value,
					"id" : "${sessionScope.member.id}"
				},
				dataType: "json",
				success: function (data) {
					if(data == false){
					swal('이메일 완료!');
					}
				}
			});
		});
	
		//나이 수정
		$("#updateage").click(function () {
			console.log("updateage 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/user/updateAge.json",
				data: {
					"age" : f.age.value,
					"id" : "${sessionScope.member.id}"
				},
				dataType: "json",
				success: function (data) {
					if(data == false){
					swal('나이 수정 완료!');
					}
				}
			});
		});
	
	
	
	
	
		//키 수정
		$("#updateuserHeight").click(function () {
			console.log("userHeight 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/user/updateHeight.json",
				data: {
					"userHeight" : f.userHeight.value,
					"id" : "${sessionScope.member.id}"
				},
				dataType: "json",
				success: function (data) {
					if(data == false){
					swal('키 수정 완료!');
					}
				}
			});
		});
	
	
	
	
	//몸무게 수정
		$("#updatecurrentWeight").click(function () {
			console.log("updatecurrentWeight 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/user/updateWeight.json",
				data: {
					"currentWeight" : f.currentWeight.value,
					"id" : "${sessionScope.member.id}"
				},
				dataType: "json",
				success: function (data) {
					if(data == false){
					swal('몸무게 수정 완료!');
					}
				}
			});
		});
	//목표 몸무게 수정
		$("#updatgoalweight").click(function () {
			console.log("goalWeight 체크중");
			$.ajax({
				url: "${pageContext.request.contextPath}/user/updateGoalWeight.json",
				data: {
					"goalWeight" : f.goalWeight.value,
					"id" : "${sessionScope.member.id}"
				},
				dataType: "json",
				success: function (data) {
					if(data == false){
					swal('목표 몸무게  완료!');
					}
				}
			});
		});
	//탈퇴
		$("#deletuser").click(function () {
			swal({
				  title: 'ㅠ ^ ㅠ탈퇴 하시겠습니까 ?',
				  text: " 다이어트를 포기 하지 마세요...",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, give up!'
				}).then((result) => {
				  if (result.value) {
				    swal(
				      '탈퇴 하였습니다.!',
				      'Your file has been deleted.',
				      'success'
				    )
				    $("#mForm").submit();
				  }
				})
		});
	</script>
</body>

</html>