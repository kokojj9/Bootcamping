<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .content { 
            background-color: rgb(247, 245, 245);
            width: 1200px; 
            margin: auto;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }
    </style>

</head>
<body>

	 <!-- 메뉴바 -->
     <jsp:include page="../common/header.jsp" />

     <div class="content">
         <br><br>
         <div class="innerOuter">
             <h2>회원가입</h2>
             <br>
 
             <form action="insert.member" method="post">
                 <div class="form-group">
                     <label for="userId">* 아이디 : </label>											<!-- userId == setUserId(value값) -->
                     <input type="text" class="form-control" id="userId" placeholder="Please Enter ID" name="userId" required> <br>
                     <div id="checkResult" style="font-size:0.7em; display:none;"></div>
 
                     <label for="userPwd">* 비밀번호 : </label>
                     <input type="password" class="form-control" id="userPwd" placeholder="Please Enter Password" name="userPwd" required> <br>
 
                     <label for="checkPwd">* 비밀번호 확인 : </label>
                     <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required> <br>
 
                     <label for="userName">* 이름 : </label>
                     <input type="text" class="form-control" id="userName" placeholder="Please Enter Name" name="userName" required> <br>
 
                     <label for="email"> &nbsp; 이메일 : </label>
                     <input type="text" class="form-control" id="email" placeholder="Please Enter Email" name="email"> <br>
 
                     <label for="phone"> &nbsp; 전화번호 : </label>
                     <input type="tel" class="form-control" id="phone" placeholder="Please Enter Phone (-없이)" name="phone"> <br>
                     
                     <label for="address"> &nbsp; 주소 : </label>
                     <input type="text" class="form-control" id="address" placeholder="Please Enter Address" name="address"> <br>
                     
                     <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
                     <input type="radio" id="Male" value="M" name="gender" checked>
                     <label for="Male">남자</label> &nbsp;&nbsp;
                     <input type="radio" id="Female" value="F" name="gender">
                     <label for="Female">여자</label> &nbsp;&nbsp;
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

</body>
</html>