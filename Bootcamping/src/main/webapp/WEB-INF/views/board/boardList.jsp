<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
<title>게시판</title>

<body>

		<jsp:include page="../common/header.jsp"/>
		<div class="content">
		
			<div class="innerOuter" style="padding:5% 10%;">
			
				            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            
            <c:if test="${not empty sessionScope.loginUser }">
            <a class="btn btn-secondary" style="float:right;" href="enrollForm.board">글쓰기</a>
			</c:if>
				<table id="boardList" class="table table-hover" align="center">				<thead>
					<thead>	
				    <tr>
				        <th>카테고리</th>	
				        <th>작성자</th>	
				        <th>제목</th>	
				        <th>본문내용</th>	
				        <th>작성일</th>	
				        <th>조회수</th>	
				    </tr>
				</thead>
				
				<tbody>
				    <tr>
				        <td>${ board.boardNo }</td> 
				        <td>${ board.boardWriter }</td>
				        <td>${ board.boardTitle }</td>
				        <td>${ board.boardContent }</td> 
				        <td>${ board.boardCreatedate }</td>
				        <td>${ board.boardCount }</td> 
				    </tr>
				</tbody>

				
				
				
				
				
				
				
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>

</body>
</html>