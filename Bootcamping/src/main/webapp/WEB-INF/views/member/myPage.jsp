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
    <link rel="stylesheet" href="resources/CSS/member/myPage.css">

</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div class="wrap">
        <h2> 부트캠핑 - 마이페이지</h2>

        <div id="myInfoArea">
            <div class="welcomeMember">
                ${ sessionScope.loginMember.memberId }님, 안녕하세요!
                <div class="editMember btn">회원정보 수정 ></div>
            </div>
            <div class="wishList btn">즐겨찾는 캠핑장</div>
        </div>

        <div id="reservationInfoArea">
            <div class="reservationList">예약 내역</div>
            <div class="reservmoreBtn">더보기</div> 
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
                        	<c:forEach items="${ myPageInfo.reservationList }" var="r" varStatus="loop">
	                        	<c:if test="${ loop.index < 5 }">
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
			                    </c:if>
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
        </div>

        <div id="boardArea">
            <div class="myBoardList">내가 쓴 글</div>
            <div class="boardmoreBtn btn">더보기</div> 
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

		<c:set var="tradeStatusList" value="${myPageInfo.tradeBoardList}" />

		<c:set var="countInProgress" value="0" />
		<c:set var="countCompleted" value="0" />
		<c:set var="countCancelled" value="0" />
		
		<c:forEach var="status" items="${tradeStatusList}">
		    <c:choose>
		        <c:when test="${status eq 1}">
		            <c:set var="countInProgress" value="${countInProgress + 1}" />
		        </c:when>
		        <c:when test="${status eq 2}">
		            <c:set var="countCompleted" value="${countCompleted + 1}" />
		        </c:when>
		        <c:when test="${status eq 3}">
		            <c:set var="countCancelled" value="${countCancelled + 1}" />
		        </c:when>
		    </c:choose>
		</c:forEach>

        <div class="tradeArea">
            <div class="tradeInfo">
                <div class="tradeList">거래 현황</div>
                <div class="trademoreBtn btn">더보기</div>
            </div>
            <div class="tradeProgress tradeCount">
                <h4>거래중</h4>
                <div>${ countInProgress }건</div>
            </div>
            <div class="tradeCompleted tradeCount">
                <h4>거래 완료</h4>
				<div>${ countCompleted }건</div>
            </div>
            <div class="tradeCancelled tradeCount">
                <h4>거래 취소</h4>
				<div>${ countCancelled }건</div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
        let memberPwdtag = document.getElementById('memberPwd');
        let checkPwdResult = document.getElementById('checkPwdResult');

        let urlList = [
            'editForm',
            'wishList',
            'reservations',
            'boardList'
        ];

        let btn = document.querySelectorAll('.btn');

        btn.forEach((e, i) => {
            e.onclick = () => {
                location.href = urlList[i];
            };
        });
       

    </script>

</body>
</html>