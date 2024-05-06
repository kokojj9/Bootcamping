<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   

	<style>
		div {
            box-sizing: border-box;
            border: 1px solid red;
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

        #header_left {
            width: 300px;
            height: 100%;
            text-align: center;
            line-height: 50px;
        }

        #header_left > img{ 
            margin: 0 auto;
            height: 40px;
        }

        #header_center {
            width: 700px;
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
            width: 200px;
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
	
	 <div id="header_wrap">
        <div id="header_status">
            날씨 api로 표시할거임~
        </div>
        <div id="header_content">
            <div id="header_left">
                <img src="https://kh-academy.co.kr/resources/images/main/logo.svg" alt="">
            </div>
            <div id="header_center">
                <div id="header_menu">
                    <ul>
                        <li><a href="">캠핑장</a></li>
                        <li><a href="">중고거래</a></li>
                        <li><a href="">커뮤니티</a></li>
                    </ul>
                </div>
                <div id="header_search">
                    <input type="text" name="keyword">
                    <span>
                        검색<img src="">                        
                    </span>
                </div>
            </div>
            <div id="header_right">
                <div id="header_memberArea">
                    <c:choose>
                        <c:when test="${ empty sessionScope.loginUser }">

                            <a href="enrollForm">회원가입</a>
                            <a href="loginForm">로그인</a>
            
                        </c:when>
                        <c:otherwise>
                            
                                <lable>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
                                <a href="">마이페이지</a>
                                <a href="">로그아웃</a>
                            
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

	

</body>
</html>