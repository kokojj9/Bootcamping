<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>

<style>
    #error{
        font-size: 250px;
        color: #1dc078;
        text-align: center;
    }

    #errorMessage{
        font-size: 20px;
        font-weight: 400;
        text-align: center;
    }

    #errorMsg{
        font-size: 15px;
        font-weight: 300;
        text-align: center;
        color: gray;
    }

</style>
<body>

	<jsp:include page="header.jsp" />
	    
	    <h1 id="error">404</h1>
	
	    <h4 id="errorMessage">죄송합니다. 현재 찾을 수 없는 페이지를 요청하셨습니다.</h4>
		
		<br>
		
	    <h5 id="errorMsg">${errorMsg }</h5>
	    
	    <br><br>
	    
	<jsp:include page="footer.jsp" />
	
</body>
</html>