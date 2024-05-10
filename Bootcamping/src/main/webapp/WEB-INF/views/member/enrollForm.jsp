<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .content { 
            background-color: rgb(247, 245, 245);
            width: 1200px; 
            margin: auto;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 60%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }
        #sample4_postcode, #sample4_roadAddress{
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            height: calc(1.5em + .75rem + 2px);
            padding: .375rem .75rem;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
        }
        #sample4_postcode{
            width: 100px;
            margin-bottom: 5px;
        }
        #sample4_roadAddress{
            width: 373px;
        }
        #findAddressBtn{
            width: 90px;
            height: 30px;
            background-color: #1dc078;
            color: #f6f6f6;
            border: 0;
            font-size: 16px;
            font-weight: 400;
            border-radius: .25rem;
        }
    </style>

</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>부트캠핑 - 회원가입</h2>
            <br>

            <form id="insertForm" action="members" method="post">
                <div class="form-group">
                    <label for="memberId">* 아이디 </label>											<!-- userId == setUserId(value값) -->
                    <input type="text" class="form-control" id="memberId" placeholder="아이디를 입력해주세요" name="memberId" maxlength="12" required> <br>
                    <div id="checkIdResult" style="font-size:0.7em; display:none;"></div>

                    <label for="memberPwd">* 비밀번호 </label>
                    <input type="password" class="form-control" id="memberPwd" placeholder="비밀번호를 입력해주세요" name="memberPwd" maxlength="16" required> <br>
                    <div id="checkPwdResult" style="font-size:0.7em; display:none;"></div>

                    <label for="checkPwd">* 비밀번호 확인 </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호 확인" required> <br>

                    <label for="email"> &nbsp; 이메일 </label>
                    <button id="checkEmailBtn">메일 인증</button>
                    <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email"> <br>
                    <input type="text" class="form-control" id="authCode" placeholder="인증코드를 입력해주세요" hidden> <br>

                    <label for="phone"> &nbsp; 전화번호 </label>
                    <input type="tel" class="form-control" id="phone" placeholder="전화번호를 입력해주세요 (-없이)" name="phone"> <br>
                    
                    <label for="address"> &nbsp; 주소 </label> &nbsp;&nbsp;
                    <input type="button" id="findAddressBtn" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
                    <input type="text" id="sample4_postcode" placeholder="우편번호">
                    <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소">
                </div> 
                <br>
                <div class="btns" align="center">
                    <button id="joinBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
        var themeObj = {
            searchBgColor: "#1DC078",
            queryTextColor: "#FFFFFF"
        };
        
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                theme: themeObj,
                oncomplete: function(data) {
                    
                    var roadAddr = data.roadAddress;
                    var extraRoadAddr = '';

                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                   
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                   
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;

                    var guideTextBox = document.getElementById("guide");
                   
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }

        // 아이디 중복체크
        let memberIdTag = document.getElementById('memberId');
        let memberPwdtag = document.getElementById('memberPwd');
        let checkIdResult = document.getElementById('checkIdResult');
        let checkPwdResult = document.getElementById('checkPwdResult');
        let enrollFormSubmit = document.getElementById('joinBtn');
        
        memberIdTag.onkeyup = () => {
            let regExp = /^[a-zA-Z0-9]+$/;

            if(regExp.test(memberIdTag.value)){
                checkIdResult.style.display = 'none';

                if(memberIdTag.value.length >= 5){
                    $.ajax({
                        url : 'members/' + memberIdTag.value,
                        type : 'GET',
                        success : result => {
                            let resultSubstring = result.substr(4);

                            if (resultSubstring === 'N') {
                                checkInfo('id' , 'crimson', '사용할 수 없는 아이디입니다.(아이디 중복)', true)
                            } else {
                                checkInfo('id', 'green', '사용 가능한 아이디입니다.', false)
                            };
                        }
                    });
                };
            }
            else {
                checkInfo('id', 'crimson', '영문/숫자만 입력', true)
            };
        };
        
        // 비밀번호 정규표현식
        memberPwdtag.onkeyup = () => {
            let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]+$/;

            if(regExp.test(memberPwdtag.value)){
                checkInfo('password', 'green', '사용가능한 비밀번호입니다.')
            }
            else {
                checkInfo('password', 'crimson', '영문 / 숫자 / 특수문자를 포함해야합니다.')
            };
        };
        
        // 정규표현식에 맞지않으면 경고문구 표시
        const checkInfo = (type, color, text, message) => {
            let checkItem =  type == 'id' ? checkIdResult : checkPwdResult;
            
            enrollFormSubmit.disabled = message;
            checkItem.style.display = 'block';
            checkItem.style.color = color;
            checkItem.textContent = text;
        };

        // 전화번호

        // 이메일 인증
        document.getElementById('checkEmailBtn').onclick = () => {
        	// 코드발송 ajax
        	$.ajax({
        		url : 'mail',
        		type : 'get',
        		data : {
        			email : document.getElementById('email').value 
        		},
        		success : result => {
		        	// 결과에 따라 인증성공,실패
        			
        		}
        	});
        };
		
        // submit
		enrollFormSubmit.onclick = () => {
			document.getElementById('insertForm').submit();
		}

    </script>



</body>
</html>