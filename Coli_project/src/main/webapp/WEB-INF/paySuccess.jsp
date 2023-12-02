<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.net.URLEncoder" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />

<%@ page import="java.util.List"%>
<%@ page import="kr.spring.service.FileUtilsService"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="./public/style.css" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>토스페이먼츠 샘플 프로젝트</title>
    
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
  /* 모달 창 스타일 */
.modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%;
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.6); 
    
  }

.modal-content {
  text-align: center;
  background-color: #fefefe;
  margin: auto; 
  padding: 20px;
  border: 1px solid #888;
  width: 25%; /* 가로 크기 조정 */
  transform: translateY(-50%); /* 수직 중앙 정렬 */
  position: relative;
  top: 50%;
  box-shadow: 0px 5px 30px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
  margin-bottom: 20px;
}

.modal-buttons {
  margin-top: 20px;
  padding: 5px 15px;
  margin-bottom: 20px;
  border-radius: 4px;
  border: 0px;
  font-weight: 600;
  margin-left: 15px;
  margin-right: 15px;
  padding: 8px 17px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  font-size: 16px;
}

.modal-buttons:hover {
   background: #3d3d3d;
   cursor: pointer;
   color: #fff;
}

h2 {
   margin-top: 10px;
}

.d_line {
   width: 350px !important;
   border-bottom: 2px solid lightgray;
   width: inherit;
   margin: auto;
   margin-bottom: 30px;
   margin-top: 30px;
}

</style>

  </head>
    <body>
       <div id="myModal" class="modal">
        <div class="modal-content">
          <h2>
          <img width="35px" src="https://static.toss.im/3d-emojis/u1F389_apng.png"/>
          결제 성공</h2>
          <div class="d_line"></div>
          <p><strong>요금제</strong> : ${user.member.role}</p>
          <p><strong>주문번호</strong> : <%= request.getParameter("orderId") %></p>
          <p><strong>결제금액</strong> : <%= request.getParameter("amount") %></p>
          
           <!-- 버튼 추가 -->
          <button class="modal-buttons" onclick="location.href='${cpath}/draw';" title="draw 이용하러 가기">DRAW</button>
          <button class="modal-buttons" onclick="location.href='/boot';" title="home으로 가기">HOME</button>
        </div>
      </div>
    <script>
     // 모달 창 제어를 위한 JavaScript
     window.onload = function() {
       var modal = document.getElementById('myModal');
       var closeButton = document.getElementsByClassName('close-button')[0];
   
       // 모달 창 열기
       modal.style.display = 'block';
   
       // 'X' 버튼으로 모달 창 닫기
       closeButton.onclick = function() {
         modal.style.display = 'none';
       }
   
       // 모달 창 바깥 클릭 시 닫기
       window.onclick = function(event) {
         if (event.target == modal) {
           modal.style.display = 'none';
         }
       }
     }
   </script>
   
    </body>
    </html>