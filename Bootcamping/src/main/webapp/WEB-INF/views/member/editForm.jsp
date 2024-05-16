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

    <style>
        .content { 
            background-color: rgb(247, 245, 245);
            width: 1200px; 
            margin: auto;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 40%;
            margin: auto;
            padding: 3% 7%;
            background-color: white;
        }
        #postcode, #roadAddress{
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            height: calc(1.5em + .75rem + 2px);
            padding: .375rem .75rem;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
        }
        #postcode{
            width: 100px;
            margin-bottom: 5px;
        }
        #roadAddress{
            width: 310px;
        }
        #findAddressBtn, #checkEmailBtn, #checkAuthCode{
            width: 90px;
            height: 35px;
            background-color: #1dc078;
            color: #f6f6f6;
            border: 0;
            font-size: 16px;
            font-weight: 400;
            border-radius: .25rem;
        }
        #detailAddress{
            margin-top: 5px;
        }
        #checkAuthCode{
            margin-top: 5px;
        }


    </style>

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
                <input type="text" class="form-control" id="memberId" value="${ loginMember.memberId }" name="memberId" maxlength="12" readonly>
                <div id="checkIdResult" style="font-size:12px; display:none;"></div><br>

                <label for="memberPwd">* 비밀번호 </label>
                <button type="button" id="editPwd" class="btn btn-primary" data-toggle="modal" data-target="#myModal">비밀번호 확인</button><br>
                <input type="password" class="form-control" id="memberPwd" placeholder="비밀번호(영문, 숫자, 특수문자 포함)" name="memberPwd" maxlength="16" required style="display: none;">

                <label for="email">* 이메일 </label>
                <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" value="${ loginMember.email }" name="email" required> <br>

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

    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                
                <div class="modal-header">
                <h4 class="modal-title">비밀번호 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <div class="modal-body">
                    비밀번호 <input type="password" class="form-control" id="checkPwd" placeholder="현재 비밀번호를 입력해주세요" name="MemberPwd" maxlength="16" required>
                </div>
        
                <div class="modal-footer">
                    <button id="checkPwdBtn" type="button" class="btn btn-primary" >비밀번호 확인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
        
            </div>
        </div>
      </div>

    
    <jsp:include page="../common/footer.jsp"/>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        var loginMemberId = '${ loginMember.memberId }';

        let checkPwdResult = document.getElementById('checkPwdResult');
        let memberPwdtag = document.getElementById('memberPwd');

        document.getElementById('checkPwdBtn').onclick = () => {
            $.ajax({
                url : 'members/editPassword',
                type : 'POST',
                data : {
                    memberId : loginMemberId,
                    memberPwd : document.getElementById('checkPwd').value
                },
                success : result => {
                    if(result === 'YYYYY') {
                        memberPwdtag.style.display = 'block';
                    }
                    else {
                        alert('비밀번호를 확인해주세요!');
                        memberPwdtag.style.display = 'none';
                    };
                }
            });
        };

        document.getElementById('editBtn').onclick = () => {
            $.ajax({
                url : 'members/edit',
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
                    if(result === 'YYYYY') location.href = 'editForm';
                    else alert('정보 수정 실패'); location.href = 'editForm';
                }
            });
        };















        var themeObj = {
            searchBgColor: "#1DC078",
            queryTextColor: "#FFFFFF"
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