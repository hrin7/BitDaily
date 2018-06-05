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
		<form action="${pageContext.request.contextPath}/login/join.do" method="POST">
		<p class="input">ID</p>
		<input class="place" type="text" name="id">
		<a id="idcheck" href="javascript:void(0);">중복확인</a>		
		<p class="input">Name</p>
		<input class="place" type="text" name="name">
		<p class="input">Email</p>
		<input class="place" type="text" name="email">
		<a id="idcheck" href="javascript:void(0);">중복확인</a>
		<p class="input">Password</p>
		<input class="place" type="text" name="pass">
 		<p class="input">Confirm password</p> 
 		<input class="place" type="text"><br><br>
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
			<input class="btn" type="submit" value="Sign Up">
		</footer>
		</form>
	</div>
</div>
</body>
</html>