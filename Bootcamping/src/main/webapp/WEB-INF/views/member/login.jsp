<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        #login-wrap {
            width: 500px;
            height: 500px;
            margin: 50px auto;
        }

        .login_title > div {
            width: 300px;
            font-size: 36px;
            font-weight: 500;
            text-align: center;
            margin: auto;
        }

        .login_form {
            width: 300px;
            height: 150px;
            margin: 25px auto;
        }

        .login_btn {
            width: 300px;
            margin: auto;
        }

        .login_btn > button{
            width: 120px;
            border: 0;
            border-radius: 5px;
            height: 40px;
            font-size: 18px;
            font-weight: 500;
        }

        .login { 
            margin-left: 20px;
            margin-right: 20px;
            background-color: #1dc078;
            color: #f6f6f6;
        }

    </style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>

    <div id="login-wrap">
        <div class="">
            <div class="">
                <div class="login_title">
                    <div class="">부트캠프 로그인</div>
                </div>
        
                <form action="login.member" method="post">
                    <div class="login_form">
                        <label for="userId" class="">아이디 : </label>
                        <input type="text" class="" placeholder="아이디" id="memberId" name="memberId"> <br>
                        <label for="userPwd" class="">비밀번호 : </label>
                        <input type="password" class="" placeholder="비밀번호" id="memberPwd" name="memberPwd"> <br>
                        <input type="checkbox" name="rememberId" value="true"> 아이디 저장
                    </div>
                           
                    <div class="login_btn">
                        <button type="submit" class="login">로그인</button>
                        <button type="button" class="enroll">회원가입</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>