<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    div{
        box-sizing : border-box;
    }

    #content{
        width: 1200px;
        height: 1120px;
        margin: auto;
    }

    #camp_review {
        width: 70%; 
        height: 30%; 
        margin: auto; 
    }

    .review_list{
        border: 1px solid lightgray; 
        border-radius: 20px; 
        height: 280px; 
        margin-top: 40px;
        margin-bottom: 30px;
    }

    .review_list p{text-align: right; padding-right: 30px;}

    .review_stroy{
        width: 100%;  
        height: 90%; 
        float: left;
    }

    .review_list h4{
        padding-left: 20px; 
        margin-right: 10px; 
        padding-top: 5px;
    }

    .memberName{float: left;}

    .story_text {
        float: left; 
        width: 70%; 
        height: 100%; 
        padding-left: 10px;
        padding-top: 10px;
    }

    .review_img{
        float: left; 
    	margin-left: 20px; 
    	margin-top: 10px;
    	width : 180px;
    	height : 180px;
    }

    .review_img img {
	    border-radius: 20px;     	
	    width : 180px;
	    height : 180px;
	}

    #reviewUpdate{width: 30%; height: 15%; float: left;}

    #reviewUpdate button{margin-right: 10px; margin-top: 5px;}

    #reviewTitle{width: 55%;}

    #reviewTitle a {
        text-decoration: none;
        color: black;
    }
    
    #reviewScoreColor{
    	color : #FFBF00;
    	
    }
    


</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>	
	
	<br>
    
    <div id="content">

        <!-- 후기 -->       
        <div id="reviewTitle"><h3><a href="/bootcamping/camping/detail?contentId=${campNo}">◁</a>&nbsp;리뷰 전체보기</h3></div>
            
        <div id="camp_review">
     	
     	
     <c:choose>
     	<c:when test="${requestScope.review ne null && empty requestScope.review}">
     		<h3>리뷰가 존재하지 않습니다.</h3>
     	</c:when>
     	<c:when test="${requestScope.review ne null }">
     	<c:forEach items="${review }" var="review">
            <div class="review_list">
                <h4 class="memberName">${review.memberId } &nbsp; <span id="reviewScoreColor">${review.reviewScore }</span></h4>
                <div id="reviewUpdate">
                    <button class="btn-sm btn-outline-light text-dark">수정</button>
                    <button class="btn-sm btn-outline-light text-dark">삭제</button></div>
                <div class=review_date><p>${review.createDate }</p></div>
                <div class="review_stroy">
                    <div class="story_text">${review.reviewContent }</div>
                    <div class="review_img"><img src="${review.reviewPath }" width="180px" height="180px"></div>
                </div>
            </div>
		
		</c:forEach>
		</c:when>
		</c:choose>


            <div class="paging-area" align="center";>
                <c:choose>
                	<c:when test="${pageInfo.currentPage eq 1 }">
		                <a class="btn btn-sm disabled" href="#"><</a>
		            </c:when>
		            
					<c:otherwise>
						 <a class="btn btn-sm" href="/bootcamping/review?campNo=${campNo}&page=${pageInfo.currentPage - 1}"><</a>
					</c:otherwise>
					
	            </c:choose>		
	            			
                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                  	<a class="btn btn-sm" href="/bootcamping/review?campNo=${campNo}&page=${p}">${p}</a>
				</c:forEach>	
					
               	<c:choose>
               		<c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                    	<a class="btn btn-sm disabled"  href="#">></a>
   					</c:when>
   					<c:otherwise>
   					 	<a class="btn btn-sm" href="/bootcamping/review?campNo=${campNo}&page=${pageInfo.currentPage + 1}">></a>
   					</c:otherwise>				
   				</c:choose>   					
            
            </div>
		        

            

    </div>
  </div>
    
    
	<jsp:include page="../common/footer.jsp"/>	
    
</body>
</html>