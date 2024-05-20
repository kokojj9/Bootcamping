<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

    <link rel="stylesheet" href="resources/CSS/member/resultSearchId.css">

</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="title">
            <div>아이디 찾기 결과</div>
        </div>

        <div class="result">
            <div class="resultMsg">
                <c:choose>
                    <c:when test="${ not empty memberId  }">
                        <div>${ memberId } 입니다.</div>
                    </c:when>
                    <c:otherwise>
                        <div>검색하신 아이디가 없습니다.</div>
                    </c:otherwise>
                </c:choose>
            </div>    	
                    
        </div>                           	
        <div class="btn">
            <button type="button" class="login"><a href="/bootcamping/loginForm">로그인</a></button>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

	
</body>
</html>