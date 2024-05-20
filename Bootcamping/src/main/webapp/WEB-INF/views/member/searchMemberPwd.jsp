<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 비밀번호 찾기</title>

<link rel="stylesheet" href="resources/CSS/member/searchMemberPwd.css">


</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="">
            <div class="">
                <div class="title">
                    <div class="">비밀번호 찾기</div>
                </div>
        
                <form action="searchPwd" method="post">
                    <div class="searchId_form">
                        <label for="memberId" class="">아이디 : </label>
                        <input type="text" class="" placeholder="아이디를 입력해주세요" id="memberId" name="memberId" required> <br>
                        <label for="email" class="">이메일 : </label>
                        <input type="text" class="" placeholder="이메일을 입력해주세요" id="email" name="email" required> <br>
                    </div>
                           
                    <div class="btn">
                        <button type="submit" class="searchId">비밀번호 찾기</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>