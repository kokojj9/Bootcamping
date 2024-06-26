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
        <div id="reviewTitle"><h4><a href="/bootcamping/detailCamping?contentId=${campNo}">◁</a>&nbsp;리뷰 전체보기</h4></div>
            
        <div id="camp_review">
        
        <c:choose>
	  	<c:when test="${empty requestScope.review }">
        	   
        	   	<h4 style="text-align:center; padding-top : 100px;">리뷰가 존재하지 않습니다.</h4>                       	   
        	               		  	
	  	</c:when>
	  	<c:otherwise>

     	<c:forEach items="${review }" var="review">
            <div class="review_list">
                <h4 class="memberName">${review.memberId } &nbsp; <span id="reviewScoreColor">${review.reviewScore }</span></h4>
                
                
                <!-- 리뷰 작성자일 경우에만 수정 삭제 조회 -->
                <c:if test="${sessionScope.loginMember.memberId eq review.memberId}">
	                <div id="reviewUpdate">
	                    <button class="btn-sm btn-outline-light text-dark reviewBtn">수정</button>
	                    <button class="btn-sm btn-outline-light text-dark reviewBtn">삭제</button>
	                </div>
               </c:if>
               
               <form action="" method="post" class="postForm">
               		<input type="hidden" name="reservationNo" value="${review.reservationNo }" />
               		<input type="hidden" name="filePath" value="${review.reviewPath }" />
               </form>
               

                <div class=review_date><p>${review.createDate }</p></div>
                <div class="review_stroy">
                    <div class="story_text">${review.reviewContent }</div>
                    <div class="review_img"><img src="${review.reviewPath }" width="180px" height="180px"></div>
                </div>
            </div>
		
		</c:forEach>



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
           </c:otherwise>
		</c:choose>
	    </div>
	  </div>
  
	  <script>
	            		
	    $('.reviewBtn').click((event) => {
	    	
            const eventTarget = $(event.currentTarget);
            
            if (eventTarget.text() === '수정') {
               
            	eventTarget.parent().next().attr('action', 'updateForm.review').submit();
            
            } else {
               
            	eventTarget.parent().next().attr('action', 'delete.review').submit();
           
            }				
		})
	
	  </script>
    
    
 	 <jsp:include page="../common/footer.jsp"/>	
    
</body>
</html>