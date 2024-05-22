let searchPwdSubmit = document.getElementById('searchPwd');

        document.getElementById('checkEmailBtn').onclick = () => {
            if(document.getElementById('email').value == ''){
                alert('이메일을 입력해주세요!');
            }
            else{
                $.ajax({
                    url : 'searchPwdMail',
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
                                    searchPwdSubmit.disabled = true;
                                }
                            }, 1000);
                        }
                        else {
                            alert('인증번호발급에 실패하였습니다. 이메일을 확인해주세요');
                        }
                    }
                });
            }
        };

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
                        searchPwdSubmit.disabled = false;
                    }
                    else{
                        document.getElementById('email').setAttribute('readonly', false);
                        document.getElementById('timer').textContent = '인증에 실패하였습니다. 다시 입력해주세요';
                        document.getElementById('timer').style.color = 'crimson';
                    }
                }
            });
        };