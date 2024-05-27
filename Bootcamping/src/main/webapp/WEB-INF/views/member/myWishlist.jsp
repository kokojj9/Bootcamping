<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 즐겨찾기</title>
    <style>
        #wrap{
            margin: 5% auto 5%;
            width: 1000px;
        }
        .title{
            margin: 5px auto 50px;
            width: fit-content;
            font-size: 32px;
            font-weight: 400;
        }
        #pagingArea {
            width:fit-content; 
            margin:auto;
        }
    </style>

</head>
<body>
	    
    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div class="title">
            <div class="">즐겨찾는 캠핑장</div>
        </div>

        
    </div>


    <jsp:include page="../common/footer.jsp"/>

</body>
</html>