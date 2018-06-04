<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Bit Daily</title>
<!--     Custom styles for this template -->
    <link href="<c:url value='/slider/full-slider.css'/>" rel="stylesheet">
    <style>
    .carousel-item{ 
       height: 610px;  
      }  
    .content {
       width: 100%;
    }
    </style>
  </head>
  <body>
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/images/banana.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>식단 기록</h3><br>
              <p><button onclick="location.href='${pageContext.request.contextPath}/jsp/diary/fooddiary.jsp'">ViewMore</button></p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/images/bicycle.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>운동 기록</h3><br>
              <p><button onclick="location.href='${pageContext.request.contextPath}/jsp/diary/exercisediary.jsp'">ViewMore</button></p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/images/pencil.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>다이어트 일기</h3><br>
              <p><button onclick="location.href='${pageContext.request.contextPath}/jsp/diary/dailydiary.jsp'">ViewMore</button></p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
  </body>
</html>
