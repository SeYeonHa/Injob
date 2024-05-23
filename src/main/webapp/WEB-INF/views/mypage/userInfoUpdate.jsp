<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/mypage.css" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

<style>
.box-contents {
    
    border: none;
}
  #content {
    position: relative;
    margin-top: 32px;
    z-index: 800;
    zoom: 1;
}
form, fieldset, iframe, button {
    border: 0 none;
}
legend{
 margin-top: 50px;
 
}
#secMbr #content .mbrHeading2 {
    margin-bottom: 11px;
    font-size: 17px;
    letter-spacing: 0px;
    font-weight: bold;
    color: #4b4b4b;
}
.mbrTplData2 table {
    border-top: 2px solid #777a83;
    border-bottom: 1px solid #dce1eb;
    width: 100%;
    background: #fff;
    table-layout: inherit;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 0 none;
    width: 100%;
    table-layout: fixed;
    word-wrap: break-word;
}
table, th, td, input, button, select {
    font-size: 16px;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, input, textarea, button, p, table, th, td {
    padding: 0;
    margin: 0;
}
.box-contents .content h3{
 margin: 10px 0;
 font-size: 1.8rem;
}
.box-contents .content .subTitle{
 margin: 0 0 10px 10px;
}
.mbrTplData2 input,.mbrTplData2 select{
	height: 25px;
	line-height: 25px;
}
.mbrTplData2 table th {
    padding: 8px 0 8px 23px;
    background-color: #f9f9f9;
    color: #333;
    text-align: left;
    width: 25%;
}
.mbrTplData2 table th, .mbrTplData2 table td {
    height: 60px;
    border-top: 1px solid #e5e5e5;
    vertical-align: middle;
}
.mbrTplData2 tr td {
    position: relative;
    text-align: left;
}
.mbrTplData2 table td {
    padding: 5px 0 5px 16px;
    word-wrap: break-word;
    border: 1px solid #e5e5e5;
}
.mbrHelpWrap{
 display: flex;
}
.mbrHelpWrap .birth{
 display: flex;
}
.mbrHelpWrap .birth label{
	margin-right: 4px;
}
.mobile{
	display: flex;
	align-items: center;
}
.mobile span{
	
}
.address_input2 div td{
  display: flex;
  width: 100%;
  align-content: center;
}
.address_input2 td input{
	width: 45%;
	
}
.address_input2 td input:first-child {
	margin-right: 5px;
}
#address02{
	width: 50%;
}
#addressBtn{
	width: 100px;
}
#updateBtn{
 	display: flex;
	justify-content: center;
}
#updateBtn button{
	width: 100px;
	height: 50px;
	color: white;
	margin: 20px 2px 20px 2px;
	
}
#updateBtn button:nth-child(1) {
	background-color: green;
}
#updateBtn button:nth-child(2) {
	background-color: #666;
}
#birth_formEl #birth-year{
  width: 90px;
  margin-right: 8px;
}
#birth_formEl #birth-month, #birth_formEl #birth-day{
 width: 50px;
 margin-right: 20px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>

		<div class="container-ha">
			<section class="box align-right">
				<!--  사이드바  -->
			


		<div class="box-contents">
		 <div class="mtuHome">
						 
		                  	<%@include file="/WEB-INF/include/aside.jsp"%>
							<div class="contWrap">
			<div class="content">
			  <form id="registerForm" method="post" action="/Text_User/User_Write">	
				<fieldset>		
                    <h3>회원정보수정</h3>
                    <p class="subTitle">회원정보를 수정할 수 있습니다.</p>
					<div class ="mbrHeading2"></div>
					<div class ="mbrTplDesc"></div>
					<div class ="mbrTplData2">
					  <table>
						  <tbody>
						    <tr>
						  	  <th scope="row">
						  	     <lable>아이디</lable>
						  	  </th>
						  	  <td>
						  	     <strong>${user.user_email }</strong>
						  	  </td>
						    </tr>	
						  <tr>
						  	 <th scope="row">이름</th>
						  	 <td colspan="3">
						  	 <input type="text" class="ipText" name="user_name"
						  	        maxlength="12" value="${user.user_name }" style="width: 130px;">
						  	 </td>
						  </tr> 
						  <tr>
						  	<th scope="row">생년 월일/성별</th>
						  	<td>
					  	      <div class="mbrHelpWrap " id="birth_formEl">
                                     <select title="출생연도 선택" id="birth-year" 
                                     class="ipSelect" >
                                         <option value>출생연도</option>
                                         
                                     </select>
                                     <select title="월 선택"  id="birth-month" 
                                      class="ipSelect" value="월">
                                        	<option value>월</option>
                                         
                                     </select>
                                     <select title="일 선택" id="birth-day" 
                                    " class="ipSelect" value="일">
                                         <option value>일</option>
                                         
                                     </select>
                                     <input type="hidden" name="user_social_num" id="user_social_num">

                                     <div class="birth">
                                         <input type="radio" id="M_Gender0" name="user_gender" value="남자" checked="">
                                         <label for="lb_man">남</label>
                                         <input type="radio" id="M_Gender1" name="user_gender" value="여자">
                                         <label for="lb_woman">여</label>
                                     </div>
                                 </div>
						  	  </td>
						  	 </tr>		  	   
						  	 <tr>
						  	 	<th scope="row">휴대폰번호</th>
						  	  <td>
						  	   <div class="mbrHelpWrap">
                                  <div class="mobile">
                                      <select title="휴대폰 국번" id="hand_phone1">
                                          <option value="010">010</option>
                                          <option value="011">011</option>
                                          <option value="016">016</option>
                                          <option value="017">017</option>
                                          <option value="018">018</option>
                                          <option value="019">019</option>
                                      </select>
                                      <span class="delimiter" style="padding: 6px 3px; ">-</span>
                                      <input type="text"  id="hand_phone2" maxlength="4" title="휴대폰 앞자리">
                                      <span class="delimiter" style="padding: 6px 3px; ">-</span>
                                      <input type="text"  id="hand_phone3" maxlength="4" title="휴대폰 뒷자리"> 
                                      <input type="hidden" name="user_phone" id="user_phone">                                    
                                  </div>
                                </div>
						  	  </td>
						  	 </tr> 
						  	 <tr>
						  	    <th scope="row">
						  	     <label>이메일</label>
						  	   </th>
						  	  <td>
						  	    <div class="mbrHelpWrap" id ="email_formEl">
                                      <input type="hidden" name="user_email" id="user_email" value="">
                                      <input type="text"  id="email01" maxlength="30" style="width: 150px;"value="wodud6967">
                                      <span class="delimiter">@</span>
                                      <input type="text"  id="email02" title="이메일 서비스 입력" maxlength="25" style="width: 150px" >
                                      <select id="email_select" title="이메일 사업자" onchange="updateEmail()">
                                          <option value="">선택하세요</option>
                                          <option value="naver.com" selected="">naver.com</option>
                                          <option value="hanmail.net">hanmail.net</option>
                                          <option value="nate.com">nate.com</option>
                                          <option value="daum.net">daum.net</option>
                                          <option value="gmail.com">gmail.com</option>
                                          <option value="dreamwiz.com">dreamwiz.com</option>
                                          <option value="etc">직접입력</option>
                                      </select>                                      
                                  </div>
						  	  </td>
						  	 </tr> 
						  	 <tr class ="address_input1">
						  	 	 <th scope="row">
						  	  	<label>우편번호</label>
						  	  </th>
						  	  <td colspan="3">
						  	  	<div class="mbrHelpWrap">
                                    <input type="text" id="address02">
                                    <input id="addressBtn" type ="button" onclick="daumPost()" value="우편번호 찾기">
 								</div>
						  	  </td>
						  	 </tr>
						  	 <tr class="address_input2">
						  	   <th scope="row">
                                   <label for="postcheck">주소</label>
                               </th>
                               <td colspan="3">
                               <div>
                               	 <input type="text" id ="fullAddr">
                                 <input type="text"id ="address_detail" placeholder ="상세주소를 입력해 주세요">
                                 <input type="hidden" name="user_address" id="user_address" value="">
                               </div>
                                 
                               </td>
						  	 </tr>
						  	  
						  
						  </tbody>
						</table>
					
					</div><!-- mbrTplData2 -->
				</fieldset>		
				<div id ="updateBtn">
					<button type ="button" id ="checkBtn">수정하기</button>
					<button type="button" onclick="location.href =''">취소</button>
				</div>
			  </form>		
			</div><!-- content -->
		  </div>
		  </div>

	    </div><!-- box-contents -->


			</section>
		</div>
	</main>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function daumPost() {
		console.log("클릭");
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
	/* -------------------------- */
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
		
		function updateEmail() {
            const selectElement = document.querySelector('#email_select');
            const inputElement = document.querySelector('#email02');
            const selectedValue = selectElement.value;

            if (selectedValue === 'etc') {
                inputElement.value = '';
                inputElement.placeholder = '직접 입력하세요';
                inputElement.focus();
            } else {
                inputElement.value = selectedValue;
            }
        }
		function combineEmail(formDate){
			const email1El = document.querySelector('#email02').value;
			const email2El = document.querySelector('#email01').value;
			console.log(email1El);
			const totalEamil =  email2El + '@' + email1El;
			
			
			document.querySelector('#user_email').value =totalEamil;
		}
		function combinePhone(formData){
			const phone1 = document.querySelector('.mobile #hand_phone1').value;
			const phone2 = document.querySelector('.mobile #hand_phone2').value;
			const phone3 = document.querySelector('.mobile #hand_phone3').value;
			
			const totalPhone = phone1+ '-' + phone2+ '-' + phone3;
			 document.querySelector('#user_phone').value =totalPhone;
		}
		function combineBirth(formData) {
	        const birthYear = document.querySelector('#birth-year').value;
	        const birthMonth = document.querySelector('#birth-month').value;
	        const birthDay = document.querySelector('#birth-day').value;
	        
	        // 연도, 월, 일을 합쳐서 날짜 형식으로 변환
	        const birthDate = birthYear + '-' + birthMonth + '-' + birthDay;

	        // 숨은 input 태그에 설정
	        document.querySelector('#user_social_num').value = birthDate;
	        
	        
	   	 }
		
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
	        	  
	        	 combineBirth();
		          	combineAddress();
		          	combineEmail();
		          	combinePhone();
	         	const formData = new FormData(document.getElementById('registerForm'));
		         	
	         	  
	         	console.log(formData);
	         	console.dir(formData);
	         	
	         	 for (const pair of formData.entries()) {
	                 console.log(pair[0] + ', ' + pair[1]);
	             }
	         	document.getElementById('registerForm').submit(); 
	         });
	</script>

	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>






