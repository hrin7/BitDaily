<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/signup2.css" />
</head>
<body>
<div id="signup">
	<form action="${pageContext.request.contextPath}/login/join.do" method="post" id="userForm">
		<h3>환영합니다.</h3>
		<h6>더 나은 이용을 위해서는 사용자의 기본 정보가 필요합니다.</h6>
		<div id="userInfo">
			<div id="inputBoxes">
				<h5>기본항목</h5>
				<div id="inputId">
					<div class="innerBox">
						<label for="userId" class="labels">아이디</label>
						<input type="text" name="id" id="userId" data-flag="no" class="inputDetail" maxlength="15">
						<p class="innerText">영문/숫자를 조합하여 입력</p>
					</div>
				</div>
				<div id="inputPass">
					<div class="innerBox">
						<label for="userPass" class="labels">비밀번호</label>
						<input type="password" name="pass" id="userPass" data-flag="no" class="inputDetail" maxlength="16">
						<p class="innerText">영문/숫자를 조합하여 입력</p>
					</div>
				</div>
				<div id="inputPassCheck">
					<div class="innerBox">
						<label for="userPassCheck" class="labels">비밀번호 확인</label>
						<input type="password" name="conformpass" id="userPassCheck" class="inputDetail" maxlength="16">
						<p class="innerText"></p>
					</div>
				</div>
				<div id="inputName">
					<div class="innerBox">
						<label for="userName" class="labels">이름</label>
						<input type="text" name="name" id="userName" data-flag="no" class="inputDetail" maxlength="16">
						<p class="innerText"></p>
					</div>
				</div>
				<div id="inputEmail">
					<div class="innerBox">
						<label for="userEmail" class="labels">이메일</label>
						<input type="text" name="email" id="userEmail" data-flag="no" class="emailDetail" maxlength="16">
						<div id="emptyBox">@</div>
						<input type="text" name="userEmailDetail" id="userEmailDetail" data-flag="no" class="emailDetail" maxlength="16" readonly="readonly">
						<select name="userEmailDomain" id="userEmailDomain" class="emailDetail">
							<option value="" selected="selected">선택해 주세요</option>
							<option value="@hanmail.com">hanmail.com</option>
							<option value="@naver.com">naver.com</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="etc">직접 입력</option>
						</select>
					</div>
				</div>
				<div id="emailResult">
					<p></p>
				</div>
			</div>
			<div id="inputBoxes2">
				<h5>필수항목</h5>
				<p>사이트를 원활하게 이용하기 위해서 사용자의 개인정보가 필요합니다.</p>
				<div id="inputPrivacy">
					<div class="innerBox2">
						<label for="userHeight" id="heightLabel">키(cm)</label>
						<input type="text" name="userHeight" id="userHeight" data-flag="no" class="privacyDetail" maxlength="3">
						<label for="userCurrentWeight" id="currentWeightLabel">현재 몸무게(Kg)</label>
						<input type="text" name="userWeight" id="userCurrentWeight" data-flag="no" class="privacyDetail" maxlength="3">
						<label for="userGoalWeight" id="goalWeightLabel">목표 몸무게(Kg)</label>
						<input type="text" name="goalWeight" id="userGoalWeight" data-flag="no" class="privacyDetail" maxlength="3">
						<p id="privacyResult"></p>
					</div>
				</div>
			</div>
			<div id="submitBox">
				<a href="#1" id="submitBtn">BITDAILY 가입</a>
			</div>
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/js/login/signup.js"></script>
</body>
</html>