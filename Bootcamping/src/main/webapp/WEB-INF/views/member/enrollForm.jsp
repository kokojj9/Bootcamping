<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 회원가입</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="resources/CSS/member/enrollForm.css">

</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>부트캠핑 - 회원가입</h2>
            <br>

            <form id="insertForm" action="members" method="post">
                <div class="form-group">
                    <label for="memberId">* 아이디 </label>											
                    <input type="text" class="form-control" id="memberId" placeholder="아이디(영문, 숫자, 최대 12자)" name="memberId" maxlength="12" required>
                    <div id="checkIdResult" style="font-size:12px; display:none;"></div><br>

                    <label for="memberPwd">* 비밀번호 </label>
                    <input type="password" class="form-control" id="memberPwd" placeholder="비밀번호(영문, 숫자, 특수문자 포함)" name="memberPwd" maxlength="16" required>
                    <div id="checkPwdResult" style="font-size:12px; display:none;"></div><br>

                    <label for="checkPwd">* 비밀번호 확인 </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호 확인" required>
                    <div id="overlapPwd" style="font-size:0.7em; display:none;"></div><br>

                    <label for="email">* 이메일 </label>
                    <button id="checkEmailBtn" type="button">메일 인증</button>
                    <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required> <br>
                    <input type="number" class="form-control" id="authCode" placeholder="인증코드를 입력해주세요" style="display: inline;  width: 250px; display:none;"> 
                    <button id="checkAuthCode" type="button" style="width: 150px; display:none;">인증번호 확인</button>
                    <h6 id="timer"></h6>

                    <label for="address"> &nbsp; 주소 </label> &nbsp;&nbsp;<br>
                    <input type="text" name="postCode" id="postcode" placeholder="우편번호">
                    <input type="button" id="findAddressBtn" onclick="execDaumPostcode()" value="주소 찾기"><br>
                    <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소">
                </div> 
                <br>
                <div class="btns" align="center">
                    <button id="joinBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <jsp:include page="../common/footer.jsp"/>
    
    <script src="resources/js/member/enrollForm.js" ></script>

</body>
</html>