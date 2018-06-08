<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.pagination { margin: 0px 520px; }
ul {
	list-style:none; float:left; display:inline;
}
ul li.disabled {  
    float:left;  
}  
ul.pagination  a {  
    float:left;  
    padding:4px;  
    margin-right:3px;  
    width:15px;  
    color:#000;  
    font:bold 12px tahoma;  
    border:1px solid #eee;  
    text-align:center;  
    text-decoration:none;  
}  
ul.pagination a:hover, ul.pagination a:focus {  
    color:#fff;  
    border:1px solid #f40;  
    background-color:#f40;  
}  
</style>
<c:if test="${pageResult.count != 0}">
	<nav>
	  <ul class="pagination">
	  	<li class="<c:if test="${result.pageResult.prev eq false}">disabled</c:if>">
	      <a <c:if test="${result.pageResult.prev eq true}">data-page="${result.pageResult.beginPage - 1}"</c:if> href="#1" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>        
	  
	  	<c:forEach var="i" begin="${result.pageResult.beginPage}" end="${result.pageResult.endPage}">
	  		<c:choose>
	  			<c:when test="${result.pageResult.pageNo eq i}">
				    <li class="active"><a href="#1">${i}</a></li>
	  			</c:when>
	  			<c:otherwise>
				    <li><a href="#1" data-page="${i}">${i}</a></li>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>
	  	
	  	<li class="<c:if test="${result.pageResult.next eq false}">disabled</c:if>">
	      <a <c:if test="${result.pageResult.next eq true}">data-page="${result.pageResult.endPage + 1}"</c:if> href="#1" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</c:if>





