<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>footer</title>

<style>
    
    div{
        box-sizing : border-box;
    }

    #footer{
            border-top: 1px solid lightgray;    
            width: 1200px;
            height: 170px;
            margin: auto;
        }
    
    #footer > div {width: 100%;}

    #footer_1{
        height: 25%;
        padding-top : 15px;
    }

    #footer_2{
        height: 75%;
    }

    #info{
        width: 70%; 
        height: 100%; 
        float: left;        
        padding-left: 60px;
        padding-top: 25px;
    }

    #footer_logo{
    	width: 30%; 
    	height: 100%; 
    	float: left;
    }
    
    #footer_1 > a{
        text-decoration: none;
        color: black;
        padding-left: 60px;
        font-weight: 700; 
    }

    #footer_logo {
        text-align: center; 
        font-weight: 700; 
        font-size: 20px; 
        color: lightgrey;
    }
    
    #footer_logo img {
        padding-top: 40px;
        margin: 0px;
        width : 200px;
    }



</style>
</head>
<body>
    
    <div id="footer">

        <div id="footer_1">
            <a href="#">회사소개</a>&ensp;&ensp;&ensp;&ensp;
            <a href="#">이용약관</a> &ensp;&ensp;&ensp;&ensp;

            <a href="#">개인정보처리방침</a> 
        </div>
            
        <div id="footer_2">


            <div id="info">
                <p>
                    주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F <br>
                    대표이사 : 박쟁니 | 책임자 : 박쟁니 ｜  개인정보관리책임자 : 박쟁니 <br>
                    전자우편주소 : help@bootcamping.kr | 전화번호 : 1544-9970
                </p>
            </div>

            <div id="footer_logo">
                 <img src="https://kh-academy.co.kr/resources/images/main/logo.svg" alt="">
            </div>
        </div>

    </div>
    
</body>
</html>