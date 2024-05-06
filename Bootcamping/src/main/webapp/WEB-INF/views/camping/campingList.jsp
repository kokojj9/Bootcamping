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
    
    .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
   
    div{
        box-sizing : border-box;
    }

    #content{
        width: 1200px;
        height: 1120px;
        margin: auto;
    }

    #content_1 {height: 10%; width: 100%;}

    #content_2 {height: 10%; width: 100%;}

    #content_3 {height: 80%; width: 100%;}

    #content_4 {height: 100%; width: 50%; float: left; overflow-y: auto;}

    #content_5 {height: 100%; width: 50%; float: left;}

    #search_form {
        position: relative;
        width: 100%;
        height: 100%;
        background-size : cover;
        background-position: 10%;
    }

    #search_form > #content_title > h2 {
        color: white;
        font-weight: 700;
        font-size: 35px;
    }

    #search_form  input[type=text]{
        width: 50%;
        height: 50px;
    }

    #search_form ::placeholder{
        text-align: center;
        font-size: 15px;
    }

    #search{float: left;}

    .dropdown > button{
        height: 50px;
        width: 100px;
        background-color: white;
        color: rgb(103, 103, 103);
        float: left;
        border: 1px solid black;
    }
    
    .dropdown > button:hover{
        background-color: rgb(22, 160, 133);       
    }

    .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle {
    color: #fff; 
    background-color: rgb(22, 160, 133);
    border-color: rgb(22, 160, 133);
    }


    #search_1{
        width: 70%;
        margin-left: 25%;
        margin-top: 2%;
    }
    
    #submit_btn{
        width: 70px;
        height: 50px;
        border-radius: 5px;
        border: 1px solid;
        color: rgb(103, 103, 103);
        background-color: white;
    }
    
    #kind{
        height: 50%;
        width: 15%;
        float: left;
    }

    #kind_list{
        height: 50%;
        font-size: 20px;
    }

    #theme{
        height: 50%;
        width: 15%;
        float: left;
    }

    #theme_list{
        height: 50%;
        font-size: 20px;
    }

    #content_2 h4 {
        text-align: center;
        padding-top: 5px;
    }

    .list{
        width: 20px;
        height: 20px; 
        margin-left: 20px;
        accent-color: rgb(22, 160, 133);
        margin-top: 10px;
    }
    
    #kind_list input[type="checkbox"], #theme_list input[type="checkbox"] {
    margin-right: 10px;
    
    }

    #total{
        width: 100%;
        height: 8%;
        padding-top: 30px;
    }

    #total h3{
        font-weight: 700;
    }

    #select_box{height: 3%; float: right;}
    
    #select_box select {width: 200px;}

    .items{
      width : 600px;
      height: 89%;
      margin : auto;
      display : flex;
      flex-wrap : wrap;
      gap : 15px;
      
   }
   
   .items .card{
      margin-left: 13px;
      width : 300px;
      height : 330px;
      border: none;
      margin-top: 10px;
   }
 

   .card-img-top{
    border-radius: 5%;
   }

   .card  a > h4{
    text-decoration: none;
    color: black;
   }
   
   .card a > p{
    text-decoration: none;
    color: #575757;
   }

   .card  a > h5{
    color: black;
   }

    .card a {
        text-decoration: none;
    }
	

    #camp_btn{
    	width:25%;
        margin: auto;
    }
    
    #camp_btn a {
        margin: 0 10px; 
    }
    
    .card-img-top{
    	width : 250px;
    	height : 180px;

    }

    </style>

</head>
<body>

    <div id="content">
    
        <div id="content_1">
             <!--검색창 부분-->
             <div id="search_form">
                <div id="search_1">
                    <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                          지역별
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">서울</a>
                          <a class="dropdown-item" href="#">경기</a>
                          <a class="dropdown-item" href="#">강원</a>
                        </div>
                      
                    </div>
                    
                    <form action="#" method="get">
                        <input type="text" placeholder="캠핑장 이름을 입력해주세요!">
                        <input type="submit" value="검색" id="submit_btn">
                    </form>
                </div>
            </div> 
            <!-- 여기까지 -->
        </div>

        <div id="content_2">
            <!--필터링-->
            <div id="kind"><h4>종류</h4></div>
            <div id="kind_list">
                <label><input type="checkbox" class="list">글램핑</label>
                <label><input type="checkbox" class="list">카라반</label>
                <label><input type="checkbox" class="list">일반야영장</label>
                <label><input type="checkbox" class="list">자동차야영장</label>
            </div>
            <div id="theme"><h4>시설</h4></div>
            <div id="theme_list">
                <label><input type="checkbox" class="list">침대</label>
                <label><input type="checkbox" class="list">에어컨</label>
                <label><input type="checkbox" class="list">냉장고</label>
                <label><input type="checkbox" class="list">유무선인터넷</label>
                <label><input type="checkbox" class="list">난방기구</label>
                <label><input type="checkbox" class="list">취사도구</label>
                <label><input type="checkbox" class="list">내부화장실</label>
            </div>

            <!--여기까지-->

        </div>

        <div id="content_3">

            <div id="content_4">

                <div id="total"><h3>전체 <sapn id="totalCamp"></sapn>개</h3></div>
                <div id="select_box">
                    <select name="" id="" class="btn">
                        <option value="">추천순</option>
                        <option value="">거리순</option>
                    </select>
                </div>
	
			
			<div id=itemsList>
                <div class="items" style="padding:20px;">
  
                </div>
                
                
           
                
                    <div id="camp_btn">
	                	<c:choose>
	                		<c:when test="${pageInfo.currentPage eq 1}">
		                    	<a class="btn btn-outline-success disabled" href="#"><</a>
	    					</c:when>
	    					<c:otherwise>
	    							<a class="btn btn-outline-success" href="/bootcamping/camping?page=${pageInfo.currentPage - 1}">
	    								<
	    							</a>
	    					</c:otherwise>				
	    				</c:choose>
 
	                	<c:choose>
	                		<c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
		                    	<a class="btn btn-outline-success disabled" href="#">></a>
	    					</c:when>
	    					<c:otherwise>
	    							<a class="btn btn-outline-success" href="/bootcamping/camping?page=${pageInfo.currentPage + 1}">
	    								>
	    							</a>
	    					</c:otherwise>				
	    				</c:choose>   

                 
                    </div>
            </div>


            </div>
            


     <div id="content_5">
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width:100%;height:880px;"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c74456b30df305563e1436aa0f8eb051"></script>



     </div>

        </div>

   
	<script>
	
		

	
		<%--캠핑장 전체 조회--%>
		var data = ${json}.response.body.items.item;
		
		var json = ${json}.response.body;
		
		console.log(data);
		console.log(json);
		
		$('#totalCamp').text(json.totalCount);
		
		let str = '';
		
		for(let i in data){
			const item = data[i];
			
			str += '<div class="card" style="width:250px;">'
				 + '<a href="#">'
				 + '<img class="card-img-top" src="'+item.firstImageUrl+'">'
				 + '<div class="card-body">'
				 + '<h4 class="card-title">'+item.facltNm+'</h4>'
			     + '<h5 class="card-text">'+item.induty+'</h5>'
		    	 + '<p>'+item.doNm+'</p>'
		    	 + '</a>'
		    	 + '</div>'
				 + '</div>'
		}
		
		
		
		$('.items').html(str);
		
	
		
		
		
		<%--지도--%>
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.48886707391863,  127.92504805374142), // 지도의 중심좌표
	        level: 12 // 지도의 확대 레벨
	    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	
	
	</script>


    </div>
    
</body>
</html>