<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<body>

		<jsp:include page="../common/header.jsp"/>
		<table>
			<thead>
				<tr>
					<th>카테고리</th>	
					<th>작성자</th>	
					<th>제목</th>	
					<th>본문내용</th>	
					<th>작성일</th>	
				</tr>
			
				<tr>
					<td>${ board.baordNo}</td>
					<td>${ board.boardWriter }</td>
					<td>${ board.boardTitle }</td>
					<td>${ board.boarContent }</td>
					<td>${ board.boardCreatedate }</td>
				</tr>
			</thead>
		
		</table>


		<jsp:include page="../common/footer.jsp"/>

</body>
</html>