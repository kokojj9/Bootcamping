<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

	#wrap{
		margin-left:400px;
		margin-top: 50px;
	
	}
	
	
	#c2{
		weight : 100px;
		
	
	}
	
	#c3{
		weight : 300px;
		height	: 400px; 
	
	}
	
	#c4{
	
		margin-left: 250px;
		margin-bottom: 50px;
	}

	#c5{
	
		margin-left: 10px;
		margin-bottom: 50px;
	}



</style>


<title>게시판 상세보기</title>
</head>
<body>


		<jsp:include page="../common/header.jsp"/>
		
		
		
		<div id=wrap>
			<form method="Post" action="insert.board">
				
				카테고리<p id="c1">
							<select name="category">
								<option>자유</option>
								<option>후기</option>
								<option>꿀팁</option>
								<option>자랑</option>
							</select>			
						</p>
						
				글제목 <p >
						 <input type="text" id="c2"/>
					 </p>		
						
				글내용 <p> 
						 <input type="text" id="c3"/>
					  </p>		
					  
					  <p>
					  		첨부파일
					  		
					  </p>
					  
				<button type="reset" id="c4"/>이전으로</button>
				<button type="submit" id="c5"/>등록하기</button>
				
			</form>	
			
		</div>
		
		
		<jsp:include page="../common/footer.jsp"/>

</body>
</html>