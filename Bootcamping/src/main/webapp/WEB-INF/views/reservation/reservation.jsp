<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>숙소이용목록상세조회</title>
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
        height: 1000px;
        margin: auto;
    }
    
    /*********************/

    #reser_title, #detail{width: 100%;}

    #reser_title{height: 10%;}
    
    #reser_title > h3 {
        margin-top: 35px;
        margin-left: 70px;
    }

    #reser_title > h3 > a{
        text-decoration: none;
        color: black;
    }

    #detail{height: 90%;}
    
    #reser_info{
        width: 100%;
        height: 30%;
    }

    #price_info{
        width: 100%;
        height: 70%;

    }

    #reser_hotel_img {
        width: 30%;
        height: 100%;
        float: left;
        padding-top: 10px;
    }

    #reser_hotel_img > img {
        margin-left: 90px;
        border-radius: 10px;
    }


    #reser_detail{
        width: 70%;
        height: 100%;
        float: left;
        padding-top: 10px;
    }

    #reser_detail > p{
        padding-top: 20px;
        font-size : 20px;
    }

    #rser_select{
        width: 100%;
        height: 50%;
        padding-left: 90px;
        padding-top: 20px;
    }

    #reservation_name{
        float: left;
        width: 40%;
    }

    
    #rser_select  p{
        font-size: 20px;
        font-weight: 700;
    }

    input[type=text]{
        width: 250px;
        height: 50px;
    }
    
    #reser_price_info{
        width: 100%;
        height: 20%;
        padding-left: 90px;
        padding-top: 20px;
    }

    #reser_price_info > h3{
        padding-bottom: 10px;
    }

    #reser_payment {
        width: 50%;
        height: 30%;
        padding-top: 30px;
        margin: auto;
    }

    #reser_payment > button{
        width: 600px;
        height: 80px;
        border-radius: 20px;
        font-size: 25px;
        font-weight: 700;
        background-color: rgb(22, 160, 133);
    }

    .radio_box> h4{
        font-size: 20px;
    }

    .radio_box { display: inline-block; *display: inline; *zoom: 1; position: relative; padding-left: 25px; margin-right: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

    /* 기본 라디오 버튼 숨기기 */
    .radio_box input[type="radio"] { display: none; }

    /* 선택되지 않은 라디오 버튼 스타일 꾸미기 */
    .on { width: 20px; height: 20px; background: #ddd; border-radius: 50%; position: absolute; top: 0; left: 0; }

    /* 선택된 라디오 버튼 스타일 꾸미기 */
    .radio_box input[type="radio"]:checked + .on { background: #f86480; }
    .on:after { content: ""; position: absolute; display: none; }
    .radio_box input[type="radio"]:checked + .on:after { display: block; }
    .on:after { width: 10px; height: 10px; background: #fff; border-radius: 50%; position: absolute; left: 5px; top: 5px; }





</style>


</head>
<body>


	<jsp:include page="../common/header.jsp"/>	
               
    <div id="content">
            <div id="reser_title"><h3><a href="/bootcamping/camping/detail?contentId=${reserSite.campNo}">◁</a>&nbsp;예약 및 결제</h3></div>
        <div id="detail">
            <div id="reser_info">

                <div id="reser_hotel_img"><img src="${reserSite.campImg }" width="220px" height="220px"></div>

                <div id="reser_detail">
                    <h3>${reserSite.campName } (${reserSite.siteName })</h3>
                    <p>2인</p>
                    <p>117,000원</p>
                    <p>2024-05-05 ~ 2024-05-06</p>
                </div>
            </div>
        

            <div id="price_info">

            
                <div id="rser_select">
                    <h3>예약자 정보</h3> <br>
				<form action="#" method="post">
                    <div id="reservation_name">
                        <p>예약자 이름</p> 
                        <input type="text" required placeholder="이름을 입력해주세요"><br><br>
                    </div>

                    <div id="reservation_phone">
                        <p>전화번호</p>
                        <input type="text" required placeholder="-를 제외하고 입력해주세요"> <br><br>
                    </div>
                </div>

                <div id="reser_price_info">
                    <h3>결제수단</h3>
                        <label for="agree1" class="radio_box">
                            <input type="radio" id="agree1" name="agree" value="신용카드" checked="checked" />
                            <span class="on"></span>
                            <h4>신용카드</h4>
                        </label>
                </div>

                <div id="reser_payment">
                    <button class="btn btn-success">117,000원 결제하기</button>
                </div>
                
                </form>
            </div>
        </div>	


    </div>
	<br>
	<jsp:include page="../common/footer.jsp"/>
	

 

</body>
</html>