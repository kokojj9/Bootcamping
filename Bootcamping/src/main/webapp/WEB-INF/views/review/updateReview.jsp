<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>

</head>

<style>
    div{
        box-sizing : border-box;
    }

    #content{
        width: 1200px;
        height: 1200px;
        margin: auto;
    }

    #content_1 {
        width: 100%;
        height: 5%;
    }

    #content_2{
        width: 100%;
        height: 20%;
    }

    #reser_hotel_img {
        width: 30%;
        height: 100%;
        float: left;
        padding-left : 100px;
    }
   
    #reser_detail{
        width: 50%;
        height: 100%;
        float: left;
        padding-left : 30px;
    }
    
    #reser_detail > p {
    	padding-top : 10px;
    }

    #content_3{
        width: 100%;
        height: 10%;
    }

    #content_4{
        width: 100%;
        height: 60%;
    }

    #content_5 {
        width: 100%;
        height: 5%;
    }

    .star-rating{
        text-align: center;
        font-size: 50px;
    }

    #review{
        text-align: center;
        height: 75%;
    }

    #review > #reviewMessage{
        font-size: 20px;
        border-radius: 15px;
        border: none;
        background-color: gainsboro;
        padding-left: 10px;
        padding-top: 5px;
    }

    #reviewMessage ::placeholder{
        color: #9c9c9c;
    }


    #imgUpload{
        width: 90%;
        height: 25%;
        margin: auto;
    }

    #reivewImgUpload{
        height: 120px;
        width : 120px;
    }

    #file-area{
        padding-top: 10px;
        padding-left: 80px;
    }

    #submitReview {
        width: 300px;
        height: 50px;
        font-size: 20px;
        background-color:rgb(22, 160, 133);
        margin-top: 10px;
    }

    .input-file-button{
        padding: 6px 25px;
        background-color:#9c9c9c;
        border-radius: 4px;
        color: white;
    }

    .star-rating > input[type=radio]{
        display: none;
    }

    label {
        color: gainsboro;
    }

    #reser_hotel_img {
        text-align: center;
    }

    #reser_hotel_img >img {
        border-radius: 15px;
    }

    #countWrite {
        width: 25%;
        float: right;
    }

    #content_1 > h4 a{
        text-decoration: none;
        color: black;
    }

</style>
<body>

	<jsp:include page="../common/header.jsp"/>	
	
	<br>
    <div id="content">

        <div id="content_1">
            <h4><a href="#">◁</a>&nbsp;리뷰 수정하기</h4>
        </div>

        <div id="content_2">

                <div id="reser_hotel_img"><img src="${review.campImg }" width="220px" height="220px" /></div>

                <div id="reser_detail">
                    <h3>${review.campName }</h3>
                    <p>${review.siteName }</p>
                    <p>${review.people }인</p>
                    <p>${review.price }원</p>
                    <p>${review.checkInDate } ~ ${review.checkOutDate }</p>
                </div>
        </div>


        <div id="content_3">
        
        <form action="update.review" method="post" enctype="multipart/form-data">
        
        <input type="hidden" name="reservationNo" value="${review.reservationNo }"/>
        <input type="hidden" name="memberNo" value="${sessionScope.loginMember.memberNo }" />
                <div class="star-rating">
	                <input type="radio" value="1" id="rate1" name="reviewScore"><label
	                    for="rate1">★</label>
	                <input type="radio" value="2" id="rate2" name="reviewScore"><label
	                    for="rate2">★</label>
	                <input type="radio" value="3" id="rate3" name="reviewScore"><label
	                    for="rate3">★</label>
	                <input type="radio" value="4" id="rate4" name="reviewScore"><label
	                    for="rate4">★</label>
	                <input type="radio" value="5" id="rate5" name="reviewScore"><label
	                    for="rate5">★</label>
                </div>
        </div>

        <div id="content_4">
 
            <div id="review">
                <textarea id="reviewMessage" name="reviewContent" cols="100" rows="15" style="resize: none;" maxlength="600" placeholder="내용을 입력해주세요." required>${review.reviewContent }</textarea>
                <br>
                <div id="countWrite"><span id="count">0</span> /600</div>
            </div>

            <div id="imgUpload">
                <div id="file-area">
                    <label class="input-file-button" for="input-file">
                        업로드
                      </label>
                      <input type="file" id="input-file" style="display: none;" name="reUpfile"/>
                </div>
            </div>           

        </div>

        <div id="content_5" align="center">
            <button id="submitReview" type="submit" class="btn btn-success">등록하기</button>
        </div>


        </form>

    </div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>	
	

    
    <script>
        $(function(){

            $('#reviewMessage').keyup(function(){

                console.log($(this).val().length);
                $('#count').text($(this).val().length);

            });

        })

        $(function(){
            $('input[type="radio"]').click(function(){
                var index = $(this).index('input[type="radio"]');
                var $labels = $(this).parent().find('label');
                
                $labels.css('color', '');
                
                $labels.slice(0, index + 1).css('color', '#ffc400');
            });
        });

    </script>
    
</body>
</html>