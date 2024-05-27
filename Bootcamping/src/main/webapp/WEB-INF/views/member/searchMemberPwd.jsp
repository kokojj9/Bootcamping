<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 비밀번호 찾기</title>
    <link rel="stylesheet" href="resources/CSS/member/searchMemberPwd.css"/>

</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="title">
            <div class="">비밀번호 찾기</div>
        </div>

        <form action="search-password" method="post">
            <div class="searchPwd_form">
                <label for="memberId" class="">아이디 : </label>
                <input type="text" id="memberId" placeholder="아이디를 입력해주세요" name="memberId" required> <br>
                <label for="email" class="">이메일 : </label>
                <input type="text" id="email" placeholder="이메일 인증이 필요합니다" name="email" required> <br>
                <button id="checkEmailBtn" type="button">메일 인증</button> 
                <input type="number" class="form-control" id="authCode" placeholder="인증코드를 입력해주세요" style="display:none;"> <br>
                <button id="checkAuthCode" type="button" style="width: 150px; display:none;">인증번호 확인</button>
                <h6 id="timer"></h6>
            </div>
                    
            <div class="btn">
                <button type="submit" id="searchPwd" disabled>비밀번호 찾기</button>
            </div>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"/>

    <script src="resources/js/member/searchMemberPwd.js" ></script>
    

</body>
</html>