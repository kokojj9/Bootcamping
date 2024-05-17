<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <c:if test="${ empty loginMember }">
    	<script>
    		alert('회원 전용 서비스입니다. 로그인해주세요');
    		location.href = 'errorPage';
    	</script>
    </c:if>
    
    <jsp:include page="../common/header.jsp"/>

    <div id="boardArea">
        <div class="myBoardList">내가 쓴 글</div>
        <div id="boardmoreBtn" class="btn">더보기</div> 
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>글 번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${ not empty myPageInfo.boardList }" >
                        <c:forEach items="${ myPageInfo.boardList }" var="b" varStatus="loop">
                            <c:if test="${ loop.index < 5 }">
                                <tr>
                                    <td>${ b.boardNo }</td>
                                    <td>${ b.categoryName }</td>
                                    <td>${ b.boardTitle }</td>
                                    <td>${ b.createDate }</td>
                                </tr>
                            </c:if>    
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" align="center">조회된 게시글 내역이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>