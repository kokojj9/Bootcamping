<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>

    <style>
    
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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
 
 	.card-body {
 		color : black;
 	}

   .card-img-top{
    	border-radius: 5%;
   }

   .card  a > h4{
	    color: black;
   }
   
   .card a > p{
	    color: #575757;
   }

   .card  a > h5{
    color: black;
   }

    #camp_btn{
		text-align: center;
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

	<jsp:include page="../common/header.jsp"/>
	
    <div id="content">
    
        <div id="content_1">
             <!--검색창 부분-->
             <div id="search_form">
                <div id="search_1">
                        <input type="text" placeholder="캠핑장 이름을 입력해주세요!" id="keyword">
                        <input type="button" value="검색" id="submit_btn" onclick="searchBtn();">
                </div>
            </div> 
            <!-- 여기까지 -->
        </div>

        <div id="content_2">
            <!--필터링-->
            <div id="kind"><h4>종류</h4></div>
            <div id="kind_list">
                <label><input type="checkbox" name="type" class="list" value="글램핑">글램핑</label>
                <label><input type="checkbox" name="type" class="list" value="카라반">카라반</label>
                <label><input type="checkbox" name="type" class="list" value="일반야영장">일반야영장</label>
                <label><input type="checkbox" name="type" class="list" value="자동차야영장">자동차야영장</label>
            </div>
            <div id="theme"><h4>지역</h4></div>
            <div id="theme_list">
                <label><input type="checkbox" name="address" class="list" value="서울">서울</label>
                <label><input type="checkbox" name="address" class="list" value="경기">경기</label>
                <label><input type="checkbox" name="address" class="list" value="인천">인천</label>
                <label><input type="checkbox" name="address" class="list" value="충청">충청도</label>
                <label><input type="checkbox" name="address" class="list" value="경상">경상도</label>
                <label><input type="checkbox" name="address" class="list" value="강원">강원도</label>
                <label><input type="checkbox" name="address" class="list" value="전라">전라도</label>
                <label><input type="checkbox" name="address" class="list" value="제주">제주도</label>
            </div>

            <!--여기까지-->

        </div>

        <div id="content_3">

            <div id="content_4">

                <div id="total"><h3>전체 <sapn id="totalCamp"></sapn>개</h3></div>

			
			<div id=itemsList>
                <div class="items" style="padding:20px;">

            </div>
                
                
           
                
            <div id="camp_btn">
               	<c:choose>
	               		<c:when test="${pageInfo.currentPage eq 1}">
	                    	<a class="btn btn-sm disabled" href="#"><</a>
	   					</c:when>
	   					<c:otherwise>
	   							<a class="btn btn-sm" href="/bootcamping/camping?page=${pageInfo.currentPage - 1}">
	   								<
	   							</a>
	   					</c:otherwise>				
	   				</c:choose>
	   				
	   				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
	                  	<a class="btn btn-sm" href="/bootcamping/camping?page=${p}">${p}</a>
					</c:forEach>	
	
	               	<c:choose>
	               		<c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
	                    	<a class="btn btn-sm disabled" href="#">></a>
	   					</c:when>
	   				<c:otherwise>
	   						<a class="btn btn-sm" href="/bootcamping/camping?page=${pageInfo.currentPage + 1}">
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
			
			
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c74456b30df305563e1436aa0f8eb051&libraries=clusterer"></script>

	
	
	     </div>
	
	  </div>

	
	 <jsp:include page="../common/footer.jsp"/>
   
	
	<script>

		<%--캠핑장 전체 조회--%>
		var data = ${json}.response.body.items.item;
		
		console.log(data);
		
		var json = ${json}.response.body;
		
		console.log(data);
		console.log(json);
		
		$('#totalCamp').text(json.totalCount);
		
		let str = '';
		
		for(let i in data){
			const item = data[i];
			
			str += '<div class="card" style="width:250px;">'
				 + '<a style="text-decoration:none;"  href="/bootcamping/detailCamping?contentId='+ item.contentId +'">'
			    
				 + '<img class="card-img-top" src="'+item.firstImageUrl+'">'
				 + '<div class="card-body">'
				 + '<h4 class="card-title">'+item.facltNm+'</h4>'
			     + '<h5 class="card-text">'+item.induty+'</h5>'
		    	 + '<p>'+item.doNm+'</p>'
		    	 + '</div>' 
		    	 + '</a>'
				 + '</div>'
		}
		
		
		$('.items').html(str);
		

		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.48886707391863,  127.92504805374142), // 지도의 중심좌표
	        level: 12 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
	    // 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });
	 		
		
		
		
		/*지도*/
		$(function(){
			
			$.ajax({
				url : '/bootcamping/camping/mapCamping',
				success : result => {
					//console.log(result.response.body.items);
					
					let positions = result.response.body.items.item;
					
					console.log(data);

				
						
						
				        var markers = $(positions).map(function(i, position) {
				            return new kakao.maps.Marker({
				                position : new kakao.maps.LatLng(position.mapY, position.mapX)
				            });
				        });
				        
				        console.log(markers);

				        // 클러스터러에 마커들을 추가합니다
				        clusterer.addMarkers(markers);
						
					
				}
			})
			
		})
		
		
		/*검색*/
		function searchBtn(num){
			
			$.ajax({
				url : '/bootcamping/camping/searchCamping',
				data : {keyword : $('#keyword').val(),
						page: num },
				type : 'get',
				success : result => { 
					console.log(result);
					
					$('#totalCamp').text(result.data.pageInfo.listCount);
					 
					if(result.data.searchCampingList.length === 0){
					    alert("해당 캠핑장이 존재하지 않습니다.");
					    location.href = '/bootcamping/camping';
						
					} else {
						let str = '';
						
						for(let i = 0; i <result.data.searchCampingList.length; i++){
							
							str += '<div class="card" style="width:250px;">'
								 + '<a style="text-decoration:none;" href="/bootcamping/detailCamping?contentId='+ result.data.searchCampingList[i].campNo +'">'
							    
								 + '<img class="card-img-top" src="'+result.data.searchCampingList[i].campImg+'">'
								 + '<div class="card-body">'
								 + '<h4 class="card-title">'+result.data.searchCampingList[i].campName+'</h4>'
							     + '<h5 class="card-text">'+result.data.searchCampingList[i].address+'</h5>'
						    	 + '<p>'+result.data.searchCampingList[i].type+'</p>'
						    	 + '</div>'
						    	 + '</a>'
								 + '</div>'
						}
						
						
						$('.items').html(str);						
					}
					


					
					var pagination = $('#camp_btn');
		            pagination.empty();
		
		            var pageInfo = result.data.pageInfo;
		
					if(pageInfo.currentPage === 1){
		            	 pagination.append('<a class="btn btn-sm disabled" href="#"><</a>');
		            }
		            
					else {
		                pagination.append('<a class="btn btn-sm" href="#" onclick="searchBtn(' + (pageInfo.currentPage - 1) + '); return false;"><</a>');
		            }
		            
					for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
		                pagination.append('<a class="btn btn-sm" href="#" onclick="searchBtn(' + i + '); return false;">' + i + '</a>');
		            }
		            
		            if (pageInfo.currentPage === pageInfo.maxPage) {
		            	pagination.append('<a class="btn btn-sm disabled" href="#">></a>');
		            }
		            	
		            else {pagination.append('<a class="btn btn-sm" href="#" onclick="searchBtn(' + (pageInfo.currentPage + 1) + '); return false;">></a>');
		            }

					
				}
			})
		}





		
		/*체크박스*/
		$(() => {
		    $('input[type="checkbox"]').change(function() {
		        var checkedTypes = $('input:checkbox[name="type"]:checked').map(function() {
		            return this.value;
		        }).get();
		        
		        var checkedAddresses = $('input:checkbox[name="address"]:checked').map(function() {
		            return this.value;
		        }).get();
		
		        searchCheckedValues(checkedTypes, checkedAddresses);
		        
		    });
		});
		
		
		function searchCheckedValues(types, addresses, num) {
			
		    $.ajax({
		        url: '/bootcamping/camping/checkedCamping',
		        data: { 
		            types: types.join(','),
		            addresses: addresses.join(','),
		            page: num
		        },
		        type: 'GET',
		        success: result => {
		        	
		        	console.log(result);
		        	
					$('#totalCamp').text(result.data.pageInfo.listCount);
					
					let str = '';
					
					for(let i = 0; i <result.data.checkCamping.length; i++){
						
						str += '<div class="card" style="width:250px;">'
							 + '<a style="text-decoration:none;" href="/bootcamping/detailCamping?contentId='+ result.data.checkCamping[i].campNo +'">'
						    
							 + '<img class="card-img-top" src="'+result.data.checkCamping[i].campImg+'">'
							 + '<div class="card-body">'
							 + '<h4 class="card-title">'+result.data.checkCamping[i].campName+'</h4>'
						     + '<h5 class="card-text">'+result.data.checkCamping[i].address+'</h5>'
					    	 + '<p>'+result.data.checkCamping[i].type+'</p>'					    	 
					    	 + '</div>'
					    	 + '</a>'
							 + '</div>'
					}
					
					
					$('.items').html(str);						
			
				


						
				var pagination = $('#camp_btn');
				
		        pagination.empty();
		
		        var pageInfo = result.data.pageInfo;
		        
		        console.log(pageInfo);
		        
		        if(pageInfo.currentPage === 1){
		        	 pagination.append('<a class="btn btn-sm disabled" href="#"><</a>');
		        }
		        
		        else {
		            pagination.append('<a class="btn btn-sm" href="#" onclick="searchCheckedValues(' + (pageInfo.currentPage - 1) + '); return false;"><</a>');
		        }
		        
		        for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
		            pagination.append('<a class="btn btn-sm" href="#" onclick="searchCheckedValues(' + i + '); return false;">' + i + '</a>');
		        }
		       
		        if (pageInfo.currentPage === pageInfo.maxPage) {
		        	pagination.append('<a class="btn btn-sm disabled" href="#">></a>');
		        }
		        	
		        else {pagination.append('<a class="btn btn-sm" href="#" onclick="searchCheckedValues(' + (pageInfo.currentPage + 1) + '); return false;">></a>');
		        }
			            
		            		            
			            
	            
	        }
	    });
	}
		
		
		
				

	</script>


    </div>
    
</body>
</html>