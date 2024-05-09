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

            <form action="members" method="post">
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
                    <input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email"> <br>

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
        // 주소입력 API
        var themeObj = {
            searchBgColor: "#1DC078", //검색창 배경색
            queryTextColor: "#FFFFFF" //검색창 글자색
        };
        
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                theme: themeObj,
                oncomplete: function(data) {
                    
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
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
                                checkId('block', 'crimson', '사용할 수 없는 아이디입니다.(아이디 중복)', true)
                            } else {
                                checkId('block', 'green', '사용 가능한 아이디입니다.', false)
                            };
                        }
                    });
                };
            }
            else {
                checkId('block', 'crimson', '영문/숫자만 입력', true)
            };
        };
        
        // 비밀번호 정규표현식
        // 영문 /숫자/ 특문 8~16자리 제한 / not null
        memberPwdtag.onkeyup = () => {
            let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]+$/;
            // 중복 코드 줄이기
            if(regExp.test(memberPwdtag.value)){
                checkPwdResult.style.display = 'block';
                checkPwdResult.style.color = 'green';
                checkPwdResult.textContent = '사용가능한 비밀번호입니다.';
            }
            else {
                checkPwdResult.style.display = 'block';
                checkPwdResult.style.color = 'crimson';
                checkPwdResult.textContent = '영문 / 숫자 / 특수문자를 포함해야합니다.';
            }
        };
        
        const checkId = (display, color, text, click) => {
            checkIdResult.style.display = display;
            enrollFormSubmit.disabled = click;
            checkIdResult.style.color = color;
            checkIdResult.textContent = text;
        };

        //전화번호

        // 확인 메일 발송

        // submit


    </script>



</body>
</html>