<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<p class="input">ID</p>
		<input class="place" type="text">
		<a id="idcheck" href="javascript:void(0);">중복확인</a>		
		<p class="input">Name</p>
		<input class="place" type="text">
		<p class="input">Email</p>
		<input class="place" type="text">
		<a id="idcheck" href="javascript:void(0);">중복확인</a>
		<p class="input">Password</p>
		<input class="place" type="password">
 		<p class="input">Confirm password</p> 
 		<input class="place" type="password">
		<p class="input">Age</p>
	    <div class="input-group"><input class="place" type="text"></div><br>
		<span class="input1">Gender&nbsp;&nbsp;</span>
        <input type="radio" id="female" value="female" name="gender">
        <label for="female" class="light">Female</label>
        <input type="radio" id="male" value="male" name="gender">
        <label for="male" class="light">Male</label><br><br>
		<span class="input1">키(cm)</span>
		<input class="place1" type="text">
		<span class="input1">&nbsp;&nbsp;현재 몸무게(kg)</span>
		<input class="place1" type="text">	
		<span class="input1">&nbsp;&nbsp;목표 몸무게(kg)</span>
		<input class="place1" type="text">				
		<footer>
			<input class="btn" type="submit" value="Sign Up">
		</footer>
	</div>
</div>
</body>
</html>