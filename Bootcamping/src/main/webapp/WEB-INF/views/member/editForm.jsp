<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 정보수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

    <c:if test="${ empty loginMember }">
    	<script>
    		alert('회원 전용 서비스입니다. 로그인해주세요');
    		location.href = 'errorPage';
    	</script>
    </c:if>

    <jsp:include page="../common/header.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>부트캠핑 - 회원정보 수정</h2>
            <br>

            <div class="form-group">
                <label for="memberId">* 아이디 </label>											
                <input type="text" class="form-control" id="memberId" placeholder="아이디(영문, 숫자, 최대 12자)" name="memberId" maxlength="12" readonly>
                <div id="checkIdResult" style="font-size:12px; display:none;"></div><br>

                <label for="memberPwd">비밀번호 </label>
                <input type="password" class="form-control" id="memberPwd" placeholder="비밀번호(영문, 숫자, 특수문자 포함)" name="memberPwd" maxlength="16" required>
                <div id="checkPwdResult" style="font-size:12px; display:none;"></div><br>

                <label for="email">* 이메일 </label>
                <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required> <br>

                <label for="address"> &nbsp; 주소 </label> &nbsp;&nbsp;<br>
                <input type="text" name="postcode" id="postcode" placeholder="우편번호">
                <input type="button" id="findAddressBtn" onclick="execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소">
            </div> 
            <br>
            <div class="btns" align="center">
                <button id="editBtn" type="button" class="btn btn-primary" disabled>정보 수정</button>
            </div>
        </div>
    </div>

    
    <jsp:include page="../common/footer.jsp"/>

    <script>
        var loginMemberId = ${ loginMember.memberId };


        let checkPwdResult = document.getElementById('checkPwdResult');
        let memberPwdtag = document.getElementById('memberPwd');

        document.getElementById('editBtn').onclick = () => {
            
            $.ajax({
                url : 'members',
                type : 'post',
                data : {
                    memberId : loginMemberId,
                    memberPwd : document.getElementById('memberPwd').value,
                    email : document.getElementById('email').value,
                    postcode : document.getElementById('postcode').value,
                    roadAddress : document.getElementById('roadAddress').value,
                    detailAddress : document.getElementById('detailAddress').value
                },
                success : result => {

                }
            });
        };

        memberPwdtag.onkeyup = () => {
            let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]+$/;

            if(regExp.test(memberPwdtag.value)) checkInfo('password', 'green', '사용가능한 비밀번호입니다.')
            else checkInfo('password', 'crimson', '영문 / 숫자 / 특수문자를 포함해야합니다.')
        };

        const checkInfo = (type, color, text) => {
            let checkItem =  type == 'id' ? checkIdResult : type == 'password' ? checkPwdResult : overlapPwdTag;
            
            checkItem.style.display = 'block';
            checkItem.style.color = color;
            checkItem.textContent = text;
        };

        function execDaumPostcode() {
            new daum.Postcode({
            theme: themeObj,
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
}

    </script>



</body>
</html>