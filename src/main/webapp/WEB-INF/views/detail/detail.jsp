<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 상세보기</title>

<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/detail.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

<style>

body {
	width: 80%;
	margin: 0 auto;
}

.btn {
	background-color: #66C069;
	color: white;
	font-size: 24px;
	width: 18%;
	padding: 15px;
}

#applyButton:hover {
	color: green;
	background-color: lightgreen;
	
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>

		
			<div>&nbsp;</div>
			<h3>채용정보</h3>
			<div>&nbsp;</div>
		
			
			<div class="grid-container">
			  <div class="grid-item item1">
				  <span style="font-size: 20px;">${posting.com_name}</span>
				  <br>
				  <span style="font-weight:bold; font-size: 25px;">${posting.po_title}</span>
			  </div>

			  <div class="grid-item item2">
			  <div class="logoimg" >
			  	<img src ="/img/${posting.com_logo}.jpg" alt="프로필img">
			  	<br><br><br>
			  <div class="sub_title1">기업정보</div>
			  <div>&nbsp;</div>
					<span>설립연도</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.com_birth}</span>
					<br><br>
					<span>기업형태</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.com_type}</span>
					<br><br>
			  </div>
			  </div>
			  
			  <div class="grid-item item3"><div class="sub_title1">지원자격</div>
					<div>&nbsp;</div>
					<span>경력</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.career}</span>
					<br><br>
					<span>학력</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.po_grade}</span>
					<br><br>
					<span>스킬</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.stack}</span>
				</div>  
			  <div class="grid-item item4">근무조건
			  <div>&nbsp;</div>
					<span>급여</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.com_salary}</span>
					<br><br>
					<span>지역</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.com_address}</span>
				</div>
			</div>
			<br>
		<div><a href="/Mypage/Apply?user_id=1&po_id=1101" id="applyButton"
		class="btn" style="text-decoration-line: none">✅지원하기</a></div>
	

		<br><br><br>
		<div class="main-nav">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" 
		    		type="button" role="tab" aria-controls="nav-home" aria-selected="true">상세요강</button>
		    		
		    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" 
		    		type="button" role="tab" aria-controls="nav-profile" aria-selected="false">접수기간/방법</button>
		    		
		    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" 
		    		type="button" role="tab" aria-controls="nav-contact" aria-selected="false">비슷한 공고 리스트</button>
		  </div>
		</nav>
		
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">공고 api</div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		  	
		  	<!-- 접수기간 / 방법  -->
		  	<br>				
				<br>
		  <div class="grid-container3">
			  <div class="item11">
			  	<div id="remainingTime"></div>
			  	<div style="font-size: 20px;">남은시간</div>
			  		
			  	<div id="remainingTime" style="color:green; font-size: 24px; font-weight: bold;"></div>
			  	<br>
			  	<div style="font-size: 20px;">시작일&nbsp;&nbsp;${posting.po_start_date}</div>
	 		  	<div style="font-size: 20px;">마감일&nbsp;&nbsp;${posting.po_end_date}</div>
			  	<br>
			  	<div style="font-size: 20px;">채용 시 마감</div>
			  </div>
			  <div class="item12" style="border-bottom: 1px solid lightgrey;">
			  	<div><a href="/Mypage/Apply?user_id=1&po_id=1101" id="applyButton"
						class="btn" style="text-decoration-line: none; width: 40%; 
						display: inline-block;">✅지원하기</a></div>
						<br>
						지원양식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인잡 이력서 양식
				  </div>
			  <div class="item13" style="border-bottom: 1px solid lightgrey;"></div>  
			  <div class="item14">
			  	모집분야&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스/솔루션/플랫폼 개발자 
			  	<br>
			  	모집인원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0명 
			  </div>
			  <div class="item15"></div>
			  <div class="item16">포트폴리오 첨부희망</div>
			  <div class="item17"></div>
			</div>
		  </div>
		  
		  
		  
				<!-- 비슷한 공고 리스트 -->
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
		  <div>&nbsp;</div>
			<nav class="navbar navbar-light bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="/Detail/Detail?com_id=${posting.com_id }">${posting.po_title }</a>
			  </div>
			</nav>
			<br><br>
			
				<!-- As a heading -->
			<nav class="navbar navbar-light bg-light">
			  <div class="container-fluid">
			    <span class="navbar-brand mb-0 h1"
			    >Navbar</span>
			  </div>
			</nav>
			
			<br>
			  <div class="d-flex bd-highlight">
					<div class="p-2 flex-shrink-1 bd-highlight"><span style="font-weight:bold; font-size:15px;">${posting.com_name}</span></div>		
	 				<div class="p-2 w-60 bd-highlight"><span style="font-size:15px;">${posting.po_title}</span></div>
				</div>
				
				
			</div>
		</div>	
	</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




<!-- ================Script======================= -->
		
<script>

		function updateTimer(element, remainingTimeJson) {
		    var days 		= remainingTimeJson.days;
		    var hours 	= remainingTimeJson.hours;
		    var minutes = remainingTimeJson.minutes;
		    var seconds = remainingTimeJson.seconds;
		
		    var remainingTimeString = days + "일" + hours + ":" + minutes + ":" + seconds;
		    document.getElementById("remainingTime").innerText = remainingTimeString;
		}
		
		function connect() {
		    var socket = new SockJS('/websocket-clock');
		    stompClient = Stomp.over(socket);
		
		    stompClient.connect({}, function(frame) {
		        stompClient.subscribe('/topic/remainingTime', function(message) {
		        		console.log('Message received: ' + message.body);
		            var remainingTimeJson = JSON.parse(message.body);
		            /*
		            var postings = document.querySelectorAll(".posting");
		            postings.forEach(posting => {
		                var endTimeStr = posting.getAttribute("data-end-time");
		                var endTime = new Date(endTimeStr).getTime();
		                updateTimer(posting.querySelector(".timer"), remainingTimeJson);
		                */
		                updateTimer(document.getElementById("remainingTime"), remainingTimeJson);
		            });
		        forceUpdate();
		    });
		}
		
		function forceUpdate() {
		        stompClient.send("/app/remainingTime", {}, JSON.stringify({}));
		    } 
		    
		
		$(function() {
		    connect();
		    $("#update").click(function() {
		        forceUpdate();
		    });
		})
		

		// timer end =====================================================================
	
			
		var triggerEl = document.querySelector('#myTab a[href="#profile"]')
		bootstrap.Tab.getInstance(triggerEl).show() // Select tab by name
		
		var triggerFirstTabEl = document.querySelector('#myTab li:first-child a')
		bootstrap.Tab.getInstance(triggerFirstTabEl).show() // Select first tab
		
		/*
		document.addEventListener('DOMContentLoaded', function () {
	  // Select tab by name
	  var triggerEl = document.querySelector('#nav-profile-tab');
	  var tabInstance = new bootstrap.Tab(triggerEl);
	  tabInstance.show();

	  // Select first tab
	  var triggerFirstTabEl = document.querySelector('#nav-home-tab');
	  var firstTabInstance = new bootstrap.Tab(triggerFirstTabEl);
	  firstTabInstance.show();
	});
		*/
		
	// --------------------------------------------------------------------------------------------
	// 비로그인 시 로그인 창으로 이동
	document.addEventListener("DOMContentLoaded", function() {
		function immediateApply() {
			function redirectToLoginPage() {
				window.location.href = "/login/login"
			}
			// 알림 창을 띄우고 확인 누를 시 redirectToLoginPage 함수 호출
			if (confirm("로그인이 필요합니다. 로그인 페이지로 이동합니다")) {
				redirectToLoginPage();	
			}
		}
	
	// 즉시 지원 버튼 클릭 시 Apply 함수 호출
			document.getElementById("applyButton").addEventListener("click", immediateApply);
		});
		
		
</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>

