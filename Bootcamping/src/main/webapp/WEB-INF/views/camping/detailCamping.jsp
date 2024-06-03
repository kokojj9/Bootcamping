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
        height: 4000px;
        margin: auto;
    }

    #date_people{width: 100%; height: 2%;}

    #camp_img{width: 100%; height: 13%;}

    #camp_name{width: 70%; height: 5%; margin: auto; border-bottom: 1px solid #e2e2e2;} 

    #camp_info {width: 70%; 
    
    
    
    
    
    margin: auto; padding-left: 50px; padding-top: 20px; border-bottom: 1px solid #e2e2e2;} 

    #service {width: 70%; height: 3%; margin: auto; padding-top: 20px; border-bottom: 1px solid #e2e2e2;}

    #seat {width: 70%; height: 12%; margin: auto; padding-left: 50px;padding-top: 20px; }

    #reser_info {width: 70%; height: 5%; margin: auto; padding-left: 50px;padding-top: 20px; }

    #reser_seat {width: 70%; height: 25%; margin: auto; padding-left: 50px;padding-top: 20px;}

    #camp_location {width: 70%; height: 10%; margin: auto; padding-left: 50px;padding-top: 20px;}

    #camp_review {width: 70%; height: 18%; margin: auto; padding-left: 50px;padding-top: 20px;}

    #checkIn{
        width:40%; 
        height: 100%; 
        float: left;
        padding-left: 130px;
    }

    #checkOut{
        width: 20%;
        height: 100%;
        float: left;
        padding-right: 50px;
    }

    #selectPeople{
        width: 15%;
        height: 100%;
        float: left;
        padding-top: 30px;
    }
    
        
    #selectDate{
        padding-top: 30px;
    }

    #countPeople::placeholder{
        padding-left: 10px;
    }

    #checkIn, #checkOut{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
        padding-top: 30px;
    }

    #countPeople{
        border: 1px solid lightgray;
        border-radius: 5px;
        width: 120px; 
        height: 40px; 
    }
    
    #selectDateBtn{
    	width : 70px;
    }

    #camp_thumbnail{
        text-align: center; 
    }

    #camp_thumbnail > img{
        width: 800px;
        height: 500px;
        display: inline-block;
        border-radius: 25px;
        padding-top: 10px;
    }

    #campTitle{
        width: 50%;
        height: 100%;
        float: left;
        padding-left: 50px;
        padding-top: 20px;
    }

    #campTitle h2 {
    	font-weight: 700;
    	width : 500px;
    }

    #campTitle p {
        font-size: 20px;
        color: rgb(96, 96, 96);
    }

    #camp_heart{
        width: 50%;
        height: 100%;
        float: left;
        text-align: right; 
        padding-right: 35px;
        display: flex; 
        justify-content: flex-end;
    }

    .heart {
        font-size: 45px;
        font-weight: 100;
        cursor: pointer;
    }

    #camp_share{
        display: inline-block;
        margin-right: 20px;
        padding-top: 5px;
        cursor: pointer;
        padding-top : 15px;
    }

    .hide {display: none;}

    #red{color: red;}

    #camp_info h4 {font-weight: 700; padding-bottom: 20px;}

    #service h4, #seat h4 {font-weight: 700;}

    #seatImg {width: 740px; padding-top:10px} 

    #reser_info th {font-weight: 400;}
    
    #reser_info h4 {font-weight : 700;}

    #reser_info td {
        padding-left: 30px; 
        width:400px;
        height: 35px;
        color: rgb(88, 88, 88);
    }

    .siteList{
        width: 90%;
        height: 20%;
        border: 1px solid lightgray;
        border-radius: 20px;
        margin-top: 10px;
        margin-bottom: 30px;
    }

    .siteImg{
        float: left;
        width : 200px;
        height: 100%;
    }

    .siteImg img {
        border-radius: 20px;
        width : 200px;
        height: 195px;
    }

    .siteName{
        float: left;
        height: 100%;
        width: 60%;
    }

    .siteName h4{
        font-weight: 300;
        margin-left: 20px;
        padding-top: 10px;
    }

    .siteName p, h5 {padding-top: 10px; margin-left: 20px;}

    .btn-success {background-color: rgb(22, 160, 133); }

    .reserBtn{float: right;}

    #reviewEtc{height: 5%;}

    #reviewEtc  a {float: right; margin-right: 15px; text-decoration: none; color: black;}

    .review_list{border: 1px solid lightgray; border-radius: 20px; height: 280px; margin-top: 20px;}

    .review_list p{text-align: right; padding-right: 30px; padding-top : 5px;}

    .review_stroy{width: 100%;}

    .review_list h4{padding-left: 20px; padding-top: 5px; font-size : 25px;}

    .memberName{float: left;}

    .story_text {float: left; width: 70%; height: 100%; margin-left: 10px;}
	
	.story_text > p {text-align : left; padding-left : 10px;}
    
    #reviewTitle > h4{ padding-top : 15px;}
    
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
    
    #service_list > p { width : 660px; }
    
    #service > h4 { padding-left: 50px;}
    
	.carousel-item {
    	width : 790px;
    	height : 410px;
	}
	
    .carousel-item img {
      width: 100%;
      height: 100%;
    }

    .carousel-inner {
    	width : 790px;
    	height : 410px;
    }
    
    #reviewScoreColor{
    	color : #FFBF00;
    	
    }
        
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="content">
    
    

        <!-- 날짜 인원 -->
        <div id="date_people">
	            <div id="checkIn"><input id="startDate" width="200" name="checkInDate" value="" placeholder="체크인"/></div>
	            <div id="checkOut"><input id="endDate" width="200" name="checkOutDate"  value="" placeholder="체크아웃"/></div>
	            <div id="selectPeople"><input id="countPeople" name="people" value="" type="number" placeholder="인원 수" min="1" max="8" size="40"/></div>
				<div id="selectDate"><input id="selectDateBtn" class="btn" type="button" onclick="AllReser();" value="선택"/></div>
        </div>

        <!-- 캠핑장 사진 -->
        <div id="camp_img">
            <div id="camp_thumbnail">
                <img src="${camping.campImg}" />
            </div>

        </div>

        <!-- 캠핑 이름 정보-->
        <div id="camp_name">

            <div id="campTitle">
                <h2>${camping.campName}</h2> <br/>
                <p>${camping.campPhone }</p>
                <p>${camping.detailAddress }</p>
            </div>

            <div id="camp_heart">
                <div id="camp_share"><a><img src="resources/img/share.png" width="30px"/></a></div>
                <h1 class="heart white" id="white">♡</h1>
                <h1 class="heart hide" id="red" >♥️</h1>
            </div>

        </div>

        <!-- 캠핑장 정보 -->
        <div id="camp_info">
            <h4>캠핑장 소개</h4>
            <p>${camping.intro }</p>
        </div>

        <!-- 시설 -->
        <div id="service">
            <h4>시설 환경</h4>
            <div id="service_list" style="float: left; margin-top: 10px; padding-left: 50px;">${camping.service }</div>
        </div>

        <!-- 배치도 -->
        <div id="seat">
            <h4>캠핑 이미지</h4>
            <div id="seatImg">


			<div id="demo" class="carousel slide" data-ride="carousel">
		
		  	<!-- The slideshow -->
			  <div class="carousel-inner">
			
			  </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
		</div>

            </div>
        </div>

        <!-- 예약 안내 -->
        <div id="reser_info">
            <h4>기본 정보</h4>
            <table>
                <tbody>
                    <tr>
                        <th>캠핑장 환경</th>
                        <td>${camping.campLocation}</td>
                    </tr>
                    <tr>
                        <th>캠핑장 유형</th>
                        <td>${camping.type }</td>
                    </tr>
                    <tr>
                        <th>운영기간</th>
                        <td>${camping.oper }</td>
                    </tr>
                    <tr>
                        <th>운영일</th>
                        <td>${camping.operDate }</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 예약 객실 -->
        <div id="reser_seat">
			
			<c:choose>
      		  	<c:when test="${ empty requestScope.site}">
		            <div class="siteList">
		                <div class="siteImg"><img src="resources/siteImage/free.webp" width="255"/></div>
		                <div class="siteName">
		                    <h4>A-10</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>	 
		            <div class="siteList">
		                <div class="siteImg"><img src="resources/siteImage/free.webp" width="255"/></div>
		                <div class="siteName">
		                    <h4>A-11</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>			                    		  	
		            <div class="siteList">
		                <div class="siteImg"><img src="resources/siteImage/free.webp" width="255"/></div>
		                <div class="siteName">
		                    <h4>A-12</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>	
		            <div class="siteList">
		                <div class="siteImg"><img src="resources/siteImage/free.webp" width="255"/></div>
		                <div class="siteName">
		                    <h4>A-13</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>			            		            
      		  	</c:when>			
			
				<c:when test="${requestScope.site ne null}">
					<c:forEach var="site" items="${requestScope.site }">
			            <div class="siteList">
			                <div class="siteImg"><img src="${site.sitePath }" width="255"/></div>
			                <div class="siteName">
			                    <h4>${site.siteName }</h4><p>${site.typeName}</p>
			                    <h5>${site.sitePrice}원</h5>
			                    <div class="reserBtn">
			                    	<form action="/bootcamping/reservation">
				                        <input type="hidden" name="siteNo" value="${site.siteNo}">
				                     	<input type="hidden" name="startDate" class="startDateInput">
									    <input type="hidden" name="endDate" class="endDateInput">
									    <input type="hidden" name="countPeople" class="countPeopleInput">
									    <input type="hidden" name="sitePrice" value="${site.sitePrice }" class="totalPrice">
				                  		<button type="submit" id="campReserBtn" class="btn btn-success campingReserBtn" onclick="reservationPage(${site.siteNo})">예약하기
				                    	</button>
			                    	</form>
			                    </div>
			                    
			                </div>
			            </div>					
					</c:forEach>
				</c:when>
			</c:choose>
			



            

        </div>

        <!-- 위치 -->
        <div id="camp_location">
            <h4>위치</h4>
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c74456b30df305563e1436aa0f8eb051"></script>
        </div>

        <!-- 후기 -->
        <div id="camp_review">
            <div id="reviewTitle"><h4><span id="reviewCount"></span></h4></div>
            <div id="reviewEtc"><a href="/bootcamping/review?campNo=${camping.campNo }">더보기 > </a></div>
            
            <div id="reviewListSelect">
            
            </div>
 

        </div>

        <!-- 달력 -->
        <script>
            var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
         // 체크인 datepicker 설정
            $('#startDate').datepicker({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                minDate: today,
                maxDate:  () => {
                    return $('#endDate').val();
                },
                onSelect:  date => {
                    // 체크인 날짜를 startDate의 값으로 설정
                    $('#startDate').val(date); // 수정된 부분
                    let selectedDate = $('#startDate').val(); // 수정된 부분
                    console.log("체크인 날짜:", selectedDate); // 수정된 부분
                },
                defaultDate: today, // 오늘 날짜로 기본값 설정
                onClose: selectedDate => {
                    // 체크인을 선택하지 않았을 때, 오늘 날짜로 설정
                    if (selectedDate === "") {
                        $('#startDate').datepicker('setDate', today);
                    }
                }
            });

            // 체크아웃 datepicker 설정
            $('#endDate').datepicker({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                minDate:  () => {
                    return $('#startDate').val();
                },
                onSelect: date => {
                    console.log("체크아웃 날짜:", date);
                },
                onClose: selectedDate => {
                    // 체크아웃을 선택하지 않았을 때, 다음 날짜로 설정
                    if (selectedDate === "") {
                        let tomorrow = new Date();
                        tomorrow.setDate(tomorrow.getDate() + 1);
                        $('#endDate').datepicker('setDate', tomorrow);
                    }
                }
            });

            
            /*지도*/
            var mapX = ${camping.mapX}
            var mapY = ${camping.mapY}
            var campName = "${camping.campName}";
			var detailAddress = "${camping.detailAddress}";
			var campImg = "${camping.campImg}";
			var reserPage = "${camping.reserPage}";
			
            
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(mapY, mapX), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
	
	        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	        var map = new kakao.maps.Map(mapContainer, mapOption);     
	        
	     // 지도에 마커를 표시합니다 
	        var marker = new kakao.maps.Marker({
	            map: map, 
	            position: new kakao.maps.LatLng(mapY, mapX)
	        });

	        // 커스텀 오버레이에 표시할 컨텐츠 입니다
	        // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	        // 별도의 이벤트 메소드를 제공하지 않습니다 
	        var content = '<div class="wrap">' + 
	                    '    <div class="info">' + 
	                    '        <div class="title">' + campName +  
	                    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	                    '        </div>' + 
	                    '        <div class="body">' + 
	                    '            <div class="img">' +
	                    '                <img src="'+campImg+'" width="73" height="70">' +
	                    '           </div>' + 
	                    '            <div class="desc">' + 
	                    '                <div class="ellipsis">'+detailAddress+'</div>' +   
	                    '                <div><a href="' + reserPage + '" target="_blank" class="link">홈페이지</a></div>' + 
	                    '            </div>' + 
	                    '        </div>' + 
	                    '    </div>' +    
	                    '</div>';

	        // 마커 위에 커스텀오버레이를 표시합니다
	        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	        var overlay = new kakao.maps.CustomOverlay({
	            content: content,
	            map: map,
	            position: marker.getPosition()       
	        });

	        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	        kakao.maps.event.addListener(marker, 'click', function() {
	            overlay.setMap(map);
	        });

	        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	        function closeOverlay() {
	            overlay.setMap(null);     
	        }
		    
	        /*이미지*/
			var data = ${campImg}.response.body.items.item;
			
			
			let str = '';
			
			str += '<div class="carousel-item active">'
				 + '<img src="'+ data[0].imageUrl+'" alt="Los Angeles" width="1100" height="500">'
		    	 + '</div>';	
		    	 
		 		
		    document.querySelector('.carousel-inner').innerHTML = str;
						
			    	 
			let resultStr = '';
			
			for(let i = 1; i < data.length; i++){
				str += '<div class="carousel-item">'
					 + '<img src="'+ data[i].imageUrl+'" alt="Los Angeles" width="1100" height="500">'
			    	 + '</div>';		
				
			}
	
			document.querySelector('.carousel-inner').innerHTML = str;
			
			
			/*리뷰*/
			
			let campNo = "${camping.campNo}";
			
			function selectReview(){
	            $.ajax({
	                url : 'reviewList',
	                type : 'get',
	                data : {campNo : campNo},
	                success : result => {
	                	console.log(result);
	                    
	                    let reviewResult = '';
	                    
	                    if(result.data.length === 0) {
	                    	reviewResult += '<div><br><br><h5 style="text-align:center;">리뷰가 존재하지 않습니다<h5></div>'
	               		} else {
	                    
	               			for(let i = 0; i <result.data.length; i++){
	                    
	                    reviewResult += '<div class="review_list">'
	                    			  + '<h4 class="memberName">'+ result.data[i].memberId + '&nbsp;&nbsp;&nbsp;'+ '<span id="reviewScoreColor">' + result.data[i].reviewScore + '</span>' + '</h4>'
	                    			  + '<div class=review_date><p>'+ result.data[i].createDate +'</p></div>'
	                    			  + '<div class="review_stroy">'
	                    			  + '<div class="story_text"><p>'+result.data[i].reviewContent+'</p></div>'                    			  
	                    			  + '<div class="review_img"><img src="'+ result.data[i].reviewPath+'"></div>'
	                    			  + '</div>'
	                    			  + '</div>'
	                    	}
	                    document.getElementById('reviewListSelect').innerHTML = reviewResult;
	                    }

	                    document.getElementById('reviewListSelect').innerHTML = reviewResult;
	                 
	                    
	                }
	            });
        }
        
        $(() => {
            selectReview();
        });
        
 
        
        </script>
        
        
        <!-- 날짜 & 인원수 선택 -->
        <script>
        	function AllReser(){
        		
        		let start = $('#startDate').val();
        		let end = $('#endDate').val();
        		let countPeople = $('#countPeople').val();
        		
        		/*checkInDate*/
        		var start2 = start.split("/");


        		var year = parseInt(start2[2]);
        		var month = parseInt(start2[0]) - 1;
        		var day = parseInt(start2[1]);

        		var date = new Date(year, month, day);
        		
        		var date = new Date(year, month, day);
        		var yearString = date.getFullYear().toString().slice(-2);
        		var monthString = (date.getMonth() + 1).toString().padStart(2, '0');
        		var dayString = date.getDate().toString().padStart(2, '0');

        		var dateString = yearString + '/' + monthString + '/' + dayString;
        		console.log(dateString);
        		
        		
        		/*checkOutDate*/
        		var end2 = end.split("/");

        		var year2 = parseInt(end2[2]);
        		var month2 = parseInt(end2[0]) - 1;
        		var day2 = parseInt(end2[1]);

        		var date2 = new Date(year2, month2, day2);
        		
        		var date2 = new Date(year2, month2, day2);
        		var yearString2 = date2.getFullYear().toString().slice(-2);
        		var monthString2 = (date2.getMonth() + 1).toString().padStart(2, '0');
        		var dayString2 = date2.getDate().toString().padStart(2, '0');

        		var dateString2 = yearString2 + '/' + monthString2 + '/' + dayString2;
        		console.log(dateString2);
        		
        		/*checkOutDate에서 CheckInDate 뺀 거 계산*/
        		var checkInDate = new Date(document.getElementById('startDate').value);
        	    var checkOutDate = new Date(document.getElementById('endDate').value);

        		var dateComparison = checkOutDate.getTime() - checkInDate.getTime();
         	   	
        		dateComparison = Math.ceil(dateComparison / (1000 * 60 * 60 * 24));
        		
         	   	console.log(dateComparison);
         	   	
         	   	
         	   	var addPrice = 30000;
         	   	var currentPrice = parseInt(document.querySelector('.totalPrice').value);
         	    
         	   	console.log(currentPrice);
         	   	
         	   	
         	   	if (dateComparison !=1 ) {
         	        var totalPrice = currentPrice + ((dateComparison-1) * addPrice);
         	        $('.totalPrice').val(totalPrice);
         	    	console.log(totalPrice);    
         	    } else{
         	    	$('.totalPrice').val(currentPrice);
         	    }


         		$('.startDateInput').val(dateString);
		        $('.endDateInput').val(dateString2);
		        $('.countPeopleInput').val(countPeople);
        		

        		$.ajax({
        			
        			url : '/bootcamping/camping/selectDate',
        			type : 'post',
        			data : {startDate : dateString,
	        				endDate : dateString2,
	        				countPeople : countPeople,
	        				campNo : campNo
	        				
        				},
        			success : result => {
        				
        				console.log(result);
        				
        				if(result.length === 0){
        					$('#campReserBtn').attr("disabled", false).text("예약하기");
        					
        				}else{
        					$('#campReserBtn').attr("disabled", true).text("예약마감");
        				}
        			       
        			}
        			
        		})
        		
        	}  
        	
        	
        	$(() => {
        	    $('.campingReserBtn').click(function(event) {
        	        var startDate = $('.startDateInput').val();
        	        var endDate = $('.endDateInput').val();
        	        var countPeople = $('.countPeopleInput').val();
        	        
        	        if (!startDate || !endDate || !countPeople) {
        	            event.preventDefault();
        	            alertify.alert('알림', '일정과 인원수를 선택해주세요');
        	        }
        	    });
        	});
        	
        	
        	
        	
        	/*찜하기*/
        	
        	let memberNo = "${sessionScope.loginMember.memberNo}";
        	
        	let wishList = window.localStorage.getItem(memberNo + '/' + campNo);
			
        	$(() => {
			    if(wishList === 'red') {
			        $('#white').addClass('hide');
			        $('#red').removeClass('hide');
			    } else{
			    	$('#red').addClass('hide');
			    	$('#white').removeClass('hide');
			    }
			});		
        	
        	
        	
        	$('#white').click(() => {
        		
        		if (memberNo === null || memberNo === '') {
        			alertify.alert('실패','로그인이 필요합니다!');
        		} else {
        			$.ajax({
	       	            url : '/bootcamping/camping/insert.heart',
	       	            type : 'post',
	       	            data : { memberNo : memberNo, 
	       	            		campNo : campNo },
	       	            success : result => {
	       	            	
	       	            	console.log(result);
	       	            	
		       	             $('#white').addClass('hide'); 
			       	         $('#red').removeClass('hide');
			       	         
			       	         alertify.alert('성공', '찜 완료!');
			       	          
			       	       	 window.localStorage.setItem(memberNo + '/' + campNo, 'red');
			       	          
	       	            }
        			
        			});        		
        			
        		}
        	
        	
        	})
        	
        	/*찜하기 취소*/
        	
        	$('#red').click(() => {
        		
        		$.ajax({
        			url : '/bootcamping/camping/delete.heart',
        			type : 'post',
        			data : {memberNo : memberNo,
        					campNo : campNo},
        			success : result => {
        				
        				console.log(result); 
        				
        				$('#red').addClass('hide');
        				$('#white').removeClass('hide'); 
        				
        				alertify.alert('성공', '찜 삭제!');
        				
        				window.localStorage.setItem(memberNo + '/' + campNo, 'white');
        			}
        		})
        		
        	})
        	
        	
        </script>
        
        
   
        

   	<jsp:include page="../common/footer.jsp"/>
   	
   	
   	
    </div>
    
    
    
</body>
</html>