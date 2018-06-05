<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bitdaily/sweetalertFile/sweetalert2.css" />
<script src="../../sweetalert/jquery-3.2.1.js"></script>
<script src="../../sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/login.css" />
<style>

	
	
</style>
</head>
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
        <div class="social_btn fb"><a href="#"><span><i class="fa fa-facebook" aria-hidden="true"></i></span>Sign in with Naver</a></div>
        <div class="social_btn tw"><a href="#"><span><i class="fa fa-twitter" aria-hidden="true"></i></span>Sign in with KaKaoTalk</a></div>
        <div class="row clearfix create_account">
          <div><a href="SignUpForm.jsp">&nbsp;Create an Account</a></div>
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
          <input class="button" type="submit" value="Sign in"/>
        </form>
          <div class="row clearfix bottom_row">
            <div class="col_half searchPass"><input class="searchPass" id="searchPass" value="Forgot Password?" type="submit" ></div>
            <div class="col_half searchPass"><input class="searchId" id="searchId" value="Forgot ID?" type="submit" ></div>
          </div>
      </div>
    </div>
  </div>
</div>
	<script>
	//로그인 실패시 alert창 뜸.
	if ("${msg}") { 
		alert("${msg}"); 
	} 
	
	//비번찾기
		$("#searchPass").click(function () {
			swal.mixin({
			  input: 'text',
			  confirmButtonText: 'Next &rarr;',
			  showCancelButton: true,
			  progressSteps: ['1', '2', '3']
			}).queue([
			  {
			    title: 'ID를 입력하세요',
			    text: '...'
			  },
			  '이메일을 입력하세요',
			]).then((result) => {
			  if (result.value) {
			    swal({
			      title: '비밀번호는..',
			      html:
			        '비밀번호 수정 권장: <pre>' +
			          JSON.stringify(result.value) +
			        '</pre>',
			      confirmButtonText: '성공!'
			    })
			  }
			})
		});
		//ID 찾기
		$("#searchId").click(function () {
			swal.mixin({
			  input: 'text',
			  confirmButtonText: 'Next &rarr;',
			  showCancelButton: true,
			  progressSteps: ['1', '2', '3']
			}).queue([
			  {
			    title: '이름을 입력하세요',
			    text: '...'
			  },
			  '이메일을 입력하세요',
			]).then((result) => {
			  if (result.value) {
			    swal({
			      title: 'ID는..',
			      html:
			        ':D: <pre>' +
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