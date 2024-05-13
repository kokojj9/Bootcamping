<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 마이페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>



    </style>

</head>
<body>

    <div class="">
        <h2> 부트캠핑 - 마이페이지</h2>

        <div id="myInfoArea">
            <div>
                ${ myPageInfo.memberId }님 안녕하세요!
                <div>회원정보 수정</div>
            </div>
            <div>즐겨찾는 캠핑장</div>
        </div>

        <div id="reservationInfoArea">
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
	                    	<tr colspan="5">
	                    		<td>조회된 예약내역이 없습니다.</td>
	                    	</tr>
	                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <div id="boardArea">
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${ not empty myPageInfo.boardList }" >
                        	<c:forEach items="${ myPageInfo.boardList }" var="b">
			                    <tr>
			                        <td>${ b.boardNo }</td>
			                        <td>$</td>
			                        <td>john@example.com</td>
			                    </tr>
			                    <tr>
			                        <td>Mary</td>
			                        <td>Moe</td>
			                        <td>mary@example.com</td>
			                    </tr>
			                    <tr>
			                        <td>July</td>
			                        <td>Dooley</td>
			                        <td>july@example.com</td>
			                    </tr>
		                    </c:forEach>
                    	</c:when>
	                    <c:otherwise>
	                    
	                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>