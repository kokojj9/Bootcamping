let checkPwdResult = document.getElementById('checkPwdResult');
let memberPwdtag = document.getElementById('memberPwd');
let changePwdType = document.getElementById('pwdType').value;

document.getElementById('checkPwdBtn').onclick = () => {
    const data = {
        memberId : loginMemberId,
        memberPwd : document.getElementById('checkPwd').value
    };

    $.ajax({
        url : 'members/edit-password',
        type : 'post',
        contentType: 'application/json; charset=UTF-8',
        data : JSON.stringify(data),
        success : result => {
            if(result.responseCode === 'YY') {
                memberPwdtag.style.display = 'block';
                changePwdType = 'Y';
            }
            else {
                alert('비밀번호를 확인해주세요!');
                memberPwdtag.style.display = 'none';
                changePwdType = 'N';
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

document.getElementById('editBtn').onclick = () => {
    $.ajax({
        url : 'members/edit',
        type : 'post',
        data : {
            memberId : loginMemberId,
            memberPwd : memberPwdtag.value,
            email : document.getElementById('email').value,
            postCode : document.getElementById('postcode').value,
            roadAddress : document.getElementById('roadAddress').value,
            detailAddress : document.getElementById('detailAddress').value,
            changePwdType : changePwdType
        },
        success : result => {
            if(result === 'YY') {
                alert('정보 수정 완료'); 
                location.href = 'editForm';
            }
            else {
                alert('정보 수정 실패');
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
};

memberPwdtag.onkeyup = () => {
    if(memberPwdtag.style.display = 'block'){
        let regExp = /^(?=.+[a-zA-Z])(?=.+\d)(?=.+[!@#$%^&*])[\w!@#$%^&*]{8,}$/;
        
        if(regExp.test(memberPwdtag.value)) checkInfo(false, 'green', '사용가능한 비밀번호입니다.');
        else checkInfo(true, 'crimson', '영문 / 숫자 / 특수문자를 포함해야합니다.');
    };
};

const checkInfo = (type, color, text) => {
    checkPwdResult.style.display = 'block';
    checkPwdResult.style.color = color;
    checkPwdResult.textContent = text;
    document.getElementById('editBtn').disabled = type;
};

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