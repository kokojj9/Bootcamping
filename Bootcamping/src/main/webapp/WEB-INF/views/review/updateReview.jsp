<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
    }

    #reser_detail{
        width: 50%;
        height: 100%;
        float: left;
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
        padding-left: 20px;
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
        width: 20%;
        float: right;
    }

    #content_1 > h3 a{
        text-decoration: none;
        color: black;
    }

</style>
<body>

	<jsp:include page="../common/header.jsp"/>	
	
	<br><br>

    <div id="content">

        <div id="content_1">
            <h3><a href="#">◁</a>&nbsp;리뷰 수정하기</h3>
        </div>

        <div id="content_2">

                <div id="reser_hotel_img"><img src="gg.png" width="220px" height="220px" /></div>

                <div id="reser_detail">
                    <h3>보물나라캠프</h3>
                    <p>어쩌고사이트</p>
                    <p>2인</p>
                    <p>117,000원</p>
                    <p>2024-05-05 ~ 2024-05-06</p>
                </div>
        </div>


        <div id="content_3">
        <form enctype="multipart/form-data">
                <div class="star-rating">
                    <input type="radio" value="1" id="rate1"><label
                    for="rate1">★</label>
                <input type="radio" value="2" id="rate2"><label
                    for="rate2">★</label>
                <input type="radio" value="3" id="rate3"><label
                    for="rate3">★</label>
                <input type="radio" value="4" id="rate4"><label
                    for="rate4">★</label>
                <input type="radio" value="5" id="rate5"><label
                    for="rate5">★</label>
                </div>
        </div>

        <div id="content_4">
 
            <div id="review">
                <textarea id="reviewMessage" cols="100" rows="15" style="resize: none;" maxlength="600" placeholder="내용을 입력해주세요."></textarea>
                <br>
                <div id="countWrite"><span id="count">0</span> /600</div>
            </div>

            <div id="imgUpload">
                <div id="reivewImgUpload" style="display:inline-block; margin-left:19px;">
                    <img width="250" id="sub-img3" height="180" src="" alt="상세이미지3">
                </div>
                <div id="file-area">
                    <label class="input-file-button" for="input-file">
                        업로드
                      </label>
                      <input type="file" id="input-file" style="display: none;"/>
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