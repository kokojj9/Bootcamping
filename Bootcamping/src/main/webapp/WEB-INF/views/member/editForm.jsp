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

    <link rel="stylesheet" href="resources/CSS/member/editForm.css">

</head>
<body>

    <jsp:include page="../common/header.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원정보 수정</h2>
            <br>

            <div class="form-group">
                <label for="memberId">* 아이디 </label>											
                <input type="text" class="form-control" id="memberId" value="${ loginMember.memberId }" name="memberId" maxlength="12" readonly>
                <div id="checkIdResult" style="font-size:12px; display:none;"></div><br>

                <label for="memberPwd">* 비밀번호 </label>
                <button type="button" id="editPwd" class="btn btn-primary" data-toggle="modal" data-target="#myModal">비밀번호 확인</button><br>
                <input type="password" class="form-control" id="memberPwd" placeholder="변경 비밀번호(영문, 숫자, 특수문자 포함)" name="memberPwd" maxlength="16" required style="display: none;">
                <div id="checkPwdResult" style="font-size:12px; display:none;"></div><br>
                <input type="hidden" id="pwdType" value="N">

                <label for="email">* 이메일 </label>
                <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" value="${ loginMember.email }" name="email" readonly> <br>

                <label for="address"> &nbsp; 주소 </label> &nbsp;&nbsp;<br>
                <input type="text" name="postCode" id="postcode" placeholder="우편번호" value="${ loginMember.postCode }">
                <input type="button" id="findAddressBtn" onclick="execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" value="${ loginMember.roadAddress }">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소" value="${ loginMember.detailAddress }">
            </div> 
            <br>
            <div class="btns" align="center">
                <button id="editBtn" type="button" class="btn btn-primary">정보 수정</button>
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
                    <button id="checkPwdBtn" type="button" class="btn btn-primary" data-dismiss="modal">비밀번호 확인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
        
            </div>
        </div>
      </div>

    
    <jsp:include page="../common/footer.jsp"/>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
        var loginMemberId = '${ loginMember.memberId }';
    </script>
    
    <script src="resources/js/member/editForm.js" ></script>



</body>
</html>