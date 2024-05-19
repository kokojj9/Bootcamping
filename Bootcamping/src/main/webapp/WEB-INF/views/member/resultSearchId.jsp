<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="">
            <div class="">
                <div class="title">
                    <div class="">아이디 찾기 결과</div>
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
                    <button type="submit" class="searchId">아이디 찾기</button>
                    <button type="button" class="enrollForm">회원가입</button>
                </div>
                

            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

	
</body>
</html>