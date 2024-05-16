<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

#q1{
	position : left;
	
}

#c1{
	position : right;
	
	
}





</style>


<title>공지사항</title>
</head>
<body>

		<jsp:include page="../common/header.jsp"/>
		<!-- 관리자가 로그인한 경우에만 공지사항 글쓰기 가능-->
		
		<div>
			<div class="q1">
				<h2>자주 묻는 질문</h2>		
				<li>예약한 정보가 안나와요</li>
				<li>로그인이 안되는데요?</li>
				<li>아이디를 못찾겠어요</li>
			</div>	
				
			<div class="c1">		
				<h2>고객센터  09:00 ~ 18:00</h2>
				<div>평일 : 전체문의 상담</div>
				<div>주말, 공휴일 : 휴무</div>
				<address>
					<a href="tel:+12345678">+1(222)234-5678</a>
				</address>
				<button>회원 / 게시글 신고</button>
			</div>
			
				<hr>
				<div>
					
				
					
				</div>
			
			<div>
				<nav>
					<button>전체</button>	
					<button>로그인 /회원정보</button>
					<button>캠핑장서비스</button>
					<button>중고거래 서비스</button>
					<button>커뮤니티서비스</button>
					<button>게시판서비스</button>
					
						
				</nav>
			</div>
			
				<ul></ul>
		
			
		
			<br><br><br><br><br>
			<jsp:include page="../common/footer.jsp"/>
			
		</div>
		
		
		
</html>