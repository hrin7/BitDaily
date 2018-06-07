<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
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
		<span id="writer">${recipe.name}</span>
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
		<div id="commentList"></div>
		<div><br>
			<h5>댓글쓰기</h5>
			<textarea></textarea>
			<button>등록</button>
			<div style="text-align: right;">
				<button onclick="location.href='updateForm.do?recipeSeq=${recipe.recipeSeq}'">수정</button>
				<button onclick="location.href='delete.do?recipeSeq=${recipe.recipeSeq}'">삭제</button>
				<button onclick="location.href='${pageContext.request.contextPath}/recipe/list.do'">목록</button>
			</div>
		</div>
	</div>
<br><br><br><br><br><br><br>
</div>

<script src="<c:url value='/js/recipe/recipeDetail.js'/>"></script>
<script>
	function makeCommentList(result) {
// 		console.dir(result);
		var html = "";
		for (let i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<div class="comment_box">';
			html += '  <h5>'+comment.name+'</h5>';
			html += comment.commentText;
			html += '  <br>';
			var date = new Date(comment.commentDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '  <span>'+ time +'</span>';
			html += '  <br><br><hr><br>';
			html += '</div>';
		}
		if (result.length == 0) {
			html += '<div class="comment_box">댓글이 존재하지 않습니다.</div>'
		}
		$("#commentList").html(html);
	}
	
	function commentList() {
		$.ajax({
			url: "<c:url value='/recipe/commentList.do'/>",
			data: {recipeSeq:"${recipe.recipeSeq}"},
			dataType: "json",
			success: makeCommentList
		});
	}
	
	commentList();
</script>

</body>
</html>