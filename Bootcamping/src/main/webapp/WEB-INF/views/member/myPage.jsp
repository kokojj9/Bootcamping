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
        .wrap{
            width: 1200px;
            height: 800px;
            margin: auto;
        }

        .wrap > h2{
            text-align: center;
            margin: 50px auto;
            
        }

        #myInfoArea{
            margin: auto;
            width: 950px;
            height: 100px;
            border: 1px solid rgb(94, 94, 94);
            position: relative;
        }

        .welcomeMember{
            color: rgb(51,51,51);
            margin-top: 15px;
            width: 260px;
            height: 30px;
            font-size: 20px;
            font-weight: 500;
            text-align: center;
            line-height: 30px;
            position: absolute;
        }

        .editMember{
            margin-top: 5px;
            margin-left: 50px;
            height: 35px;
            width: 140px;
            font-size: 16px;
            color: white;
            border-radius: 20px;
            background-color: #1dc078;
            line-height: 35px;
        }

        .editMember:hover{
            cursor: pointer;
        }

        .wishList{
            margin-top: 30px;
            width: 200px;
            height: 30px;
            font-size: 23px;
            font-weight: 700;
            color: rgb(94, 94, 94);
            text-decoration: underline;
            float: right;
        }

        .wishList:hover{
            cursor: pointer;
            color: #1dc078;
        }

        #reservationInfoArea, #boardArea{
            width: 950px;
            margin: 40px auto;
        }

        .myBoardList, .reservationList, .tradeList{
            color: rgb(51,51,51);
            font-size: 25px;
            font-weight: 500;
            float: left;
        }

        .reservmoreBtn, .boardmoreBtn, .trademoreBtn{
            color: rgb(51,51,51);
            margin-top: 10px;
            float: right;
            font-size: 16px;
            font-weight: 600;
        }

        .reservmoreBtn:hover, .boardmoreBtn:hover, .trademoreBtn:hover{
            cursor: pointer;
            text-decoration: underline;
        }

        .tradeArea{
            margin: auto;
            width: 950px;
            height: 130px;
        }

        .tradeInfo{
            width: 950px;
            height: 50px;
        }

        .tradeProgress, .tradeCompleted, .tradeCancelled{
            height: 130px;
            width: 316px;
            border: 1px solid rgb(94, 94, 94);
            float: left;
        }

        .tradeProgress > h4, .tradeCompleted > h4, .tradeCancelled > h4{
            font-size: 20px;
            font-weight: 400;
            margin-top: 25px;
            text-align: center;
        }


    </style>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="wrap">
        <h2> 부트캠핑 - 마이페이지</h2>

        <div id="myInfoArea">
            <div class="welcomeMember">
                ${ sessionScope.loginMember.memberId }님, 안녕하세요!
                <div class="editMember">회원정보 수정 ></div>
            </div>
            <div class="wishList">즐겨찾는 캠핑장</div>
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
            <div class="boardmoreBtn">더보기</div> 
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
                <div class="trademoreBtn">더보기</div>
            </div>
            <div class="tradeProgress">
                <h4>거래중</h4>
                <div>${ countInProgress }건</div>
            </div>
            <div class="tradeCompleted">
                <h4>거래 완료</h4>
				<div>${ countCompleted }건</div>
            </div>
            <div class="tradeCancelled">
                <h4>거래 취소</h4>
				<div>${ countCancelled }건</div>
            </div>
        </div>











    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>