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
<style>
#privacyContent {
    width: 848px;
    height: 500px;
    padding: 40px 30px;
    border-top: 2px solid #555;
    background: #fff;
    margin: 0 auto;
}
#deleteUserContent {
	width: 848px;
    height: 703px;
    padding: 20px 30px;
    border-top: 2px solid #555;
    background: #fff;
    margin: 0 auto;
}
#titleSection {
	margin: 0 0 45px;
	position: relative;
}
#mySection {
	
}
table {
	width: 100%;
	border-top: 2px solid #555;
    border-bottom: 1px solid #ddd;
}
input {
	width: 178px;
	height: 25px;
    padding: 5px 10px;
    border: 1px solid #bbb;
    color: #666;
    outline: none;
}
tr {
	display: table-row;
}
th {
	background: #f7f7f7;
	text-align: center;
	padding: 16px 0px;
	border-top: 1px solid #ddd;
}
td {
	padding: 13px 0 13px 17px;
    text-align: left;
    border-top: 1px solid #ddd;
}
input:focus {
	border: 1px solid  #d50c0c;
}
.mod > a {
	text-decoration: none;
	width: 190px;
	color: white;
    background: #d50c0c;
    border: 1px solid #d50c0c;
    height: 25px;
    padding: 3px 10px;
    margin-left: 10px;
}
.mod > a:hover{
	text-decoration: none;
}
#out {
	margin-top: 50px;
	border-top:1px solid #555;
}
#out h5 {
	margin: 10px 0;
}
#submitSection{
	text-align: left;
    padding: 30px 0;
    border-bottom: 1px solid #eee;
    display: table;
    width: 100%;
}
#submitSection a {
    text-decoration: none;
    width: 190px;
    color: #fff;
    background: #d50c0c;
    border: 1px solid #d50c0c;
    padding: 15px 50px;
}
</style>
</head>
<body>

<div>
	<div id="privacyContent">
		<div id="titleSection">
			<h4>개인정보 수정</h4>
			<ul>
				<li>사용자의 개인정보를 수정할 수 있습니다.</li>
			</ul>
		</div>
		<div id="mySection">
			<h5>나의 정보관리</h5>
			<form id="mForm" name="mForm" action="${pageContext.request.contextPath}/user/userInfodelete.do" method="POST">
				<input type="text" style="display: none" name="id" value="${ sessionScope.member.id}">
				<table>
					<colgroup>
						<col width="140">
						<col>
						<col width="130">
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td colspan="2"><input type="text" name="name" readonly="readonly" value="${sessionScope.member.name}"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="2" class="mod"><input type="password" name="pass" value="${sessionScope.member.pass}"><a href="#1" id="updatepass" >수정</a></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan="2" class="mod"><input type="text" name="email" value="${sessionScope.member.email}"><a href="#1" id="updateemail" >수정</a></td>
						</tr>
						<tr>
							<th>키</th>
							<td colspan="2" class="mod"><input type="text" name="userHeight" value="${sessionScope.member.userHeight}"><a href="#1" id="updateuserHeight" >수정</a></td>
						</tr>
						<tr>
							<th>목표 몸무게</th>
							<td colspan="2" class="mod"><input type="text" name="goalWeight" value="${sessionScope.member.goalWeight}"><a href="#1" id="updatgoalweight" >수정</a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div id="deleteUserContent">
		<div id="endSection">
			<h4>회원탈퇴</h4>
			<ul>
				<li>그동안 BITDAIRY를 사용해주셔서 감사합니다.</li>
			</ul>
		</div>
		<div id="submitSection">
			<a href="#1" id="submitBtn">BITDAILY 탈퇴</a>
		</div>
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
				swal('비밀번호 수정 완료!');
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
	$("#submitBtn").click(function () {
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