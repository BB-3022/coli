<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<%@ page import="java.util.List" %>
<%@ page import="kr.spring.service.FileUtilsService" %>

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

<link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	
<style type="text/css">
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

.btn.btn-accent {
	background: #3d3d3d;
}

.btn.btn-accent:hover {
	background: #007bff;
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
</style>
</head>
<body>

	<%@ include file="/WEB-INF/header.jsp"%>

	<section id="intro" class="scrollspy-section">
		<div class="main-slider">
			<div class="slider-item jarallax" data-speed="0.2">
				<img src="images/main-banner1.png" alt="banner" class="jarallax-img">
				<div class="banner-content">
					<h2 class="banner-title txt-fx">Draw Coli</h2>
					<div class="btn-wrap">
						<a href="${cpath}/draw2" class="btn-with-line">Let's Draw</a>
					</div>
				</div>
				<!--banner-content-->
			</div>
			<!--slider-item-->

			<div class="slider-item jarallax" data-speed="0.2">
				<img src="images/main-banner2.png" alt="banner" class="jarallax-img">
				<div class="banner-content">
					<h2 class="banner-title txt-fx">Move, it will be drawn</h2>
					<div class="btn-wrap">
						<a href="#" class="btn-with-line">Let's Draw</a>
					</div>
				</div>
				<!--banner-content-->
			</div>
			<!--slider-item-->

			<div class="slider-item jarallax" data-speed="0.2">
				<img src="images/main-banner3.png" alt="banner" class="jarallax-img">
				<div class="banner-content">
					<h2 class="banner-title txt-fx">My own character</h2>
					<div class="btn-wrap">
						<a href="draw2.jsp" class="btn-with-line">Let's Draw</a>
					</div>
				</div>
				<!--banner-content-->
			</div>
			<!--slider-item-->
		</div>
		<!--slider-->

		<div class="button-container">
			<button class="prev slick-arrow">
				<i class="icon icon-chevron-thin-left"></i>
			</button>
			<button class="next slick-arrow">
				<i class="icon icon-chevron-thin-right"></i>
			</button>
		</div>
	</section>

	<section id="about" class="scrollspy-section padding-xlarge">
		<div class="container">
			<div class="row">

				<div class="col-md-12">

					<div class="section-header">
						<div class="title">
							<span>What's Drawcoli?</span>
						</div>
						<h2 class="section-title">About Us</h2>
					</div>
				</div>

			</div>

			<div class="row">

				<div class="col-md-6">
					<figure class="jarallax-keep-img">
						<img src="images/ex.jpg" alt="about us"
							class="jarallax-img single-image">
					</figure>
				</div>
				<div class="col-md-6 description text-lead">
					<p>
						<strong>처음 그림을 그리시는 분들도 쉽게 그림을 그릴 수 있도록 도와주는 웹 서비스입니다.
							인체그리기가 어려우신 분들은 저희 드로콜리를 통해 자동으로 생성된 3D모델 위에 작업을 하게되면 완벽한 인체 그림을
							그릴 수 있습니다.</strong>
					</p>
					<p>저희가 제공하는 기본 포즈들을 이용해서 모델을 생성해도 되고, 원하는 포즈를 취한 이미지를 업로드해서 모델을
						생성해도 좋습니다. 두 가지 방법으로 원하는 포즈를 찾지 못했다면 직접 영상을 촬영해보세요! 나의 움직임에 따라 모델이
						생성됩니다.</p>
					<p>드로콜리가 제공하는 캐릭터를 이용해 나만의 캐릭터를 만들어보세요. 내가 가지고 있는 캐릭터가 있다면 생성된
						모델에 적용시켜보세요! 내가 원하는 자세로 캐릭터가 생성됩니다.</p>

					<div class="btn-wrap">
						<a href="${cpath}/draw2"
							class="btn btn-accent btn-xlarge btn-rounded">GO TO MAKE → </a>
					</div>

				</div>

			</div>

		</div>
	</section>

	<section id="latest-blog"
		class="scrollspy-section bg-grey padding-large">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section-header">
						<div class="title">
							<span>read our gallery</span>
						</div>
						<h2 class="section-title">User Gallery</h2>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="post-grid">
						<div class="row">
							<!-- 게시물 목록 출력 부분 -->
							<c:forEach var="article" items="${articles}"
								varStatus="loopStatus">
								<c:if test="${loopStatus.index < 3}">
									<div class="col-md-4">
										<article class="post-item">
											<figure>
												<a href="${cpath}/board/detail/${article.atc_id}"
													class="image-hvr-effect"> <img
													src="<c:choose>
				                                                <c:when test='${not empty article.articleFiles}'>
				                                                    <c:set var='firstFile' value='${article.articleFiles[0]}' />
				                                                    <c:set var='filePath' value='${firstFile.file_path}' />
				                                                    <c:set var='fileName' value='${FileUtilsService.getFileName(filePath)}' />
				                                                    ${cpath}/uploadFile/${fileName}
				                                                </c:when>
				                                                <c:otherwise>
				                                                    ${cpath}/images/default.png
				                                                </c:otherwise>
				                                            </c:choose>"
													alt="post" class="post-image"
													onerror="handleImageError(this, '${cpath}/images/default.png')">
												</a>
											</figure>
											<div class="post-content">
												<div class="meta-date">${article.created_at}</div>
												<h3 class="post-title">
													<a href="#">${article.atc_title}</a>
												</h3>
												<p>${article.atc_content}</p>
											</div>
										</article>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="btn-wrap align-center">
						<a href="${cpath}/board/gallery"
							class="btn btn-xlarge btn-accent btn-rounded">View all
							gallery</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section id="services" class="scrollspy-section padding-large">
		<div class="container">
			<div class="row">
				<div class="section-header col-12">
					<div class="title">
						<span>Our Membership</span>
					</div>
					<h2 class="section-title">Service Plan</h2>
				</div>

			</div>

			<div class="row">

				<div class="col-md-4">
					<div class="services-item">
						<span class="number">01</span>
						<h3>Free</h3>
						<p>
							• 500 개 이상의 다양한 포즈 선택<br> • AI 드로잉 (일 10회 제공)<br> • 기본
							캐릭터 제공<br> • 모델 및 캐릭터 다운로드 (일 3회)
						</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="services-item">
						<span class="number">02</span>
						<h3>Standard</h3>
						<p>
							• 500 개 이상의 다양한 포즈 선택<br> • 이미지 업로드를 통한 포즈 생성<br> • AI
							드로잉 (무제한)<br> • 기본 캐릭터 제공<br> • 모델 및 캐릭터 다운로드 (무제한)
						</p>
					</div>

				</div>

				<div class="col-md-4">
					<div class="services-item">
						<span class="number">03</span>
						<h3>Pro</h3>
						<p>
							• 500 개 이상의 다양한 포즈 선택<br> • 이미지 업로드를 통한 포즈 생성<br> • 영상
							인식을 통한 포즈 생성<br> • AI 드로잉 (무제한)<br> • 기본 캐릭터 제공<br>
							• 모델 및 캐릭터 다운로드 (무제한)
						</p>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col">
					<div class="btn-wrap align-center">
						<a href="${cpath}/plan"
							class="btn btn-xlarge btn-accent btn-rounded">Choose Your
							Plan</a>
					</div>
				</div>
			</div>
		</div>
	</section>



	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="copyright">
						<p>© 2023 DrawColi. All rights reserved.</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="copyright text-right">
						<p>DrawColi by TeamColi</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 상단으로 가는 화살표 버튼 -->
	<a href="#" class="go-to-top-button"><i
		class="fa-solid fa-arrow-up"></i></a>


	<script>
		document.addEventListener('DOMContentLoaded', function() {
		  const dateElements = document.getElementsByClassName('meta-date');

		  for (const dateElement of dateElements) {
		    const isoDateString = dateElement.textContent;
		    const date = new Date(isoDateString);

		    const formattedDate = date.toLocaleDateString('ko-KR', {
		      year: 'numeric',
		      month: 'long',
		      day: 'numeric',
		      hour: '2-digit',
		      minute: '2-digit',
		      second: '2-digit'
		    });

		    dateElement.textContent = formattedDate;
		  }
		});

	</script>



	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/ui-easing.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script
		src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>
</html>