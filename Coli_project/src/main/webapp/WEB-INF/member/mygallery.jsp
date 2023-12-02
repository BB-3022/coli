<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="user"
   value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth"
   value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>DrawColi</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="TemplatesJungle">
<meta name="keywords" content="Free HTML Template">
<meta name="description" content="Free HTML Template">

<link rel="stylesheet" type="text/css"
   href="${cpath}/icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="${cpath}/css/vendor.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${cpath}/css/style.css">
<link rel="stylesheet" type="text/css"
   href="${cpath}/css/pricing-plan.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
   rel="stylesheet">

<style>
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'SUITE-Regular';
}

.post-writer {
	text-align: right;
	margin-bottom: 0;
}

.post-title {
	text-align: center;
}

.post-content {
	position: relative; /* 상대적 위치 설정 */
	padding-top: 30px !important;
	padding-bottom: 30px !important;
}

.inner_content {
	width: 100%; /* 부모 div의 95% 너비 */
	margin: 0 auto; /* 가운데 정렬 */
	padding: 10px; /* 내부 여백 */
	/*border-bottom: 3px solid #fff;
		    border-top: 2px solid #fff;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);  */
}

.post-image {
	height: 600px;
	width: -webkit-fill-available;
}

#container {
	display: flex; /* 컨텐츠를 가로 정렬하기 위해 flex 사용 */
	justify-content: center;
	margin: 0;
}

.fixed-write-button {
	font-family: 'SUITE-Regular';
	position: absolute; /* 고정 위치 */
	right: 50px; /* 오른쪽에서 20px 떨어진 곳에 배치 */
	top: 350px; /* 아래쪽에서 100px 떨어진 곳에 배치 */
	background-color: rgba(255, 255, 255, 0.7);
	font-size: 20px;
	border-radius: 5px;
	display: flex;
	height: 50px;
	align-items: center;
	border: #fff;
}

.black {
	color: #000 !important;
	font-weight: bold;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
}

.fixed-write-button:hover {
	background-color: #f2f2f2;
}

.go-to-top-button {
	position: fixed; /* 고정 위치 */
	right: 15px; /* 오른쪽에서 20px 떨어진 곳에 배치 */
	bottom: 20px; /* 아래쪽에서 20px 떨어진 곳에 배치 */
	border-radius: 50%; /* 모서리를 둥글게 */
	background-color: #3d3d3d; /* 배경색 */
	color: #fff; /* 글씨색 */
	width: 50px; /* 너비 */
	height: 50px; /* 높이 */
	text-align: center; /* 텍스트 가운데 정렬 */
	line-height: 50px; /* 세로 정렬을 위한 라인 높이 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	cursor: pointer; /* 마우스 오버시 커서 변경 */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);
}

.go-to-top-button:hover {
	background: #2d2d2d;
	color: #fff;
}

.ec-base-paginate li a {
	background: none;
}

.ec-base-paginate li a.this {
	background: #fff !important;
}
</style>
</head>
<body>
   <%@ include file="/WEB-INF/header.jsp"%>
   <section id="login-intro" class="login-section">
      <div class="log-in">
         <div class="login-top">
            <img src="${cpath}/images/main-banner1.png" alt="banner"
               class="login-img">
            <div class="login-content">
               <h2 class="login-title">My Gallery</h2>
            </div>
            <!--banner-content-->
         </div>
         <!--slider-item-->
      </div>
   </section>

<!-- 기존 코드의 나머지 부분은 생략 -->


<section id="portfolio" class="scrollspy-section bg-dark padding-large" style="Padding:40px;">
    <div class="container">
        <!-- index 페이지의 갤러리 -->
        <div style="margin-left:20px;"><h4 class="login-title" style="margin-left:20px; color : #FFE0C6">Repository</h4></div>
        <div class="row" style="Padding:40px;">
            <div class="col-md-12">
                <div class="post-grid">
                    <div class="row">
                        <!-- 새로운 이미지 표시 방식 적용 -->
                        <c:forEach items="${images}" varStatus="status">
                            <div class="col-md-4">
                                <article class="post-item">
                                    <figure>
                                        <a href="${cpath}/board/detail/${article.atc_id}" class="image-hvr-effect">
                                            <img src="${cpath}/myUploadFile/${images[status.index]}" alt="Image" class="post-image" style="height: 370px;">
                                        </a>
                                    </figure>
                                    <div class="post-content" style="background-color: #3c3c3c;">
                                        <div class="inner_content">
                                            <!-- 각 이미지에 고유 ID 부여 -->
                                            <p class="post-writer" id="date-${status.index}" style="color:white; text-align: center;"></p>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var totalDays = 30; // 11월의 총 일수
            for (var i = 0; i < totalDays; i++) {
                var date = new Date(2023, 10, 30 - i); // 월은 0부터 시작하므로 10이 11월
                var formattedDate = date.toISOString().split('T')[0]; // YYYY-MM-DD 형식
                var dateElement = document.getElementById("date-" + i);
                if (dateElement) {
                    dateElement.innerText = formattedDate;
                }
            }
        });
    </script>
</section>

<!-- 기존 코드의 나머지 부분은 생략 -->



   <script src="${cpath}/js/jquery-1.11.0.min.js"></script>
   <script src="${cpath}/js/ui-easing.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
   <script
      src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
   <script src="${cpath}/js/plugins.js"></script>
   <script src="${cpath}/js/script.js"></script>

</body>

</html>