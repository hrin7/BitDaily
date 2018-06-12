<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/spring-bitdiary/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/sweetalert/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/sweetalertFile/sweetalert2.all.min.js"></script>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/login.css" />
</head>
  <%
    String clientId = "MCZXY_QBmhXRmDMH4Rr7";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/spring-bitdiary/login/callback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<body>
<!-- 배경 -->
  <figure class='vid'>
     <video autoplay="autoplay" loop="loop" muted="muted">
        <source src="${pageContext.request.contextPath}/images/askyfullofstarsmp4.mp4">
     </video>
  </figure>
      
      
  <div class="form_wrapper">
  <div class="form_container">
    <div class="title_container">
      <h2>BITDAILY LOGIN</h2>
    </div>
    <div class="row clearfix">
      <div class="col_half">
        <div class="social_btn fb"><a href="<%=apiURL%>"><span><i class="fa fa-facebook" aria-hidden="true"></i></span>Sign in with Naver</a></div>
        <div class="social_btn tw"><a href="#"><span><i class="fa fa-twitter" aria-hidden="true"></i></span>Sign in with KaKaoTalk</a></div>
        <div class="row clearfix create_account">
          <div><a href="${pageContext.request.contextPath}/login/signupform.do">&nbsp;Create an Account</a></div>
        </div>
      </div>
      <div class="col_half last">
        <form  action="${pageContext.request.contextPath}/login/login.do" method="POST">
          <div class="input_field"><span><i class="fa fa-envelope" aria-hidden="true"></i></span>
            <input type="text" name="id" placeholder="ID" />
          </div>
          <div class="input_field"><span><i class="fa fa-lock" aria-hidden="true"></i></span>
            <input type="text" name="pass" placeholder="Password" />
          </div>
          <input class="button" type="submit" value="로그인"/>
        </form>
        
          <div class="row clearfix bottom_row">
            <div class="col_half searchPass"><input class="searchPass" id="searchpass" value="Forgot Password?" type="button" ></div>
            <div class="col_half searchPass"><input class="searchId" id="searchId" value="Forgot ID?" type="button" ></div>
          </div>
          
          
          
          
      </div>
    </div>
  </div>
</div>

	<script>
	
	
	//로그인 실패시 alert창 뜸.
	if ("${msg}") { 
// 		alert("${msg}"); 
		swal("${msg}");
	} 
	
	
	
	//비번 찾기
	var findpass;
	$("#searchpass").click(function () {
		swal.mixin({
		  input: 'text',
		  confirmButtonText: '전송',
		  showCancelButton: true,
		  progressSteps: ['1', '2']
		}).queue([
		  {
		    title: 'ID를 입력하세요',
		    text: '...'
		  },
		  '이메일을 입력하세요',
		]).then(function(result){
			findId = result;
			fnFindId(findId);
		
		})
	});
	function fnFindId(data) {
		$.ajax({
			url : "${pageContext.request.contextPath}/login/fogetPass.json",
			type: "POST",
			data : {
				"id" : data.value[0],
				"email": data.value[1]
			},
		}).done(function (val) {
			swal("회원의 비밀번호는 "+val.pass + "입니다");
		}).fail(function () {
			swal('이름과 이메일의 정보가 일치 하지 않습니다.!')
		});
	}

	
	
		//ID 찾기
		var findId;
		$("#searchId").click(function () {
			swal.mixin({
			  input: 'text',
			  confirmButtonText: '전송',
			  showCancelButton: true,
			  progressSteps: ['1', '2']
			}).queue([
			  {
			    title: '이름을 입력하세요',
			    text: '...'
			  },
			  '이메일을 입력하세요',
			]).then(function(result){
				findId = result;
				fnFindId(findId);
			
			})
		});
		function fnFindId(data) {
			$.ajax({
				url : "${pageContext.request.contextPath}/login/fogetId.json",
				type: "POST",
				data : {
					"name" : data.value[0],
					"email": data.value[1]
				},
			}).done(function (val) {
				swal("회원의 아이디는 "+val.id + "입니다");
				console.log(val);
			}).fail(function () {
				swal('이름과 이메일의 정보가 일치 하지 않습니다.!')
			});
		}


	</script>
</body>
</html>