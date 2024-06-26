<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 내가 쓴 글</title>

    <style>
        #wrap{
            margin: 5% auto 5%;
            width: 1000px;
        }
        #title{
            margin: 5px auto 50px;
            width: fit-content;
            font-size: 32px;
            font-weight: 400;
        }
        #pagingArea {
            width:fit-content; 
            margin:auto;
        }
        .table .thead-light th, td{
            text-align: center;
            vertical-align: middle;
        }
    </style>

</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div id="title">내가 쓴 글</div>
        
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>글 번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${ not empty boardList }" >
                        <c:forEach items="${ boardList }" var="b">
                          
                            <tr>
                                <td>${ b.boardNo }</td>
                                <td>${ b.categoryName }</td>
                                <td>${ b.boardTitle }</td>
                                <td>${ b.createDate }</td>
                                <td>${ b.count }</td>
                            </tr>
                               
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

        <div id="pagingArea">
            <ul class="pagination">
                
                <c:choose>
                    <c:when test="${ pageInfo.currentPage eq 1 }">
                        <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="myBoards?memberId=${ loginMember.memberId }&page=${ pageInfo.currentPage - 1 }">이전</a></li>
                    </c:otherwise>
                </c:choose>
                    
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                            <li class="page-item"><a class="page-link" href="myBoards?memberId=${ loginMember.memberId }&page=${ p }">${ p }</a></li>
                </c:forEach>
                            
                <c:choose>
                    <c:when test="${ pageInfo.currentPage eq pageInfo.endPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="myBoards?memberId=${ loginMember.memberId }&page=${ pageInfo.currentPage + 1 }">다음</a></li>
                    </c:otherwise>
                </c:choose>                    
                
            </ul>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>