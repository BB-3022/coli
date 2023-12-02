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
<link rel="stylesheet" type="text/css" href="${cpath}/css/form.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
<script type="text/javascript">
    var upload_files = new Array();
    <c:forEach items="${article.articleFiles}" var="item">
    	upload_files.push({
    		file_path : "${item.file_path}",
    		file_name : "${item.file_name}"
    	});
	</c:forEach>
    
    </script>

</head>
<body style="overflow-x: hidden;">
	<%@ include file="/WEB-INF/header.jsp"%>
	<section id="login-intro" class="login-section">
		<div class="log-in">
			<div class="login-top">
				<img src="${cpath}/images/main-banner1.png" alt="banner"
					class="login-img">
				<div class="login-content">
					<h2 class="login-title">Upload</h2>
				</div>
				<!--banner-content-->
			</div>
			<!--slider-item-->
		</div>
	</section>
	<div id="write-container">
		<div id="contents">
			<div
				class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4">
				<div
					class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="title">
						<h2>
							<font color="#555555">COLI GALLERY</font>
						</h2>
						<p>회원님들의 작품을 올려주세요.</p>
					</div>
				</div>

				<!-- 글 작성 폼 -->
				<form id="articleForm" action="${cpath}/board/register"
					method="post" enctype="multipart/form-data">
					<div
						class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
						<div class="ec-base-table typeWrite ">
							<table border="1" summary>
								<caption>글쓰기 폼</caption>
								<colgroup>
									<col style="width: 130px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td><input id="atc_title" name="atc_title"
											fw-filter="isFill" fw-label="제목" fw-msg class="inputTypeText"
											placeholder maxlength="125" value="${article.atc_title}">
										</td>
									</tr>
									<tr>
										<td colspan="2" class="clear">
											<div class="fr-box fr-ltr ec-froala-theme fr-basic fr-top"
												role="application">
												<div class="fr-wrapper" dir="ltr">
													<div id="atc_content" class="fr-view" dir="ltr"
														contenteditable="true" style="min-height: 400px;"
														aria-disabled="false" spellcheck="true">
														${article.atc_content}</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
								<tbody>
									<c:set var="file" value="${article.articleFiles}" />
									<c:forEach begin="1" end="5" varStatus="loop">
										<tr>
											<th scope="row">첨부파일 ${loop.index}</th>
											<td><c:choose>
													<c:when test="${not empty file[loop.index-1]}">
														<p id="file-${loop.index}">
															<a href="${file[loop.index-1].file_path}">${file[loop.index-1].file_name}</a><a
																onclick="remove_file(${loop.index},${file[loop.index-1].file_id})">
																<img src="${cpath}/images/x.png" alt="banner"
																class="login-img" style="width: 15px; cursor: pointer">
															</a>
														</p>
													</c:when>
													<c:otherwise>
														<p>
															<input name="attach_file[]" type="file"
																style="background-color: transparent;"
																onchange="uploadFiles(${loop.index})">
														</p>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="ec-base-button">
							<span class="gLeft"> <a href="${cpath}/board/gallery"
								class="Button button-rounded button-small">목록</a>
							</span> <span class="gRight"> <input type="hidden" id="atc_id"
								name="atc_id" value="${article.atc_id}"> <a href="#"
								onclick="submitArticleForm()"
								class="Button button-rounded button-normal black">수정</a> <a
								href="#" onclick="cancelRegistration()"
								class="Button button-rounded button-normal">취소</a>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 추가된 부분: 모달 창 -->
	<div id="uploadSuccessModal" class="modal fade" tabindex="-1"
		aria-labelledby="uploadSuccessModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="uploadSuccessModalLabel">업로드 완료</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">업로드가 완료되었습니다!</div>
				<div class="modal-footer">
					<a href="${cpath}/board/gallery" class="btn btn-secondary">확인</a>
				</div>
			</div>
		</div>
	</div>

	<script>
	var articleId = "<c:out value="${article.atc_id}"/>";
	var writer_id = "<c:out value="${article.writer_id.username}"/>";
	function submitArticleForm() {
	    var formData = new FormData();
	    formData.append('atc_id', articleId);
	    formData.append('atc_title', $("#atc_title").val());
	    formData.append('atc_content', $("#atc_content").text());
	    formData.append('writer_id', writer_id);
	    $.ajax({
	        type: 'POST',
	        processData: false,
	        contentType: false,
	        url: '${cpath}/board/modify',
	        data: formData,
	        success: function (response) {
	        	alert("글 수정 완료했습니다.");
	        	location.href="/boot/board/gallery";
	        },
	        error: function (error) {
	            console.error('글 데이터 전송 오류:', error.responseText);
	            // TODO: 글 데이터 전송 오류 처리 (예: 알림창 등)
	        }
	    });
	}
    function uploadFiles(idx) {
       var formData = new FormData();
       formData.append('articleId', articleId);
		
       // 첨부 파일들을 formData에 추가
       var files = $("input[name='attach_file[]']");
       formData.append('files', files[idx-1].files[0]);
       $.ajax({
           type: 'POST',
           contentType: false,
           processData: false,
           url: '${cpath}/board/upload',
           data: formData,
           success: function (response) {
               console.log('파일 수정 성공:', response);
           },
           error: function (error) {
               console.error('파일 수정 오류:', error.responseText);
           }
       });
    }

    function remove_file(index, fileId){
    	var formData = new FormData();
	    formData.append('file_id', fileId);
    	var file_id = document.getElementById('file-'+index);
    	file_id.innerHTML = '';
    	file_id.innerHTML ='<input name="attach_file[]" type="file" style="background-color: transparent;">';
    	file_id.addEventListener('change', function(event) {
            uploadFiles(index);
        });
    	$.ajax({
	        type: 'POST',
	        processData: false,
	        contentType: false,
	        url: '${cpath}/board/remove/file',
	        data: formData,
	        success: function (response) {
	        	return true;
	        },
	        error: function (error) {
	            console.error('파일 삭제 오류');
	        }
	    });	
    }
        function cancelRegistration() {
            window.history.back();
        }
    // 문서가 로드된 후 실행될 JavaScript 코드
        document.addEventListener('DOMContentLoaded', function() {
            // content_BODY 요소를 선택
            var atc_content = document.getElementById('atc_content');

            // content_BODY를 클릭할 때 실행되는 함수
            atc_content.addEventListener('click', function() {
                // content_BODY 내용을 빈 문자열로 설정하여 텍스트를 사라지게 함
                atc_content.innerHTML = '';
            });
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