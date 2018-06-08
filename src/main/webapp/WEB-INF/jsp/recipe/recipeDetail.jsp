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
			<form id="writeForm">
				<h5>댓글쓰기</h5>
				<textarea name="commentText"></textarea>
				<button>등록</button>
			</form>
			<div style="text-align: right;">
				<c:if test="${sessionScope.member.userSeq eq recipe.userSeq}">
					<button onclick="location.href='updateForm.do?recipeSeq=${recipe.recipeSeq}'">수정</button>
					<button onclick="location.href='delete.do?recipeSeq=${recipe.recipeSeq}'">삭제</button>
				</c:if>
				<button onclick="location.href='${pageContext.request.contextPath}/recipe/list.do'">목록</button>
			</div>
		</div>
	</div>
<br><br><br><br><br><br><br>
</div>

<script src="<c:url value='/js/recipe/recipeDetail.js'/>"></script>
<script>
	function makeCommentList(result) {
// 		debugger
// 		console.dir(result);
		var html = "";
		for (let i = 0; i < result.length; i++) {
			var comment = result[i];
		console.dir(${sessionScope.member.userSeq});
		console.dir(comment.userSeq);
		console.log("-------------")
			html += '<div class="comment_box" id="comment'+comment.commentSeq+'">';
			html += '  <h5><span id="commentName">'+comment.name+'</span>';
			if (${sessionScope.member.userSeq} == comment.userSeq) {
			html += '    <button onclick="commentUpdateForm('+comment.commentSeq+');">수정</button>'
			html += '    <button onclick="commentDelete('+comment.commentSeq+');">삭제</button></h5>';
			}
			html += '  <div id="commentTextDiv">'+comment.commentText+'</div>';
			html += '  <br>';
			var date = new Date(comment.commentDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '  <span>'+ time +'</span>';
			html += '</div>';
			html += '<br><br><hr><br>';
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
	
// 	function check() {
// 		if (${empty sessionScope.member}) {
// 			alert("로그인 후 이용 가능합니다");
// 			return false;
// 		} else {
// 			return true;
// 		}
// 	};
	
	$("#writeForm").submit(function (e) {
		e.preventDefault();
		$.ajax({
			url: "<c:url value='/recipe/commentWrite.do'/>",
			data: {
				userSeq: "${sessionScope.member.userSeq}",
				recipeSeq: "${recipe.recipeSeq}",
				commentText: $("#writeForm textarea").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			$("#writeForm textarea").val("");
			makeCommentList(result);
		});
	});
	
	function commentDelete(commentSeq) {
		$.ajax({
			url: "<c:url value='/recipe/commentDelete.do'/>",
			data: {
				recipeSeq: "${recipe.recipeSeq}",
				commentSeq: commentSeq
			},
			dateType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(commentSeq) {
		var html = '';
		html += '<div id="modComment'+ commentSeq +'">';
		html += '  <h5>' + $("#comment"+commentSeq+"> h5 > #commentName").text();
		html += '  <button onclick="commentUpdate('+ commentSeq +');">수정</button>';
		html += '  <button onclick="commentCancel('+ commentSeq +');">취소</button></h5>';
		html += '<textarea name="commentText" id="commentText'+ commentSeq +'">';
		html += $("#comment"+commentSeq+"> #commentTextDiv").text();
		html += '</textarea>';
		html += '</div>';
		$("#comment" + commentSeq).after(html);
		$("#comment" + commentSeq).hide();
	}
	
	function commentUpdate(commentSeq) {
		$.ajax({
			url: "<c:url value='/recipe/commentUpdate.do'/>",
			type: "POST",
			data: {
				recipeSeq: "${recipe.recipeSeq}",
				commentSeq: commentSeq,
				commentText: $("#commentText" + commentSeq).val()
			},
			dateType: "json",
			success: function (result) {
				makeCommentList(result);
			}
		});
	}
	
	function commentCancel(commentSeq) {
		$("#comment" + commentSeq).show();
		$("#modComment" + commentSeq).remove();
	}
	
	commentList();
</script>

</body>
</html>