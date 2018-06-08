<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	<c:forEach var="recipe" items="${result.list}">
		<div class="content-box">
			<a href="detail.do?recipeSeq=${recipe.recipeSeq}">
				<div class="imgDiv">
				<c:choose>
					<c:when test="${not empty recipe.fileList}">
					  <img src="<c:url value='${recipe.fileList[0].filePath}/${recipe.fileList[0].fileOriName}'/>" class="img"/>
					</c:when>
					<c:otherwise>
					  <img src="<c:url value='/images/noimage.png'/>" class="img"/>
					</c:otherwise>
				</c:choose>
				</div>
			</a>
			<h5>${recipe.title} [${recipe.commentCount}]</h5>
			글쓴이 ${recipe.name} 조회수 ${recipe.viewCount}<br>
			<fmt:formatDate value="${recipe.recipeDate}" pattern="yyyy-MM-dd"/> 
		</div>
	</c:forEach>
	<c:if test="${empty result.list}">
		입력된 게시물이 없습니다.
	</c:if>
	<div id="clear"></div>
</div>
<div id="write" style="text-align: right;">
	<form id="writeBtn" onsubmit="return check();" action="${pageContext.request.contextPath}/recipe/writeForm.do">
		<button onclick="return check();">글쓰기</button>
	</form>
</div>
<br>
	<c:import url="/WEB-INF/jsp/recipe/page.jsp" />
<br>

<script src="<c:url value='/js/recipe/recipeList.js'/> "></script>
<script>
	function check() {
		if (${empty sessionScope.member}) {
			alert("로그인 후 이용 가능합니다");
			return false;
		} else {
			return true;
		}
	};
	
	// 함수를 넘겨주고 그 페이지에서 이벤트(href)를 발생시키게 한다.
	function goPage(pageNo) {
		location.href = "list.do?pageNo=" + pageNo;
	}
	
	// 이벤트(click)를 여기서 주고 넘긴다
	$("ul.pagination > li > a").click(function () {
		// data("page") : data-page의 값을 가져올 수 있다.
		var no = $(this).data("page");
		if (no) {
			location.href = "list.do?pageNo=" + no;
		}
	});
</script>

</body>
</html>