<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 예약내역</title>

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

    <div id="wrap">
        <div id="title">예약 내역</div>

        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>예약 번호</th>
                    <th>캠핑장 이름</th>
                    <th>인원</th>
                    <th>기간</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${ not empty myPageInfo.reservationList }" >
                        <c:forEach items="${ myPageInfo.reservationList }" var="r">
                            
                                <tr>
                                    <td>${ r.reservationNo }</td>
                                    <td>${ r.campName }</td>
                                    <td>${ r.people }</td>
                                    <td>${ r.checkInDate } ~ ${ r.checkoutDate }</td>
                                    <td>
                                        <c:if test="${ r.reserStatus eq 'Y' }">
                                            예약 완료
                                        </c:if>
                                        <c:if test="${ r.reserStatus eq 'N' }">
                                            취소
                                        </c:if>
                                    </td>
                                </tr>
                        
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" align="center">조회된 예약내역이 없습니다.</td>
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
                        <li class="page-item"><a class="page-link" href="reservations?memberId=${ loginMember.memberId }&page=${ pageInfo.currentPage - 1 }">이전</a></li>
                    </c:otherwise>
                </c:choose>
                    
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                            <li class="page-item"><a class="page-link" href="reservations?memberId=${ loginMember.memberId }&page=${ p }">${ p }</a></li>
                </c:forEach>
                            
                <c:choose>
                    <c:when test="${ pageInfo.currentPage eq pageInfo.endPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="reservations?memberId=${ loginMember.memberId }&page=${ pageInfo.currentPage + 1 }">다음</a></li>
                    </c:otherwise>
                </c:choose>                    
                
            </ul>
        </div>



    </div>

    <jsp:include page="../common/footer.jsp"/>

    <script>





    </script>

</body>
</html>