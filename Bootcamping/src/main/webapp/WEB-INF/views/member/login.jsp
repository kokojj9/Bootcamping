<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 로그인</title>
    <link rel="stylesheet" href="resources/CSS/member/login.css">
  

</head>
<body>
    
	<jsp:include page="../common/header.jsp"/>

    <div id="login-wrap">
        <div class="">
            <div class="">
                <div class="login_title">
                    <div class="">부트캠프 로그인</div>
                </div>
        
                <form action="members/login" method="post">
                    <div class="login_form">
                        <label for="memberId" class="">아이디 : </label>
                        <input type="text" class="" placeholder="아이디" id="memberId" name="memberId"> <br>
                        <label for="memberPwd" class="">비밀번호 : </label>
                        <input type="password" class="" placeholder="비밀번호" id="memberPwd" name="memberPwd"> <br>
                        <input type="checkbox" name="rememberId" value="true"> 아이디 저장
                    </div>
                           
                    <div class="login_btn">
                        <button type="submit" class="login">로그인</button>
                        <button type="button" class="enrollForm">회원가입</button>
                    </div>
                </form>

                <div id="socialLoginArea">
                    <div id="kakaoBtn">
                        <a href="kakaoLoginForm"><img src="resources/images/kakaoBtn.png" alt="카카오로그인 버튼"></a>
                    </div>
                </div>


            </div>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>