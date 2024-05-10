<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>

        
    <!--달력-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet"/>


<style>

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

    #camp_name{width: 70%; height: 5%; margin: auto; border-bottom: 1px solid black;} 

    #camp_info {width: 70%; height: 6%; margin: auto; padding-left: 50px; padding-top: 20px; border-bottom: 1px solid black;} 

    #service {width: 70%; height: 3%; margin: auto; padding-left: 50px;padding-top: 20px; border-bottom: 1px solid black;}

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
        width: 30%;
        height: 100%;
        float: left;
        padding-right: 30px;
    }

    #selectPeople{
        width: 30%;
        height: 100%;
        float: left;
        padding-right: 180px;
    }

    #countPeople::placeholder{
        padding-left: 10px;
    }

    #checkIn, #checkOut, #selectPeople{
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

    #camp_thumbnail{
        text-align: center; 
    }

    #camp_thumbnail > img{
        width: 800px;
        height: 500px;
        display: inline-block;
        border-radius: 25px;
        padding-top: 10px;
        cursor: pointer;
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
        font-size: 50px;
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

    #seatImg {width: 700px;margin: auto;} 

    #reser_info th {font-weight: 400;}

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

    .siteName p {padding-top: 50px; font-size: 20px; margin-left: 20px;}

    .btn-success {background-color: rgb(22, 160, 133); }

    .reserBtn{float: right;}

    #reviewEtc{height: 5%;}

    #reviewEtc  a {float: right; margin-right: 15px; text-decoration: none; color: black;}

    .review_list{border: 1px solid lightgray; border-radius: 20px; height: 280px; margin-top: 20px;}

    .review_list p{text-align: right; padding-right: 30px;}

    .review_stroy{width: 100%;}

    .review_list h4{padding-left: 20px; margin-right: 10px;}

    .memberName{float: left;}

    .story_text {float: left; width: 70%; height: 100%; margin-left: 10px;}

    .review_img{float: left; width: 25%; margin-left: 20px; margin-top: 10px;}
    
    .review_img img {border-radius: 20px;}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="content">

        <!-- 날짜 인원 -->
        <div id="date_people">
            <div id="checkIn"><input id="startDate" width="200" placeholder="체크인"/></div>
            <div id="checkOut"><input id="endDate" width="200"  placeholder="체크아웃"/></div>
            <div id="selectPeople"><input id="countPeople" type="number" placeholder="인원 수" min="1" max="8" size="40"/></div>

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
                <h2>${camping.campName}</h2> <br>
                <p>${camping.campPhone }</p>
                <p>${camping.detailAddress }</p>
            </div>

            <div id="camp_heart">
                <div id="camp_share"><a><img src="../resources/img/share.png" width="30px"></a></div>
                <h1 class="heart white" >♡</h1>
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
            <div id="service_list" style="width: 70px; float: left; text-align: center; margin-top: 10px;"><p>화장실</p></div>
            <div id="service_list" style="width: 70px; float: left; text-align: center; margin-top: 10px;"><p>와이파이</p></div>
            <div id="service_list" style="width: 70px; float: left; text-align: center; margin-top: 10px;"><p>화장실</p></div>
            <div id="service_list" style="width: 70px; float: left; text-align: center; margin-top: 10px;"><p>와이파이</p></div>
        </div>

        <!-- 배치도 -->
        <div id="seat">
            <h4>캠핑 배치도</h4>
            <div id="seatImg"><img src="55928swWxdFGmfWcOnaOeEZn.jpg" width="600px"></div>
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
		                <div class="siteImg"><img src="../resources/siteImage/free.webp" width="255"></div>
		                <div class="siteName">
		                    <h4>A-10</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>	 
		            <div class="siteList">
		                <div class="siteImg"><img src="../resources/siteImage/free.webp" width="255"></div>
		                <div class="siteName">
		                    <h4>A-11</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>			                    		  	
		            <div class="siteList">
		                <div class="siteImg"><img src="../resources/siteImage/free.webp" width="255"></div>
		                <div class="siteName">
		                    <h4>A-12</h4>
		                    <p>해당 캠핑장 예약하러 가기</p>
		                    <div class="reserBtn"><a href="${camping.reserPage }">예약하기</a></div>
		                </div>
		            </div>	
		            <div class="siteList">
		                <div class="siteImg"><img src="../resources/siteImage/free.webp" width="255"></div>
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
			                <div class="siteImg"><img src="../${site.sitePath }" width="255"></div>
			                <div class="siteName">
			                    <h4>${site.siteName }</h4>
			                    <p>${site.sitePrice}원</p>
			                    <div class="reserBtn"><button class="btn btn-success">예약하기</button></div>
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
        </div>

        <!-- 후기 -->
        <div id="camp_review">
            <h4>후기(0)</h4>
            <div id="reviewEtc"><a href="">더보기 > </a></div>
            
            <div class="review_list">
                <h4 class="memberName">user01 &nbsp; ⭐️⭐️⭐️</h4>
                <div class=review_date><p>2024.05.04</p></div>
                <div class="review_stroy">
                    <div class="story_text">안녕하세요. 지난주 주말에 수도권 매립지 캠핑장을 이용한 사람입니다.
                    인천 시민으로써 가까운곳에 캠핑장이 생겨 자리가 날때만을 기다리며 광클릭을 통해 여러번 캠핑을 즐겼었죠.                    
                    다른캠핑장과 달리 코로나로 인해 사이트 간격을 비워놓고 예약을 받아서 좀 더 안심하고 해당 캠핑장을 이용중이였습니다.아이들이 있는관계로..
                    근데 이번 캠핑장 이용하며 너무 황당한 일을 겪었습니다. 
                    전 그렇게도 힘들게 카라반 예약을 했는데......거기까진 그냥 그런가보다 요즘세상에 이렇게 하는사람들이 있네...이래도 되나.....생각하고 있었는데
                    그분들 자리가 원래 비어있던 저희 옆 카라반이였습니다.... 쫌 당황했죠. 처음에는 다른곳 취소한 곳이 있어서 자리를 내줬나보다......
                    하고있었는데 원래 예약이 안되는 자리를 그분들께 주신겨 였더라구요..</div>
                    <div class="review_img"><img src="gg.png" width="180px" height="180px"></div>
                </div>
            </div>

            <div class="review_list">
                <h4 class="memberName">user01 &nbsp; ⭐️⭐️⭐️</h4>
                <div class=review_date><p>2024.05.04</p></div>
                <div class="review_stroy">
                    <div class="story_text">안녕하세요. 지난주 주말에 수도권 매립지 캠핑장을 이용한 사람입니다.
                    인천 시민으로써 가까운곳에 캠핑장이 생겨 자리가 날때만을 기다리며 광클릭을 통해 여러번 캠핑을 즐겼었죠.                    
                    다른캠핑장과 달리 코로나로 인해 사이트 간격을 비워놓고 예약을 받아서 좀 더 안심하고 해당 캠핑장을 이용중이였습니다.아이들이 있는관계로..
                    근데 이번 캠핑장 이용하며 너무 황당한 일을 겪었습니다. 
                    전 그렇게도 힘들게 카라반 예약을 했는데......거기까진 그냥 그런가보다 요즘세상에 이렇게 하는사람들이 있네...이래도 되나.....생각하고 있었는데
                    그분들 자리가 원래 비어있던 저희 옆 카라반이였습니다.... 쫌 당황했죠. 처음에는 다른곳 취소한 곳이 있어서 자리를 내줬나보다......
                    하고있었는데 원래 예약이 안되는 자리를 그분들께 주신겨 였더라구요..</div>
                    <div class="review_img"><img src="gg.png" width="180px" height="180px"></div>
                </div>
            </div>
            

        </div>

        <!-- 달력 -->
        <script>
            var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
            $('#startDate').datepicker({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                minDate: today,
                maxDate: function () {
                    return $('#endDate').val();
                }
            });
            $('#endDate').datepicker({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                minDate: function () {
                    return $('#startDate').val();
                }
            });

            /*하트*/
            const dislikeBtn = document.querySelector('.white');
            const likeBtn = document.querySelector('.hide');

            dislikeBtn.onclick = function () {    // 빈하트 클릭했을 때 
                dislikeBtn.classList.add('hide');  // 빈하트에 .hide 적용
                likeBtn.classList.remove('hide');   // 빨간하트에 적용되어 있던 .hide 삭제
            }

            likeBtn.onclick = function () {    // 빈하트 클릭했을 때 
                likeBtn.classList.add('hide');  // 빈하트에 .hide 적용
                dislikeBtn.classList.remove('hide');   // 빨간하트에 적용되어 있던 .hide 삭제
            }

        </script>

   	<jsp:include page="../common/footer.jsp"/>
   	
   	
   	
    </div>
    
    
    
</body>
</html>