<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    #reviewTitle{width: 55%; text-align:center;}

    #reviewTitle a {
        text-decoration: none;
        color: black;
    }
    


</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>	
	
	<br>
    
    <div id="content">

        <!-- 후기 -->       
        <div id="reviewTitle"><h3><a href="#">◁</a>&nbsp;보물나라캠프 후기(0)</h3></div>
            
        <div id="camp_review">
     
            <div class="review_list">
                <h4 class="memberName">user01 &nbsp; ⭐️⭐️⭐️</h4>
                <div id="reviewUpdate">
                    <button class="btn-sm btn-outline-light text-dark">수정</button>
                    <button class="btn-sm btn-outline-light text-dark">삭제</button></div>
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
                <div id="reviewUpdate">
                    <button class="btn-sm btn-outline-light text-dark">수정</button>
                    <button class="btn-sm btn-outline-light text-dark">삭제</button></div>
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
                <div id="reviewUpdate">
                    <button class="btn-sm btn-outline-light text-dark">수정</button>
                    <button class="btn-sm btn-outline-light text-dark">삭제</button></div>
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



        
            <div class="paging-area" align="center";>
                <button class="btn btn-sm"><</button>
                <button class="btn btn-sm">1</button>
                <button class="btn btn-sm">2</button>
                <button class="btn btn-sm">3</button>
                <button class="btn btn-sm">4</button>
                <button class="btn btn-sm">5</button>
                <button class="btn btn-sm">></button>
            </div>
            

    </div>
  </div>
    
    
	<jsp:include page="../common/footer.jsp"/>	
    
</body>
</html>