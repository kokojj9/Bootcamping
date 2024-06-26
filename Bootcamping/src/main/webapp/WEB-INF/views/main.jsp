<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑</title>

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

    #content > div {width: 100%;}

    #content_1 {height: 50%;}

    #content_2 {height: 15%;}

    #content_3 {height: 35%;}


    #content_title{
        padding-top: 23%;
        padding-left: 25%;
    }


    #search_form {
        position: relative;
        width: 100%x;
        height: 100%;
        background-image: url("resources/img/backgroundImg.jpg");
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
    }
    
    #submit_btn{
        width: 70px;
        height: 50px;
        border-radius: 5px;
        border: 1px solid;
        color: rgb(103, 103, 103);
        background-color: white;
    }

    .color_yellow {
       margin-left: 100px;
        margin-top: 30px;
        width: 100px;
        height: 100px;
        border: none;
        border-radius: 50px;
        background-color: #ffeda7;
        color: rgb(213 172 10);
        font-size: 20px;
    }
    .color_green {
       margin-left: 100px;
        margin-top: 30px;
        width: 100px;
        height: 100px;
        border: none;
        border-radius: 50px;
        background-color: #c7ffb1;
        color: rgb(46, 204, 113);
        font-size: 20px;
    }
    
    #content3_title{
        height: 8%;
        padding-left: 7%;
        font-weight: 700;
        float: left;
    }

    
    #all{
        float: right;
        padding-top: 10px;
        padding-right: 80px;
    }

    #all a {
        text-decoration: none;
        color: black;
    }

    .items{
      width : 100%;
      height: 90%;
      margin : auto;
      display : flex;
      justify-content: center;
      flex-wrap : wrap;
      gap : 70px;
      
   }
   
   .items .card{
      width : 300px;
      height : 350px;
      border: none;
   }
   
   .card-body{
    height: 100px;
    color : black;
   }

   .card-img-top{
    border-radius: 5%;
   }

   .card  a > h4{
    text-decoration: none;
    color: black;
   }

   .card  a > h5{
    color: black;
   }

   .card a, 	#content_2 > a  {
    text-decoration: none;
   }


</style>

<body>

	<jsp:include page="common/header.jsp"/>
	<br>
	<div id="content">

        <div id="content_1">
            <div id="search_form">
                <div id="content_title">                
                    <h2>캠핑장을 찾고 계신가요?</h2>
                </div>
                <div id="search_1">
                        <input type="text" placeholder="캠핑장 이름을 입력해주세요!" id="keyword">
                        <input type="button" value="검색" id="submit_btn">
                </div>
                
            </div>
        </div>

        <div id="content_2">
            <a href="/bootcamping/camping"><button class="color_green">전체</button></a>
            <button class="color_yellow">글램핑</button>
            <button class="color_green">카라반</button>
            <button class="color_yellow">일반</button>
            <button class="color_green">자동차</button>
        </div>

        <div id="content_3">
            <h4 id="content3_title">추천 캠핑장</h4>

            <div id="all"><a href="/bootcamping/camping">전체보기></a></div>

             <div class="items" style="padding:50px;">
   
 
 
 
 

           </div>
          </div>
                    
  
	<br>
	<jsp:include page="common/footer.jsp"/>
	
	<script>
		
		$(() => {
			
			$.ajax({
				
				url : 'camping/mainCamping',
				type : 'get',
				success : result => {
					console.log(result);
					
					let str = '';
					
					for(let i = 0; i < result.data.length; i++) {
						
						str += '<div class="card" style="width:250px;">'
							 + '<a style="text-decoration:none;" href="/bootcamping/detailCamping?contentId='+ result.data[i].campNo +'">'
                        	 + '<img class="card-img-top" src="' + result.data[i].campImg + '">'
                        	 + '<div class="card-body">'
		                     + '<h5 class="card-text">'+ result.data[i].campName +'</h5>'
                        	 + '<h4 class="card-text">'+ result.data[i].address +'</h4>'
			                 + '<p>'+ result.data[i].type +'</p>'
                        	 + '</div>'
                        	 + '</a>'
	                    	 + '</div>'
					}
					
					$('.items').html(str);
					
				}
			})
			
		})
		
		
		$(() => {
			
			$('#submit_btn').click(() => {
				
				$.ajax({
					url : '/bootcamping/camping/searchCamping',
					data : {keyword : $('#keyword').val()},
					success : result => {
						console.log(result);
					}
					
				})
				
			})
			
		})
	
	</script>

</body>
</html>