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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

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

.login-tab li button {
	text-decoration: none;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 48px;
	box-sizing: border-box;
	border: 1px solid #e8e8e8;
	border-bottom-color: #222;
	width: 100%;
}

.login-tab li:first-child button {
	border-top-left-radius: 10px;
}

.login-tab li:last-child button {
	border-top-right-radius: 10px;
}

.login-tab .on button {
	background-color: #fff;
	border: 1px solid;
	border-color: #222 #222 #fff;
	color: #222;
	font-weight: 600;
}

.login-tab .on button, .login-tab li button {
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

.section_kakao img {
	left: 15px;
	top: 14px;
}

.section_naver img {
	left: 15px;
	top: 14px;
}

.section_google img {
	left: 15px;
	top: 14px;
}

.section_kakao span, .section_naver span, .section_google span {
	color: #222;
}

.section_naver span {
	color: white;
}

.submit {
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

.log-update {
	display: flex;
	font-size: 0.8rem;
	justify-content: space-between;
}

.log-update .left {
	color: #888;
}

.log-update a {
	text-decoration: none;
	color: inherit;
}

.card .card-body {
	display: none;
}

.card .card-body.active {
	display: block;
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
						<li class="on" role="tab" data-tab="tab1"><button data-m-type ="M">개인회원</a></li>
						<li role="tab" data-tab="tab2" class=""><button data-m-type="Co">기업회원</a></li>
					</ul>
				</section>
				<div class="card-body p-5 tab1 active">
					<h2>로그인</h2>
					<section class="section_kakao">
						<a class="btn_signup_kakao" href="/users/oauth/kakao"> <img
							src="img/kakao.svg"><span>카카오 로그인</span>
						</a>
					</section>
					<section class="section_naver">
						<a class="btn_signup_naver" href="/users/oauth/google"> <img
							src="img/naver.svg"><span>네이버 로그인</span>
						</a>
					</section>
					<section class="section_google">
						<a class="btn_signup_google" href="/users/oauth/google"> <img
							src="img/google.png"><span>구글 로그인</span>
						</a>
					</section>

					<div class="etcor"></div>

					<div class="mb-2">
						<form action="/login" method="POST">
							<input type="hidden" />
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									type="email" class="form-control" name="username"

									value="shin@naver.com">

							</div>
							<div class="mb-3">
								<label class="form-label ">Password</label> <input
									type="password" class="form-control" name="password"

									value="aa1234@@">

							</div>
							<button class="submit" type="submit" class="btn btn-primary">기존
								회원 로그인</button>
						</form>

						<div class="log-update">
							<div class="left">
								<a class="dfd" href="/Loginform">아이디찾기 </a> <span
									class="separator">|</span> <a href="#"> 비밀번호찾기</a>
							</div>
							<div class="right">
								<a href="/signup">회원가입</a>
							</div>
						</div>
						<!--<div class="log-update">  -->



						<!-- <button type="button" id ="loginForm" class="btn btn-secondary mt-3"> 회원가입</button> -->

					</div>
				</div>
				<!-- tab1 -->
				<div class="card-body p-5 tab2">
					<h2>기업로그인</h2>
					<section class="section_kakao">
						<a class="btn_signup_kakao" href="/users/oauth/kakao"> <img
							src="img/kakao.svg"><span>카카오 로그인</span>
						</a>
					</section>
					<section class="section_naver">
						<a class="btn_signup_naver" href="/users/oauth/google"> <img
							src="img/naver.svg"><span>네이버 로그인</span>
						</a>
					</section>
					<section class="section_google">
						<a class="btn_signup_google" href="/users/oauth/google"> <img
							src="img/google.png"><span>구글 로그인</span>
						</a>
					</section>

					<div class="etcor"></div>

					<div class="mb-2">
						<form action="/login" method="POST">
							<input type="hidden" />
							<div class="mb-3">
								<label class="form-label">Email address</label> 
								<input type="email" class="form-control" name="username" value="kim@kakao.com">
							</div>
							<div class="mb-3">
								<label class="form-label ">Password</label> <input
									type="password" class="form-control" name="password" value="aa1234@@">
							</div>
							<button class="submit" type="submit" class="btn btn-primary">기존
								회원 로그인</button>
						</form>

						<div class="log-update">
							<div class="left">
								<a class="dfd" href="/Loginform">아이디찾기 </a> <span
									class="separator">|</span> <a href="#"> 비밀번호찾기</a>
							</div>
							<div class="right">
								<a href="/signup/company">회원가입</a>
							</div>
						</div>
						<!--<div class="log-update">  -->



						<!-- <button type="button" id ="loginForm" class="btn btn-secondary mt-3"> 회원가입</button> -->

					</div>
				</div>
				<!-- tab2 -->
			</div>
		</div>
	</section>
	<script>
		/*    const logBtnEl = document.querySelector('#loginForm');
		  logBtnEl.addEventListener('click', () => {
		  	console.log("~~~~~~~~");
		  	console.log("~~~~~~~~");
		  	console.log("~~~~~~~~");
		  	window.location.href = '/signup';
		  }) */

		  document.addEventListener('DOMContentLoaded', function() {
			    const tabs = document.querySelectorAll('#devMemTab li');
			    tabs.forEach(function(tab) {
			        tab.addEventListener('click', function() {
			            console.log(tab); // 클릭한 탭에 대한 정보를 콘솔에 출력
			            const activeTab = document.querySelector('#devMemTab li.on');
			            if (activeTab) activeTab.classList.remove('on');
			            
			            tab.classList.add('on');
			            
			            const tabId = this.getAttribute('data-tab');
			            console.log(tabId);
			            
			            document.querySelectorAll('.card-body').forEach(function(tabContent) {
			                tabContent.classList.remove('active'); // 모든 탭 내용의 active 클래스 제거
			            });
			           const activeTabContent  =  document.querySelector('.card-body'+'.'+tabId);
			           console.log(activeTabContent);
			           activeTabContent.classList.add('active');
			        });
			    });
			});
	</script>
</body>
</html>






