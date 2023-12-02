<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

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
   
   <link rel="stylesheet" type="text/css" href="${cpath}/icomoon/icomoon.css">
   <link rel="stylesheet" type="text/css" href="${cpath}/css/vendor.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="${cpath}/css/style.css">
   <link rel="stylesheet" type="text/css" href="${cpath}/css/form.css">

   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
      rel="stylesheet">
   
</head>
<body>
      <%@ include file="/WEB-INF/header.jsp"%>
      <section id="login-intro" class="login-section">
      <div class="log-in">
         <div class="login-top">
            <img src="${cpath}/images/main-banner1.png" alt="banner" class="login-img">
            <div class="login-content">
               <h2 class="login-title">회원정보수정</h2>
            </div><!--banner-content-->
         </div><!--slider-item-->
      </div>
      </section>
  	<form id="form-contact" method="post" action="${cpath}/member/modify">
     <div id="modify-container" style="margin-top: 100px;">
     	<div id="contents">
     		<div class="titleArea">
				<div class="user_title">
					<h2 style="font-family: 'SUITE-Regular' !important; font-size: 1em; text-align: left;">회원정보를 수정해주세요</h2>
				</div>
         	</div>
     		<div class="ec-base-table typeWrite">
        		<table border="1" summary="">
					<caption>회원 기본정보</caption>
        			<colgroup>
						<col style="width:150px;">
						<col style="width:auto;">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">아이디</th>
		                <td>
		                    <input id="member_id" name="username" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="${user.member.username}" type="text">
		                </td>
		            </tr>
					<tr>
					<th scope="row">비밀번호 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" class="" alt="필수">
					</th>
	                <td>
	                	<input id="passwd" name="password" fw-label="비밀번호" fw-msg="" autocomplete="off" 0="disabled" value="" type="password"> (영문 대소문자/숫자 4자~16자)
                	</td>
		            </tr>
					<tr class="">
						<th scope="row">비밀번호 확인 
							<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
						</th>
		                <td>
		                	<input id="user_passwd_confirm" name="passwordConfirmation" fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" 0="disabled" value="" type="password"> 
		                	<span id="pwConfirmMsg"></span>
						</td>
		            </tr>
					<tr style="display:1">
						<th scope="row" id="">이름 
							<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
		                <td>
		                	<input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly" value="${user.name}" type="text">
	                	</td>
		            </tr>
		            <tr>
						<th scope="row">닉네임</th>
		                <td>
		                    <input id="nickname" name="nickname" fw-label="닉네임" fw-msg="" class="inputTypeText" placeholder="${user.nickname}" type="text">
		                </td>
		            </tr>
					<tr class="">
						<th scope="row">휴대전화 
							<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" class="" alt="필수"></th>
			                <td>
			                	<select id="mobile1"fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								-
								<input id="mobile2"maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
								-
								<input id="mobile3"maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
								<input type="hidden" id="hiddenPhone" name="phone" value="">
							</td>
					</tr>
					<script>
				        // 폼을 제출하기 전에 휴대폰 번호에서 쉼표(,)를 제외하고 값 설정
				        document.getElementById('form-contact').addEventListener('submit', function () {
				            var mobile1 = document.getElementById('mobile1').value;
				            var mobile2 = document.getElementById('mobile2').value;
				            var mobile3 = document.getElementById('mobile3').value;
				
				            // 쉼표(,)를 제외한 번호를 만들기
				            var phoneNumber = mobile1 + mobile2 + mobile3;
				
				            // 쉼표(,)를 제외한 번호를 다시 필드에 설정
				            document.getElementById('hiddenPhone').value = phoneNumber;
				        });
				    </script>
					<tr class="">
						<th scope="row">이메일 
							<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
		                <td>
		                    <input id="email1" name="email" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="" type="text"> 
		                </td>
		            </tr>
					
					</tbody>
				</table>
			</div>
			<div class="ec-base-button justify" style="margin: 30px;">
		        <button type="submit" class="Button button-square button-normal black" style="margin-left:470px;">회원정보 수정</button>
		        <a href="${cpath}/member/mypage" class="Button button-square button-normal white">취소</a>
		        <span class="gRight">
		            <a href="#none" class="Button button-rounded button-small">회원탈퇴</a>
		        </span>
		    </div>
     	</div>
     </div>
    </form>
     
      <script src="${cpath}/js/jquery-1.11.0.min.js"></script>
      <script src="${cpath}/js/ui-easing.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
         crossorigin="anonymous"></script>
      <script src="${cpath}/js/plugins.js"></script>
      <script src="${cpath}/js/script.js"></script>
   		
      
</body>

</html>