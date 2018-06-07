<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<hgroup>
			<h1>User Info</h1> 
		</hgroup>
		<p class="input">ID</p>
		<input class="place" type="text" name="id">
		<p class="input">Name</p>
		<input class="place" type="text" name="name">
		<p class="input">Email</p>
		<input class="place" type="text" name="email">
		<input class="btn-update" id="updateemail" type="submit" value="수정">
		<p class="input">Password</p>
		<input class="place" type="text" name="pass">
 		<input class="btn-update" id="updatepass" type="submit" value="수정"><br><br>
		<span class="input1">height(cm)</span>
		<input class="place1" type="text" name="userHeight">
		<input class="btn-update" id="updateuserHeight" type="submit" value="수정">
		<span class="input12">Age</span>
	    <input class="place1" type="text" name="age">
	    <input class="btn-update" id="updateage" type="submit" value="수정"><br><br>
		<span class="input1">Current Weight(kg)</span>
		<input class="place1" type="text" name="currentWeight">
		<input class="btn-update" id="updatecurrentWeight" type="submit" value="수정"><br>
		<span class="input1">Goal Weight(kg)</span>
		<input class="place2" type="text" name="goalWeight">
		<input class="btn-update" id="updatgoalweight" type="submit" value="수정"><br>
		<span class="input1">Goal Calorie(kg)</span>
		<input class="place2" type="text" name="goalCalorie">		
		<input class="btn-update" id="updategoalCalorie" type="submit" value="수정">			
		<input class="btn-deletuser" id="deletuser"value="탈퇴">
		
		
	</div>
</div>
	<script>
	//이메일 수정
		$("#updateemail").click(function () {
			swal('수정 완료!')
		});
	//키 수정
		$("#updatheight").click(function () {
			swal('수정 완료!')
		});
	//몸무게 수정
		$("#updatecurrentWeight").click(function () {
			swal('수정 완료!')
		});
	//목표 몸무게 수정
		$("#updatgoalweight").click(function () {
			swal('수정 완료!')
		});
	//목표 몸무게 수정
	$("#updategoalCalorie").click(function () {
		swal('수정 완료!')
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
				  }
				})
		});
	//비번 수정
		$("#updatepass").click(function () {
			swal.mixin({
			  input: 'text',
			  confirmButtonText: 'Next &rarr;',
			  showCancelButton: true,
			  progressSteps: ['1', '2', '3']
			}).queue([
			  {
			    title: '수정할 비밀번호 입력하세요',
			    text: '...'
			  },
			  '다시한번 입력하세요',
			]).then((result) => {
			  if (result.value) {
			    swal({
			      title: 'All done!',
			      html:
			        '수정 되었습니다: <pre>' +
			          JSON.stringify(result.value) +
			        '</pre>',
			      confirmButtonText: '성공!'
			    })
			  }
			})
		});
	</script>
</body>

</html>