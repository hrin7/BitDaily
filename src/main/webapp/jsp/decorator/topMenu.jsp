<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/bitdaily/jsp/main/main.jsp">B I T   D A I L Y</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="nav-diary">
              <a class="nav-link" href="<c:url value="/jsp/diary/fooddiary.jsp"/>">다이어리
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item" id="nav-report">
              <a class="nav-link" href="<c:url value="/jsp/diary/report.jsp"/>">리포트</a>
            </li>
            <li class="nav-item" id="nav-weight">
              <a class="nav-link" href="<c:url value="/jsp/diary/weightrecord.jsp"/>">체중기록</a>
            </li>
            <li class="nav-item" id="nav-recipe">
              <a class="nav-link" href="<c:url value="/jsp/diary/recipeList.jsp"/>">레시피</a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/jsp/stat/rank.jsp"/> style="text-decoration: none">　<img src="/bitdaily/images/icon/trophy.png" width="31px" height="31px"></a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/jsp/login/userinfo.jsp"/> style="text-decoration: none">　<img src="/bitdaily/images/icon/user.png" width="31px" height="31px" onmouseover="this.src='/bitdaily/images/icon/user2.png'" onmouseout="this.src='/bitdaily/images/icon/user.png'" ></a>
            </li>
            <li class="nav-item">
              <a href="#" style="text-decoration: none">　<img src="<c:url value="/images/icon/logout.png"/>" width="37px" height="33px"></a>
=======
              <a class="nav-link" href="${pageContext.request.contextPath}/jsp/stat/report.jsp">리포트</a>
            </li>
            <li class="nav-item" id="nav-weight">
              <a class="nav-link" href="${pageContext.request.contextPath}/jsp/stat/weightrecord.jsp">체중기록</a>
            </li>
            <li class="nav-item" id="nav-recipe">
              <a class="nav-link" href="${pageContext.request.contextPath}/jsp/recipe/recipeList.jsp">레시피</a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/jsp/stat/rank.jsp" style="text-decoration: none">　<img src="${pageContext.request.contextPath}/images/icon/trophy.png" width="31px" height="31px"></a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/jsp/login/userinfo.jsp" style="text-decoration: none">　<img src="${pageContext.request.contextPath}/images/icon/user.png" width="31px" height="31px" onmouseover="this.src='${pageContext.request.contextPath}/images/icon/user2.png'" onmouseout="this.src='${pageContext.request.contextPath}/images/icon/user.png'" ></a>
            </li>
            <li class="nav-item">
              <a href="#" style="text-decoration: none">　<img src="${pageContext.request.contextPath}/images/icon/logout.png" width="37px" height="33px"></a>
>>>>>>> 8a8adf9c7ee770f5639e99ea768628ef025f26ad
            </li>
          </ul>
        </div>
      </div>
    </nav>