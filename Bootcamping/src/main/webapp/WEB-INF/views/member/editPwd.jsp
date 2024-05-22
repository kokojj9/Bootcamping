<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 변경</title>
    <style>
        #wrap {
            width: 500px;
            height: 400px;
            margin: 50px auto;
        }

        .title > div {
            width: 300px;
            font-size: 36px;
            font-weight: 500;
            text-align: center;
            margin: auto;
        }

        .editPwd_form {
            text-align: center;
            width: 350px;
            height: auto;
            margin: 25px auto;
        }


    </style>


</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="title">
            <div class="">비밀번호 변경</div>
        </div>

        <form action="editPwd" method="post">
            <div class="editPwd_form">
                <label for="memberPwd" class="">비밀번호 : </label>
                <input type="text" id="memberId" placeholder="변경할 비밀번호를 입력해주세요" name="memberId" required> <br>
                <label for="checkPwd" class="">비밀번호 확인 : </label>
                <input type="text" id="memberId" placeholder="비밀번호를 확인해주세요" name="memberId" required> <br>
            </div>
                    
            <div class="btn">
                <button type="submit" id="searchPwd" disabled>비밀번호 변경</button>
            </div>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>