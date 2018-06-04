<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="<c:url value='/css/recipe/recipeList.css'/>" rel="stylesheet">
<link href="<c:url value='/css/common/button.css'/>" rel="stylesheet">
</head>
<body>
<br><br>
<div>
	<img style="margin-left: 36px;" src="<c:url value='/images/icon/groceries.png'/> ">
	<span id="title">Diet Recipe</span>
	<form class="search-container">
	    <input type="text" id="search-bar" placeholder="레시피 검색">
	    <a href="#"><img class="search-icon" src="<c:url value='/images/icon/search2.png'/> "></a>
	</form>
	<div id="clear"></div>
</div>
<div id="outer">
	<c:forEach var="recipe" items="${list}">
		<div class="content-box">
			<div class="imgDiv">
			  <a href="<c:url value='/jsp/recipe/recipeDetail.jsp'/> "><img src="<c:url value='/images/salad.jpg'/> " class="img"/></a>
			</div>
			 <h4>${recipe.title}</h4>
			 글쓴이 hrin 조회수 ${recipe.viewCount}
		</div>
	</c:forEach>
	<c:if test="${empty list}">
		입력된 게시물이 없습니다.
	</c:if>
	<div id="clear"></div>
</div>
<div id="write" style="text-align: right;">
	<button onclick = "location.href='/bitdaily/jsp/recipe/recipeWriteForm.jsp'">글쓰기</button>
</div>
<br>
<div id="pageing">[1][2][3][4][5]</div>
<br>

<script src="<c:url value='/js/recipe/recipeList.js'/> "></script>
</body>
</html>