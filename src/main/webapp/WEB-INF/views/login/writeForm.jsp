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
button, input, select, textarea{
	border-radius: 0;
    border: none;
    background: 0 0;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    outline: 0;
    text-decoration: none;
    cursor: pointer;
}
body, html{
	width: 100%;
	height: 100%
}
body{
background: #fff;

}
.container{
	position: relative;
	height: 100%;
	
}
.inner{
	width: 500px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	position: relative;
	height: 100%;
}
 .logo {
            text-align: center; /* 로고 이미지를 가운데 정렬 */
          
            
        }

        .logo a {
    display: block;
    width: 120px;
    height: 80px; /* a 태그의 높이에 맞게 조절 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    text-align: center; /* 로고 이미지를 수평 가운데 정렬 */
    position: relative;
}

.logo img {
    max-width: 100%; /* 이미지 최대 너비는 부모 요소에 맞게 설정 */
   
    width: auto; /* 이미지 너비 자동으로 조절 */
    height: auto; /* 이미지 높이 자동으로 조절 */
    display: inline-block; /* 이미지를 블록 요소가 아닌 인라인 블록 요소로 변경 */
    vertical-align: middle; /* 이미지를 수직 가운데 정렬 */
    position: absolute;
    top: -18px;
    left: 0;
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
.form_list{
	margin-top: 10px;
	position: relative;
	margin-bottom: 10px;
	border-radius: 6px;
	border: 1px solid #c6c6c6;

}
.form_item{
	display: flex;
    align-items: center;
    position: relative;
    box-sizing: border-box;
    max-width: 100%;
    min-height: 50px;
    padding: 0 10px 0 45px;
    border-bottom: 1px solid #dfdfdf;
}
.form_list .form_item:last-child{
	border: none;
}
.form_item input{
  	flex: 1 1 auto;
	width: 100%;
	box-sizing:  border-box;
	font-size: 16px;
	line-height: 22px;
	color: #222;
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
.address input{
	padding: .375rem .75rem;
    font-size: 0.8rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da
}
.address input[type="button"] {
    width: 120px;
}

.address input[type="text"]#address02 {
    width: 100px;
}

.address input[type="text"]#fullAddr,
.address input[type="text"]#address_detail {
    width: 100%;
}
.failure-message{
	display: block;
	color: red;

}
.failure-message.hide{
	font-size: 0
}
/* SECTION - BIRTH */
#info_birth {
  display: flex;
}

#info_birth select {
 
  text-align: left;
}

#info_birth select:first-child {
  margin-left : 0px;
}
#info_birth select::-webkit-scrollbar {
  width: 10px;
}

#info_birth select::-webkit-scrollbar-thumb {
  background-color: #b6b6b6;
  border-radius: 3px;
}

.#info_birth select::-webkit-scrollbar-track {
  background-color: #ebe9e9;
  border-radius: 6px;
}
select:not(#birth-year){
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    padding: 10px;
}
#sucess_emailMsg{
	color: blue;
	
}
.Sucess-message.hide, .failure-message.hide{
	font-size: 0
} 
</style>
</head>
<body class="container">
	<section class="inner">
		<h1 class ="logo">
			<a href="/">
				<img src ="img/logo.png">
			</a>
		</h1>
		<div class="content">
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
						<form id="registerForm" action="/write" method="POST">
							<div class="form_list">
								<div class="form_item" >
									<input class="input" type="email"  name="user_email" 
									       placeholder="이메일"  autocomplete="off">
									       
								</div>
								<div class="form_item" >
									<input type="password" class="input" name="user_passwd" 
									       placeholder="비밀번호"> 
									       
								</div>
								<div class="form_item" >
									<input class="password" type="email"  id="user_passwd_detail"
									       placeholder="비밀번호 확인">
								</div>
									
							</div>
							<div class="Sucess-message hide" id="sucess_emailMsg" style="">
							이메일: 사용가능한 이메일 입니다.</div>
							<div class="failure-message hide" id="fail_emailMsg" style="">
							이메일: 중복되는 이메일 입니다.</div>
							<div class="failure-message hide" id="emailMsg" style="">
							이메일: 이메일 주소가 정확한지 확인해 주세요.</div>
							
							<div class="failure-message hide" id="pswd1Msg" style="">
							비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.
							</div>
							<div class="failure-message hide" id="pswd2Msg" style="">
							두 개의 비밀번호가 서로 다릅니다 확인해 주세요.
							</div>
							
							
							<div class="form_list">
								<div class="form_item" >
									<input class="input" type="text"  name="user_name" 
									       placeholder="이름">
									       
								</div>
								<div class="form_item" id="info_birth">
								  <select class="box" id="birth-year">
								    <option disabled selected>출생 연도</option>
								  </select>
								  
								  <select class="box" id="birth-month">
								    <option disabled selected>월</option>
								  </select>
								  <select class="box" id="birth-day">
								    <option disabled selected>일</option>
								  </select>
								</div>
								<input type="hidden" name="user_social_num" id="user_social_num" value="">
								<div class="form_item" >
									<input class="input" type="text"  name="user_phone"
									       placeholder="전화 번호">
								</div>
									
							</div>
							<div class="failure-message hide" id="nameMsg" style="">
							이름은 한글만 입력가능합니다.</div>
							
							<div class="failure-message hide" id="birthdayMsg" style="">
							● 생년월일: 필수 정보입니다.
							</div>
							<div class="failure-message hide" id="phoneMsg" style="">
							● 휴대전화번호: 필수 정보입니다.
							</div>
								
							
							
							
							<div class ="address"> 
							 
							  
							  <input type="text" id="address02"  placeholder="우편번호" readonly="readonly"/>
							  <input type="button"  onclick="daumPost()" value="우편번호 찾기" />
							  <input type="text" id="fullAddr"  placeholder="주소" readonly="readonly">
							  <input type="text" id="address_detail" placeholder="상세주소" />
                    		  <input type="hidden" name="user_address" id="user_address" value="">
                            </div> 
							
							<button class="submit" type="button" class="btn btn-primary" id ="checkBtn">인증 요청</button>
						</form>
						
						
						
			            
						<!-- <button type="button" id ="loginForm" class="btn btn-secondary mt-3"> 회원가입</button> -->
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
               
                
                document.querySelector('#fullAddr').value = fullAddr; // 주소
                document.querySelector('#address02').value = data.zonecode; //  우편번호
                //document.getElementsByName('user_address')[0].value = fullAddr; // 주소
               // console.log(document.getElementsByName('user_zipcode')[0]);
               // console.log(document.getElementsByName('user_zipcode')[0].value);
                //console.log(document.querySelector('#address02').value);

                // 커서를 상세주소 필드로 이동
                document.getElementsByName('user_address')[0].focus();
            }
        }).open();
    }
    
    /*-----------------------focus----------------------------  */
    document.addEventListener('DOMContentLoaded', function(){
    	
    	   // 이름 입력 필드 선택
        let userEmailEl = document.querySelector('[name="user_email"]');
        let emailFormItem = userEmailEl.closest('.form_item');
        function checkEmail(){
    		let email = userEmailEl.value;
    		let exptext = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    		 if (!exptext.test(email)) {
    	            // 이메일 형식이 올바르지 않을 경우
    	            emailMsg.classList.remove('hide');
    	            console.log("하이드제어")
    	            // 이메일 입력 필드에 포커스를 맞춤
    	            emailFormItem.style.border = '1px solid red';
    	          
    	            return false;
    	        }else{
    	        	 emailMsg.classList.add('hide'); // 메시지 숨김
    	        	 emailFormItem.style.border = '';
    	        	 
    	        	
    	             
    	        	 fetch('/login/contrast', {
    	                 method: 'POST',
    	                 headers: {
    	                     'Content-Type': 'application/json'
    	                 },
    	                 body: JSON.stringify({ email: email }) // 이메일 정보를 JSON 형식으로 전송
    	             })
    	            .then(response => {
					    if (response.ok) {
					        console.log("응답잘옴");
					        console.log("dsd");
					        console.log("dsd");
					        // 서버에서 성공적인 응답을 받았을 때
					        return response.text(); // 텍스트로 데이터를 읽음
					    } else {
					        // 서버 오류 응답 처리
					        throw new Error('서버 오류: ' + response.statusText);
					    }
					})
					.then(data => {
					    // 서버로부터 받은 데이터 처리
					    console.log(data); // 텍스트 데이터 확인
					    console.log("----------------");
					    const failMsg = document.getElementById('fail_emailMsg');
					    const successMsg = document.getElementById('sucess_emailMsg');
					    if (data === "not found") {
					        successMsg.classList.remove('hide');
					        failMsg.classList.add('hide');
					        console.log("유저가 존재안함");
					        emailFormItem.style.border = '';
					    } else {
					        failMsg.classList.remove('hide');
					        successMsg.classList.add('hide');
					        console.log("유저가 존재함");
					        emailFormItem.style.border = '1px solid red';
					    }
					})
    	            .catch(error => {
    	                // 서버로부터의 응답 오류를 처리
    	                console.error('서버 응답 오류:', error);
    	            });
    	        	 
    	             return true;
    	        }
    		
    	}//checkIt
        
    	userEmailEl.addEventListener('blur', checkEmail);
    	   
    	
    	
    	function checkPassword1(){
    		// 1. 비밀번호 입력창 정보 가져오기
        	let PasswordEl = document.querySelector('[name="user_passwd"]'); 
        	let PasswordFormItem = PasswordEl.closest('.form_item');
        	let password1 =PasswordEl.value;
        	// 4. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
        	let elStrongPasswordMessage = document.querySelector('#pswd1Msg'); 
        	
        	  if (!strongPassword(password1)) {
  	            // 강력한 비밀번호가 아닐 경우
  	            elStrongPasswordMessage.classList.remove('hide');
  	            PasswordFormItem.style.border = '1px solid red';
  	            return false;
  	        } else {
  	        	PasswordFormItem.style.border = '';
  	            elStrongPasswordMessage.classList.add('hide'); // 메시지 숨김
  	            
  	        }

  	        return true;
    	}
    	
    	function checkPassword2(){
    		// 1. 비밀번호 입력창 정보 가져오기
        	let PasswordEl = document.querySelector('[name="user_passwd"]'); 
        	// 2. 비밀번호 확인 입력창 정보 가져오기
        	let PasswordRetypeEl = document.querySelector('#user_passwd_detail'); 
        	// 3. 실패 메시지 정보 가져오기 (비밀번호 불일치)
        	let elMismatchMessage = document.querySelector('#pswd2Msg');
        
        	
    		let password1 =PasswordEl.value;
    		let password2 =PasswordRetypeEl.value;
    		
    		 if (!isMatch(password1, password2)) {
    	            // 비밀번호가 일치하지 않을 경우
    	            elMismatchMessage.classList.remove('hide');
    	            return false;
    	        } else {
    	            elMismatchMessage.classList.add('hide'); // 메시지 숨김
    	        }

    	       
    	        return true;
    	}//checkPassword
        
    	// 비밀번호 입력창 blur 이벤트 리스너 등록
    	 let passwordEl = document.querySelector('[name="user_passwd"]');
        passwordEl.addEventListener('blur', checkPassword1);

        // 비밀번호 확인 입력창 blur 이벤트 리스너 등록
        let passwordRetypeEl = document.querySelector('#user_passwd_detail');
        passwordRetypeEl.addEventListener('blur', checkPassword2);
        
        function strongPassword (str) {
  		  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
  		}
  	
		function isMatch (password1, password2) {
		  return password1 === password2;
		}
		 let userNameEl = document.querySelector('[name="user_name"]');
		    let nameFormItem = userNameEl.closest('.form_item');
		    
		    function checkName(){
		        let name = userNameEl.value;
		        let regex = /^[가-힣]+$/; // 한글만 허용하는 정규표현식
		        
		        if (!regex.test(name)) {
		            // 이름이 한글이 아닐 경우
		            alert("이름은 한글만 입력 가능합니다.");
		            nameFormItem.style.border = '1px solid red';
		            return false;
		        } else {
		            nameFormItem.style.border = '';
		            return true;
		        }
		    }
		    
		    userNameEl.addEventListener('blur', checkName);
		    
		    /* 생년월일  */
			/* 생년월일  */
			/* 생년월일  */
			
		    const birthYearEl = document.querySelector('#birth-year')
		 // option 목록 생성 여부 확인
		 isYearOptionExisted = false;
		 birthYearEl.addEventListener('focus', function () {
		   // year 목록 생성되지 않았을 때 (최초 클릭 시)
		   if(!isYearOptionExisted) {
		     isYearOptionExisted = true
		     for(var i = 1940; i <= 2022; i++) {
		       // option element 생성
		       const YearOption = document.createElement('option')
		       YearOption.setAttribute('value', i)
		       YearOption.innerText = i + '년'
		       // birthYearEl의 자식 요소로 추가
		       this.appendChild(YearOption);
		     }
		   }
		 });
		 
		 const birthMonthEl = document.querySelector('#birth-month');

		// 월 옵션 목록 생성 여부 확인
		let isMonthOptionExisted = false;

		// 월 선택 요소에 포커스가 가면 이벤트 리스너 등록
		birthMonthEl.addEventListener('focus', function () {
		    // 월 옵션 목록이 생성되지 않았을 때 (최초 클릭 시)
		    if (!isMonthOptionExisted) {
		        isMonthOptionExisted = true;
		        // 1부터 12까지의 월에 대한 옵션 생성
		        for (let i = 1; i <= 12; i++) {
		            // option element 생성
		            const monthOption = document.createElement('option');
		            monthOption.setAttribute('value', i);
		            monthOption.innerText = i + '월';
		            // birthMonthEl의 자식 요소로 추가
		            this.appendChild(monthOption);
		        }
		    }
		});

		// 일 선택 요소 가져오기
		const birthDayEl = document.querySelector('#birth-day');

		// 일 옵션 목록 생성 여부 확인
		let isDayOptionExisted = false;

		// 일 선택 요소에 포커스가 가면 이벤트 리스너 등록
		birthDayEl.addEventListener('focus', function () {
		    // 일 옵션 목록이 생성되지 않았을 때 (최초 클릭 시)
		    if (!isDayOptionExisted) {
		        isDayOptionExisted = true;
		        // 1부터 31까지의 일에 대한 옵션 생성
		        for (let i = 1; i <= 31; i++) {
		            // option element 생성
		            const dayOption = document.createElement('option');
		            dayOption.setAttribute('value', i);
		            dayOption.innerText = i + '일';
		            // birthDayEl의 자식 요소로 추가
		            this.appendChild(dayOption);
		        }
		    }
		});
		/* 생년월일  */
		/* 생년월일  */
		/* 생년월일  */
         function combineDate(formData) {
        const birthYear = document.querySelector('#birth-year').value;
        const birthMonth = document.querySelector('#birth-month').value;
        const birthDay = document.querySelector('#birth-day').value;
        
        // 연도, 월, 일을 합쳐서 날짜 형식으로 변환
        const birthDate = birthYear + '-' + birthMonth + '-' + birthDay;

        // 숨은 input 태그에 설정
        document.querySelector('#user_social_num').value = birthDate;
        
        
   	 }
         /* 생년월일  */
 		/* 생년월일  */
 		/* 생년월일  */
 		
 		/* 주소  */
         /* 주소  */
         /* 주소  */
 		
 		function combineAddress(formData) {
    const address = document.getElementById('fullAddr').value;
    const addressDetail = document.getElementById('address_detail').value;
    
    // 주소와 상세 주소를 결합
    const combinedAddress = address + ' ' + addressDetail;

    // hidden input의 value로 설정
    document.getElementById('user_address').value = combinedAddress;
    
    
}
         
         /* 주소  */
         /* 주소  */
         /* 주소  */
         document.querySelector('#checkBtn').addEventListener('click', function(){
        	  combineDate();
          	  combineAddress();
         	const formData = new FormData(document.getElementById('registerForm'));
         	
         	  
         	console.log(formData);
         	console.dir(formData);
         	
         	 for (const pair of formData.entries()) {
                 console.log(pair[0] + ', ' + pair[1]);
             }
         	document.getElementById('registerForm').submit();
         });
 		
    });/*  document.addEventListener('DOMContentLoaded', */
    
    
    
</script>

</body>
</html>






