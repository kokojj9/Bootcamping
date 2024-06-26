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
                url : '/bootcamping/members/check-id/' + memberIdTag.value,
                type : 'GET',
                success : result => {
                    if (result.responseCode === 'YY') {
                        checkInfo('id', 'green', result.resultMessage)
                    } else {
                        checkInfo('id' , 'crimson', result.resultMessage)
                    };
                },
                error: (request, status) => {
                    if (status === 400) {
                        alert('잘못된 요청입니다.');
                    } else if (status === 500) {
                        alert('서버 오류입니다. 잠시 후 다시 시도해 주십시오');
                    }
                }
            });
        };
    }
    else {
        checkInfo('id', 'crimson', '영문/숫자만 입력')
    };
};

let countdown;

// 이메일 인증
document.getElementById('checkEmailBtn').onclick = () => {
    if(document.getElementById('email').value == ''){
        alert('이메일을 입력해주세요!');
    }
    else{
        const data = {
            email : document.getElementById('email').value
        };

        $.ajax({
            url : 'mail',
            type : 'post',
            contentType: 'application/json; charset=UTF-8',
            data: JSON.stringify(data),
            success : result => {
                if(result.responseCode === 'YY'){
                    document.getElementById('checkAuthCode').style.display = 'block';
                    document.getElementById('email').setAttribute('readonly', true);
                    document.getElementById('authCode').style.display = 'block';
                    document.getElementById('checkAuthCode').disabled = false;

                    alert(result.resultMessage);

                    var totalTime = 180;

                    countdown = setInterval(() => {
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
                        }
                    }, 1000);
                }
                else {
                    alert(result.resultMessage);
                }
            },
            error: (request, status) => {
                if (status === 400) {
                    alert('잘못된 요청입니다.');
                } else if (status === 500) {
                    alert('서버 오류입니다. 잠시 후 다시 시도해 주십시오');
                }
            }
        });
    }
};
// 코드 인증
document.getElementById('checkAuthCode').onclick = () => {
    const data = {
        email : document.getElementById('email').value,
        authCode : document.getElementById('authCode').value
    };
    
    $.ajax({
        url : 'mail',
        type : 'get',
        data: data,
        success : result => {
            if(result.responseCode === 'YY'){
                clearInterval(countdown);
                document.getElementById('timer').style.color = '#1dc078';
                enrollFormSubmit.disabled = false;
            }
            else{
                document.getElementById('email').setAttribute('readonly', false);
                document.getElementById('timer').style.color = 'crimson';
            }
            
            document.getElementById('timer').textContent = result.resultMessage;
        },
        error: (request, status) => {
            if (status === 400) {
                alert('잘못된 요청입니다.');
            } else if (status === 500) {
                alert('서버 오류입니다. 잠시 후 다시 시도해 주십시오');
            }
        }
    });
};

// 비밀번호 정규표현식
memberPwdtag.onkeyup = () => {
    let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]{8,}$/;

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