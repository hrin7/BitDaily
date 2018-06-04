<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/slider/common.css">
<link href="${pageContext.request.contextPath}/slider/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<sitemesh:write property="head" /> 
<style type="text/css">
</style>
</head>
<body>
  
	<div class="header">
	  <c:import url="/jsp/decorator/topMenu.jsp" />
	</div>	
	
	<div class="content">
	  <sitemesh:write property="body" /> 
	</div>	
	
	<div class="footer">
	  <c:import url="/jsp/decorator/footer.jsp" />
	</div>	
	
  
  <script src="<c:url value="/slider/vendor/jquery/jquery.min.js"/> "></script>
  <script src="<c:url value="/slider/vendor/bootstrap/js/bootstrap.bundle.min.js"/> "></script>
</body>
</html>























