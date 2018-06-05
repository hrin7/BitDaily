<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 상세 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link href="<c:url value='/css/recipe/input.css'/>" rel="stylesheet">
<link href="<c:url value='/css/recipe/recipeDetail.css'/>" rel="stylesheet">
<link href="<c:url value='/css/common/button.css'/>" rel="stylesheet">
</head>
<body>
<br><br>
<div id="outer">
	<div id="titleDiv">
		<br><br>
		<span id="titleSpan">${recipe.title}</span>
		<span id="writer">hrin</span>
	</div>
	<hr>
	<div id="right">
		<span id="regDate"><fmt:formatDate value="${recipe.recipeDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
	</div>
	<div id="content">
		<br>
		<c:forEach var="file" items="${fileList}">
			<img src="<c:url value='${file.filePath}/${file.fileOriName}'/>" width="500px;"><br><br>
		</c:forEach>
		${recipe.content}
		<br><br>
	</div>
	<div id="comment">
		<hr><br>
		<div class="comment_box">
			<h5>jungwon</h5>
			와~~ 맛있겠다~~~ 맛있는 다이어트 가능^^!! 나중에 꼭 리코타 치즈 만들어서 해먹어야겠어요~~ 리코타 치즈 만들 때 소금을 넣지 않으면 반려동물도 먹을 수 있다던데~~ 우리 애덜이랑 같이 먹어야겠어요~~^^ 감사합니다~~호호~~~
			<br>
			<span>2018.05.28 16:24</span>
			<br><br><hr><br>
		</div>
		<div class="comment_box">
			<h5>jungwon</h5>
			와~~ 맛있겠다~~~ 맛있는 다이어트 가능^^!! 나중에 꼭 리코타 치즈 만들어서 해먹어야겠어요~~ 리코타 치즈 만들 때 소금을 넣지 않으면 반려동물도 먹을 수 있다던데~~ 우리 애덜이랑 같이 먹어야겠어요~~^^ 감사합니다~~호호~~~
			<br>
			<span>2018.05.28 16:24</span>
			<br><br><hr><br>
		</div>
		<div><br>
			<h5>댓글쓰기</h5>
			<textarea></textarea>
			<button>등록</button>
		</div>
	</div>
<br><br><br><br><br><br><br>
</div>

<script src="<c:url value='/js/recipe/recipeDetail.js'/>"></script>
</body>
</html>