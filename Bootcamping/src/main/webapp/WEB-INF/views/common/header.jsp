<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


	<!--달력-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet"/>

	<!-- alert -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

	<style>
*{
  font-family: "Nanum Gothic", sans-serif;
  font-weight: 400;
  font-style: normal;
}

}
div {
          box-sizing: border-box;
      } 

      #header_wrap {
          width: 1200px;
          height: 100px;
          margin: auto;
          border-bottom: 1px solid #f1f3f5;
      }

      #header_status{
          width: 1200px;
          height: 40px;
          border-bottom: 1px solid #f1f3f5;
      }

      #header_content {
          display: flex;
          height: 60px;
      }

      #header_left > a {
          height: 50px;
          width: 180px;
      }

      #header_left {
          width: 300px;
          height: 100%;
          text-align: center;
          line-height: 50px;
      }

      #header_left img{ 
          margin: 0 auto;
          width: 100%;
          height: 100%;
      }

      #header_center {
          width: 500px;
          height: 100%;
          display: flex;
      }

      #header_menu{
          height: 100%;
          line-height: 60px;
      }

      #header_search {
          width: 400px;
          line-height: 60px;
      }

      #header_search > input {
          width: 350px;
          height: 35px;
          border-top-left-radius: 8px;
          border-bottom-left-radius: 8px;
          border: 1px solid transparent;
          background-color: #f6f6f6;
      }

      #header_search > span {
          border-top-right-radius: 8px;
          border-bottom-right-radius: 8px;
          border: 1px solid transparent;
          background-color: #f6f6f6;
      }

      #header_menu > ul {
          list-style: none;
          display: flex;
          height: 100%;
          margin: 0;
          padding-left: 20px;
      }

      #header_menu > ul > li {
          margin-right: 30px;
      }

      #header_menu > ul > li > a {
          text-decoration: none;
          color: #4a4a4a;
          font-weight: 400;
          font-size: 16px;
      }

      #header_menu > ul > li > a:hover{
          cursor: pointer;
          color: #1dc078; 
      }

      #header_right {
          width: 400px;
          height: 100%;
      }

      #header_memberArea{
          margin: auto;
          height: 100%;
      }

      #header_right a{
          line-height: 60px;
          text-decoration: none;
          color: #4a4a4a;
      }


</style>


</head>
<body>


	<c:if test="${not empty alertMsg }">
		<script>
			alertify.alert('성공','${alertMsg}', function(){alertify.success('Ok')});
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>


	
	 <div id="header_wrap">
        <div id="header_status">
           
        </div>
        <div id="header_content">
            <div id="header_left">
                <a href="/bootcamping"><img src="resources/img/logo/logo2.png" alt=""></a>
            </div>
            <div id="header_center">
                <div id="header_menu">
                    <ul>
                        <li><a href="/bootcamping/camping">캠핑장</a></li>
                        <li><a href="">중고거래</a></li>
                        <li><a href="">커뮤니티</a></li>
                        <li><a href="/bootcamping/list.board">게시판</a></li>
                        
                        <br> <br> <br> <br> <br> <br>
                    </ul>
                </div>
            </div>
            <div id="header_right">
                <div id="header_memberArea">
                    <c:choose>
                        <c:when test="${ empty sessionScope.loginMember }">

                            <a href="/bootcamping/enrollForm">회원가입</a>
                            <a href="/bootcamping/loginForm">로그인</a>
            
                        </c:when>
                        <c:otherwise>
                            
                            <lable>${ sessionScope.loginMember.memberId }님 환영합니다</label> &nbsp;&nbsp;
                            <a href="/bootcamping/myPage">마이페이지</a>
                            <a href="/bootcamping/logout">로그아웃</a>
                        <!-- 관리자 기능 넣어야함! -->
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

	

</body>
</html>