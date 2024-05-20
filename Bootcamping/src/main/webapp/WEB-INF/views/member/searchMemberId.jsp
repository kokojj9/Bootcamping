<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 아이디 찾기</title>
<link rel="stylesheet" href="resources/CSS/member/searchMemberId.css">


</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="">
            <div class="">
                <div class="title">
                    <div class="">아이디 찾기</div>
                </div>
        
                <form action="members/searchId" method="post">
                    <div class="searchId_form">
                        <label for="email" class="">이메일 : </label>
                        <input type="text" class="" placeholder="이메일을 입력해주세요" id="email" name="email"> <br>
                    </div>
                           
                    <div class="btn">
                        <button type="submit" class="/bootcamping/searchId">아이디 찾기</button>
                        <button type="button" class="enrollForm">회원가입</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>


</body>
</html>