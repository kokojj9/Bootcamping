<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트캠핑 - 회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
        .content { 
            background-color: rgb(247, 245, 245);
            width: 1200px; 
            margin: auto;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 40%;
            margin: auto;
            padding: 3% 7%;
            background-color: white;
        }
        #postcode, #roadAddress{
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
        #postcode{
            width: 100px;
            margin-bottom: 5px;
        }
        #roadAddress{
            width: 310px;
        }
        #findAddressBtn, #checkEmailBtn, #checkAuthCode{
            width: 90px;
            height: 35px;
            background-color: #1dc078;
            color: #f6f6f6;
            border: 0;
            font-size: 16px;
            font-weight: 400;
            border-radius: .25rem;
        }
        #detailAddress{
            margin-top: 5px;
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
                    <label for="memberId">* 아이디 </label>											
                    <input type="text" class="form-control" id="memberId" placeholder="아이디(영문, 숫자, 최대 12자)" name="memberId" maxlength="12" required>
                    <div id="checkIdResult" style="font-size:12px; display:none;"></div><br>

                    <label for="memberPwd">* 비밀번호 </label>
                    <input type="password" class="form-control" id="memberPwd" placeholder="비밀번호(영문, 숫자, 특수문자 포함)" name="memberPwd" maxlength="16" required>
                    <div id="checkPwdResult" style="font-size:12px; display:none;"></div><br>

                    <label for="checkPwd">* 비밀번호 확인 </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호 확인" required>
                    <div id="overlapPwd" style="font-size:0.7em; display:none;"></div><br>

                    <label for="email">* 이메일 </label>
                    <button id="checkEmailBtn" type="button">메일 인증</button>
                    <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required> <br>
                    <input type="number" class="form-control" id="authCode" placeholder="인증코드를 입력해주세요" style="display: inline;  width: 200px; display:none;"> 
                    <button id="checkAuthCode" type="button" style="width: 150px; display:none;">인증번호 확인</button>
                    <h6 id="timer"></h6>

                    <label for="address"> &nbsp; 주소 </label> &nbsp;&nbsp;<br>
                    <input type="text" name="postcode" id="postcode" placeholder="우편번호">
                    <input type="button" id="findAddressBtn" onclick="execDaumPostcode()" value="주소 찾기"><br>
                    <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소">
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
    
    <script>
        
        let checkPwdResult = document.getElementById('checkPwdResult');
        let checkIdResult = document.getElementById('checkIdResult');
        let enrollFormSubmit = document.getElementById('joinBtn');
        let overlapPwdTag = document.getElementById('overlapPwd');
        let memberPwdtag = document.getElementById('memberPwd');
        let memberIdTag = document.getElementById('memberId');
        let checkPwd = document.getElementById('checkPwd');
        
        // 아이디 중복체크
        memberIdTag.onkeyup = () => {
            let regExp = /^[a-zA-Z0-9]+$/;

            if(regExp.test(memberIdTag.value)){
                checkIdResult.style.display = 'block';

                if(memberIdTag.value.length >= 5){
                    $.ajax({
                        url : 'members/' + memberIdTag.value,
                        type : 'GET',
                        success : result => {
                            if (result === '') {
                                checkInfo('id', 'green', '사용 가능한 아이디입니다.')
                            } else {
                                checkInfo('id' , 'crimson', '사용할 수 없는 아이디입니다.(아이디 중복)')
                            };
                        }
                    });
                };
            }
            else {
                checkInfo('id', 'crimson', '영문/숫자만 입력')
            };
        };

        // 이메일 인증
        document.getElementById('checkEmailBtn').onclick = () => {
            if(document.getElementById('email').value == ''){
                alert('이메일을 입력해주세요!');
            }
            else{
                $.ajax({
                    url : 'mail',
                    type : 'post',
                    data : {
                        email : document.getElementById('email').value 
                    },
                    success : result => {
                        console.log(result);
                        if(result === 'YYYYY'){
                            document.getElementById('checkAuthCode').style.display = 'block';
                            document.getElementById('email').setAttribute('readonly', true);
                            document.getElementById('authCode').style.display = 'block';
                            document.getElementById('checkAuthCode').disabled = false;

                            alert('인증번호가 발급되었습니다.');

                            var totalTime = 180;
        
                            let countdown = setInterval(() => {
                                document.getElementById('timer').style.color = 'black';
                                
                                if(totalTime > 0) {
                                    totalTime--;
                                    let minutes = Math.floor(totalTime / 60);
                                    let seconds = totalTime % 60;
                                    document.getElementById('timer').textContent = (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
                                }
                                else {
                                    clearInterval(countdown);
                                    document.getElementById('timer').textContent = '인증 시간이 끝났습니다';
                                    document.getElementById('timer').style.color = 'crimson';
                                    document.getElementById('checkAuthCode').disabled = true;
                                    enrollFormSubmit.disabled = true;
                                    totalTime = 180;
                                }
                            }, 1000);
                        }
                        else {
                            alert('인증번호발급에 실패하였습니다. 이메일을 확인해주세요');
                        }
                    },
                    error : e => {
                        console.log('먼데이게~');
                    }
                });
            }
        };
        // 코드 인증
        document.getElementById('checkAuthCode').onclick = () => {
            $.ajax({
                url : 'mail',
                type : 'get',
                data : {
                    email : document.getElementById('email').value,
                    authCode : document.getElementById('authCode').value
                },
                success : result => {
                    if(result == 'YYYYY'){
                        clearInterval(countdown);
                        document.getElementById('timer').textContent = '인증에 성공하였습니다.';
                        document.getElementById('timer').style.color = '#1dc078';
                        enrollFormSubmit.disabled = false;
                    }
                    else{
                        document.getElementById('email').setAttribute('readonly', false);
                        document.getElementById('timer').textContent = '인증에 실패하였습니다. 다시 입력해주세요';
                        document.getElementById('timer').style.color = 'crimson';
                    }
                }
            });
        };

        // 비밀번호 정규표현식
        memberPwdtag.onkeyup = () => {
            let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]+$/;

            if(regExp.test(memberPwdtag.value)) checkInfo('password', 'green', '사용가능한 비밀번호입니다.')
            else checkInfo('password', 'crimson', '영문 / 숫자 / 특수문자를 포함해야합니다.')
        };

        // 비밀번호 확인
        checkPwd.onkeyup = () => {
            if(memberPwdtag.value == checkPwd.value) checkInfo('overlapPwd', 'green', '비밀번호 확인')
            else checkInfo('overlapPwd', 'crimson', '비밀번호 불일치')
        };
        
        // 정규표현식에 맞지않으면 경고문구 표시
        const checkInfo = (type, color, text) => {
            let checkItem =  type == 'id' ? checkIdResult : type == 'password' ? checkPwdResult : overlapPwdTag;
            
            checkItem.style.display = 'block';
            checkItem.style.color = color;
            checkItem.textContent = text;
        };

        // 주소API
        var themeObj = {
            searchBgColor: "#1DC078",
            queryTextColor: "#FFFFFF"
        };
        
        function execDaumPostcode() {
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

                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;

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


    </script>



</body>
</html>