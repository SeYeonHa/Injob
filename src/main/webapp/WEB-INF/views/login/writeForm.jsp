<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/png" href="img/logo.png" />
<link rel="stylesheet" href="css/common.css" />
<link href="css/start.css" rel="stylesheet" />
<link href="css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style>
* {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}

.nanum-gothic-extrabold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 800;
	font-style: normal;
}

ul li {
	list-style: none;
	margin: 0;
	padding: 0
}

.gradient-custom {
	background: #f8f8f8;
}

.login-tab {
	width: 100%;
	margin-bottom: 20px;
}

#devMemTab {
	display: flex;
	margin: 0;
	padding: 0;
}

#devMemTab li {
	width: 50%;
}

.login-tab li a {
	text-decoration: none;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 48px;
	box-sizing: border-box;
	border: 1px solid #e8e8e8;
	border-bottom-color: #222;
}

.login-tab li:first-child a {
	border-top-left-radius: 10px;
}

.login-tab li:last-child a {
	border-top-right-radius: 10px;
}

.login-tab .on a {
	background-color: #fff;
	border: 1px solid;
	border-color: #222 #222 #fff;
	color: #222;
	font-weight: 600;
}

.login-tab .on a, .login-tab li a {
	text-align: center;
	font-size: 16px;
	letter-spacing: 0;
	line-height: 24px;
}

.section_kakao .btn_signup_kakao {
	box-sizing: border-box;
	display: block;
	width: 296px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: none;
	border-radius: 8px;
	background: #FEE500;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	font-size: 16px;
	font-weight: bold;
	color: #191919;
	position: relative;
	margin-top: 16px;
}
.section_naver .btn_signup_naver {
	box-sizing: border-box;
	display: block;
	width: 296px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: none;
	border-radius: 8px;
	background: #02c659;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	font-size: 16px;
	font-weight: bold;
	color: #191919;
	position: relative;
	margin-top: 16px;
}

.section_google .btn_signup_google {
	margin-top: 20px;
	box-sizing: border-box;
	display: block;
	width: 296px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: none;
	border-radius: 8px;
	background: #e8e8e8;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	font-size: 16px;
	font-weight: bold;
	color: #f6f7f9;
	position: relative;
	margin-top: 16px;
}

.etcor {
	height: 1px;
	background: #E5E6E9;
	margin-top: 20px;
	margin-bottom: 10px;
	display: block;
	padding: 0;
	font-size: 14px;
	color: #000;
	text-align: center;
	overflow: hidden;
}

/* 버튼의 부모 요소에 대한 스타일링 */
.section_kakao, .section_naver, .section_google {
    display: flex;
    align-content: center;
    justify-content: center;
    position: relative;
}

/* 이미지에 대한 스타일링 */
.section_kakao img, .section_naver img, .section_google img {
    width: 20px; /* 이미지의 너비 */
    height: 20px; /* 이미지의 높이 */
    margin-right: 8px; /* 이미지와 텍스트 사이의 간격 */
    position: absolute;
}
.section_kakao img{
	left: 15px;
    top: 14px;
}
.section_naver img{
	left: 15px;
    top: 14px;
}
.section_google img{
	left: 15px;
    top: 14px;
}
.section_kakao span, .section_naver span, .section_google span {
	
	color: #222;
}
.section_naver span{
color: white;
}
.submit{
	margin-top: 20px;
	box-sizing: border-box;
	display: block;
	width: 100%;
	height: 48px;
	line-height: 48px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: none;
	border-radius: 8px;
	background: #f6f7f9;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	font-size: 16px;
	font-weight: bold;
	color: #222;
	position: relative;
	margin-top: 16px;
	margin-bottom: 10px
}

</style>
</head>
<body class="gradient-custom">
	<section class="d-flex vh-100">
		<div
			class="container-fluid row justify-content-center align-content-center">
			<div class="card bg-white" style="border-radius: 1rem;">
				<section class="login-tab">
					<ul id="devMemTab">
						<li class="on" role="tab" data-tab="tab1"><a href="#"
							data-m-type="M">개인회원</a></li>
						<li role="tab" data-tab="tab2" class=""><a href="#"
							data-m-type="Co">기업회원</a></li>
					</ul>
				</section>
				<div class="card-body p-5">
				
					

					<div class="etcor"></div>

					<div class="mb-2">
						<form action="/write" method="POST">
							<div class="mb-3">
								<label class="form-label">Email address</label> 
								<input type="email" class="form-control" name="user_email">
							</div>
							<div class="mb-3">
								<label class="form-label ">Password</label> <input
									type="password" class="form-control" name="user_passwd">
							</div>
						
							
							<button class="submit" type="submit" class="btn btn-primary">기존 회원 로그인</button>
						</form>
						
						
						
			            
						<!-- <button type="button" id ="loginForm" class="btn btn-secondary mt-3"> 회원가입</button> -->
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	
	         const logBtnEl = document.querySelector('#loginForm');
	        logBtnEl.addEventListener('click', () => {
	        	console.log("~~~~~~~~");
	        	console.log("~~~~~~~~");
	        	console.log("~~~~~~~~");
	        	window.location.href = '/signup';
	        })
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일 경우 조합형 주소 조합
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형 주소가 있을 경우 마지막에 붙여줌
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합형 주소를 최종 주소에 추가
                    fullAddr += extraAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 입력
                document.getElementsByName('user_zipcode')[0].value = data.zonecode; // 우편번호
                document.getElementsByName('user_address')[0].value = fullAddr; // 주소

                // 커서를 상세주소 필드로 이동
                document.getElementsByName('user_address')[0].focus();
            }
        }).open();
    }
</script>
</body>
</html>






