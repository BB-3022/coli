<%@page import="kr.spring.service.FileUtilsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />

<%@ page import="java.util.List"%>
<%@ page import="kr.spring.service.FileUtilsService"%>

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
<link rel="stylesheet" type="text/css" href="${cpath}/css/style3.css">
<link rel="stylesheet" type="text/css"
	href="${cpath}/css/pricing-plan.css">
<link rel="stylesheet" type="text/css" href="${cpath}/css/form.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<% String fileName = ""; %>

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
					<h2 class="login-title">Gallery</h2>
				</div>
				<!--banner-content-->
			</div>
			<!--slider-item-->
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
			<!-- index 페이지의 갤러리 -->
			<div class="row">
				<div class="col-md-12">

					<div class="post-grid">
						<!-- 실험 -->

						<div class="col-md-12">
							<div class="post-grid">
								<div class="row">
									<c:forEach var="article" items="${articles}">
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
													<div class="inner_content">
														<div class="meta-date">${article.created_at}</div>
														<h3 class="post-title">
															<a href="${cpath}/board/detail/${article.atc_id}">${article.atc_title}</a>
														</h3>
														<p class="post-writer">- ${article.writer_id.nickname}</p>
													</div>
												</div>
											</article>
										</div>
									</c:forEach>
								</div>
							</div>
							<script>
				    function handleImageError(img, defaultImagePath) {
				        img.onerror = null; // 이벤트 핸들러 중복 실행 방지
				        img.src = defaultImagePath;
				    }
				</script>


						</div>
					</div>
				</div>
			</div>

			<!-- index 페이지의 갤러리 끝-->

		</div>

		<div
			class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
			<a href="#none" class="first"> <%-- <img src="${cpath}/images/image/btn_page_first.gif" alt="첫 페이지"> --%>
			</a> <a href="#none"> <%-- <img src="${cpath}/images/image/btn_page_prev.gif"> --%>
			</a>
			<ol>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=1"
					class="other"><i class="fa-solid fa-angles-left"></i></a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=1"
					class="other"><i class="fa-solid fa-chevron-left"></i></a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=1"
					class="this">1</a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=2"
					class="other">2</a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=3"
					class="other">3</a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=4"
					class="other">4</a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=1"
					class="other"><i class="fa-solid fa-angle-right"></i></a></li>
				<li class="xans-record-"><a href="?cate_no=27&amp;page=1"
					class="other"><i class="fa-solid fa-angles-right"></i></a></li>
			</ol>
			<a href="?cate_no=27&amp;page=2"> <%-- <img	src="${cpath}/images/image/btn_page_next.gif" alt="다음 페이지"> --%>
			</a> 
			<a href="?cate_no=27&amp;page=4" class="last"> <%-- <img src="${cpath}/images/image/btn_page_last.gif" alt="마지막 페이지"> --%>
			</a> 
			<span class="gRight"> <a href="${cpath}/board/boardform" onclick="" class="Button button-rounded button-normal black fixed-write-button">글쓰기</a></span>
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