<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   
.logoimg {
   width: 180px;
}   

#navbar {
	z-index: 1000;
}

.btn {
	background-color: #66C069;
	color: white;
	font-size: 24px;
	width: 18%;
	padding: 15px;
	display: block;
	margin : auto;
}

.date-info {
  text-align: left;
}


#applyButton:hover {
	color: green;
	background-color: lightgreen;
}

.image-container {
  position: relative;
  display: inline-block; 
  max-width: 120%;
}

.image-container img {
  width: 100%; 
  height: 100%;
}

.text-overlay {
  position: absolute;
  top: 50%; 
  left: 50%;
  transform: translate(-50%, -50%); 
  color: white; 
  font-size: 36px; 
  font-weight: bold;
  min-width: 80%;
}

.icon-svg {
	display: inline-block;
	position: relative;
	width: 20px;
}

.content-container {
	display: flex;
	aling-items: center;
}

.flex-container {
  display: flex;
}

.flex-container > div {
  padding: 20px;
  font-size: 15px;
  border: solid 1px lightgrey;
  font-weight: bold;
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
			  	<img src ="/img/${posting.com_logo}" alt="프로필img">
			  	<br><br><br>
			  <div class="sub_title1" style="text-align: left; ">기업정보</div>
			  <div>&nbsp;</div>
			  	<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">설립연도</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        ${posting.com_birth}년
				  </div><br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">기업형태</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        ${posting.com_type}
				  </div>
					<br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">사원수</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        ${posting.employee}
				  </div><br>
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
		<div><a href="/Mypage/Apply?user_id=${user_id}&po_id=${posting.po_id}&nowpage=1" id="applyButton"
		class="btn" style="text-decoration-line: none">✅지원하기</a></div>
		<br>
		<div id="navbar">
		 	<a class="active" href="javascript:void(0)" onclick="scrollToSection('details')">상세요강</a>
 		  <a href="javascript:void(0)" onclick="scrollToSection('application')">접수기간/방법</a>
 		  <a href="javascript:void(0)" onclick="scrollToSection('company-info')">기업정보</a>
		</div>
		
		<div id="content">
		  <div id="details" class="section">
		    <div style="font-size: 17px; font-weight: bold">
		    	<div class="image-container">
		    		<img src ="/img/bg-content.jpg" alt="프로필img">
		    		<div class="text-overlay">${posting.po_content}</div>
		    	</div>
		    	<br><br><br><br>
		    	
		    		<div class="content-container">
		    			<div class="icon-svg">
		    				<img src = "/img/content-icon.svg" alt="아이콘svg">
		    			</div>
		    			<h2>포지션 및 자격요건</h2>
		    		</div>
		    		
		    		<br>
		    		<div class="flex-container">
		    			<div style= "background-color: #f1f1f1;">sw enginnering</div>
		    			<div>담당 업무
		    				<p>- 플랫폼 SDK 개발 및 기술 지원</p>		
		    				<p>- Java, JavaScript등 표준 API 기반 앱 개발&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>		
		    				<p>- 오픈 소스 라이브러리 포팅 및 디버깅</p>		
		    				<p>- webOS TV 플랫폼 API 관리 및 기술 지원</p>		
		    				<p>- 플랫폼 API 문서화 및 샘플 앱 개발</p>		
		    				<br>
		    				우대 사항
		    				<p>- 학위: 학사 이상 학위 소지자</p>		
		    				<p>- 전공: 컴퓨터 공학 및 관련 전공자</p>		
		    				<p>- 경력: 2년이상</p>		
		    				<p>- JAVA/Javascript/CSS 프로그래밍 개발경험</p>	
		    			</div>
		    		</div>
		    		<br><br><br>
		    		
		    		<div class="content-container">
		    			<div class="icon-svg">
		    				<img src = "/img/content-icon.svg" alt="아이콘svg">
		    			</div>
		    			<h2>지원 자격</h2>
		    		</div>
		    		<br>
		    				<p>- 초대졸 이상</p>		
		    				<p>- 군필자 또는 면제자에 한하며, 해외여행에 결격사유가 없는 자</p>		
		    				<p>* 전형 진행 과정에서 코딩 기초 실력 확인을 위한 코딩테스트가 진행될 수 있습니다.</p>		
		    				<p>* 보훈 대상자는 관련 법률에 의거하여 우대합니다. (전형 중 증빙서류 제출 필수) </p>
		    		</div>
		    		<br><br><br>
		    		<div class="content-container">
		    			<div class="icon-svg">
		    				<img src = "/img/content-icon.svg" alt="아이콘svg">
		    			</div>
		    			<h2>전형 절차</h2>
		    		</div>
		    		<br>
		    				<p>- 서류전형 > 1차면접 > 임원면접 > 최종합격</p>		
		    				<p>- 면접일정은 추후 통보됩니다.</p>
		    		</div>
		    		<br><br><br>
		    		
		  <div id="application" class="section">
		    <div style="font-size: 17px; font-weight: bold">접수기간/방법</div>
		    <p>
		    	<div class="grid-container3">
			  <div class="item11">
			  	<div id="remainingTime"></div>
			  	<div style="color:grey; font-size: 15px; margin-top: 20px;">남은시간</div>
			  		
			  	<div class="posting" data-po-id="${posting.po_id}" style="color:green; font-size: 24px; font-weight: bold;">
			  		<div class="timer" id=remainingTime_${posting.po_id} style="font-weight: bold;"></div>
			  	</div>
			  	<br>
			  	
			  	
			  	<div class="date-info">
				  	<div style="display: flex; justify-content: center; font-size: 15px;"> 
			        <span style="color: grey;">시작일</span>&nbsp;&nbsp;
			        <div style="font-weight: bold; margin-right: 70px;">${posting.po_start_date}</div>
				 	   </div>
						</div>
					<div class="date-info">	
						<div style="display: flex; justify-content: center; font-size: 15px;">
			        <span style="color: grey">마감일</span>&nbsp;&nbsp;
			        <div style="font-weight: bold; font-weight: left; ">${posting.po_end_date}</div>
						</div>
					</div>	

			  	<br>
			  	<div style="color:lightgrey; font-size: 15px;">채용 시 마감</div>
			  </div>
			  <div class="item12" style="border-bottom: 1px solid lightgrey;">
			  	<div><a href="/Mypage/Apply?user_id=${user_id}&po_id=${posting.po_id}&nowpage=1" id="applyButton"
						class="btn" style="text-decoration-line: none; width: 40%; 
						display: inline-block;">✅지원하기</a></div>
						
						<br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">지원양식</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인잡 이력서 양식
				  </div>
				  <br>
			  <div class="item13" style="border-bottom: 1px solid lightgrey;"></div>  
			  <div class="item14">
			  	<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">모집분야</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        서비스/솔루션/플랫폼 개발자
				  </div>
				  <div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">모집인원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        0명
				  </div>
				  <br>
			  </div>
				  <div class="item15"></div>
				  <div class="item16">*포트폴리오 첨부희망</div>
				  <br>
				  <div class="item17"></div>
				</div>
		  </div>
		    </p>
		  </div>
		  <br><br><br>
		  
		  <div id="company-info" class="section">
		  	<div style="display: flex;">
		    	<div style="font-size: 17px; font-weight: bold;">기업정보</div>
		    		&nbsp;&nbsp;&nbsp;
    			<div><a href="/Detail/ComInfo?com_id=${posting.com_id}
    				" style="font-size: 13px;">0개의 채용공고 진행중&nbsp;&nbsp;></a></div>
		    </div>
		 
		    <p>
		    	<div class="grid-container3">
			  <div class="item11">
			  	<div class="logoimg">
			  	<img src ="/img/${posting.com_logo}" alt="프로필img">
			  	</div>
			  	
			  </div>
			  <div class="item12">
			  	<a href="/Detail/ComInfo?com_id=${posting.com_id}">
			  		<span style="font-size: 17px; font-weight: bold; text-decoration: none;">${posting.com_name}</span>
			  	</a>
					<br><br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">설립</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        ${posting.com_birth}년
				  </div><br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">인증</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        코스닥 상장기업
				  </div>
					<div style="display: flex; font-size: 15px;"> 
				  </div>
				</div>
				
				<div class="item13">
					<br><br>
					<div style="display: flex; font-size: 15px;"> 
			        <span style="color: grey">기업형태</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        ${posting.com_type}
				  </div><br>
					<span style="color: grey; ">매출액</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${posting.sales}
				</div>


				
		  </div>
		    </p>
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
		
		    var remainingTimeString = days + "일 " + hours + ":" + minutes + ":" + seconds;
		    element.innerText = remainingTimeString;
		}
		
		function connect() {
		    var socket = new SockJS('/websocket-clock');
		    stompClient = Stomp.over(socket);
		
		    stompClient.connect({}, function(frame) {
		        var postings = document.querySelectorAll(".posting");
		        postings.forEach(posting => {
		        	var po_id = posting.getAttribute("data-po-id");
		        	stompClient.subscribe('/topic/remainingTime/' + po_id, function(message) {
		        			var remainingTimeJson = JSON.parse(message.body);
	                updateTimer(posting.querySelector(".timer"), remainingTimeJson);
		       		 });
		        });
		        forceUpdate();
		    });
		}
		
		function forceUpdate() {
			var postings = document.querySelectorAll(".posting");
		    postings.forEach(posting => {
		        var po_id = posting.getAttribute("data-po-id");
		        stompClient.send("/app/remainingTime/" + po_id, {}, JSON.stringify({}));
		    });
		}
		    
		
		$(function() {
		    connect();
		    $("#update").click(function() {
		        forceUpdate();
		    });
		})
		
		
		// 타이머 설정 ==============================================================
		function setTimer(timeRemaining) {
		if (timeRemaining > 0) {
        setTimeout(() => {
            console.log("마감기한이 임박했습니다!");
        }, timeRemaining);
    } else {
        console.log("마감기한이 이미 지났습니다.");
    }
}
		
		// timer end =====================================================================
	
		
		// scroll effect =======================================	
		
		window.onscroll = function() {myFunction()};

		var navbar = document.getElementById("navbar");
		var sticky = navbar.offsetTop;

		function myFunction() {
		  if (window.pageYOffset >= sticky) {
		    navbar.classList.add("sticky")
		  } else {
		    navbar.classList.remove("sticky");
		  }
		}

		function scrollToSection(sectionId) {
		  // 모든 버튼에서 active 클래스 제거
		  var navLinks = document.querySelectorAll('#navbar a');
		  navLinks.forEach(function(link) {
		    link.classList.remove('active');
		  });

		  // 클릭한 버튼에 active 클래스 추가
		  var activeLink = document.querySelector('#navbar a[href="javascript:void(0)"][onclick="scrollToSection(\'' + sectionId + '\')"]');
		  if (activeLink) {
		    activeLink.classList.add('active');
		  }

		  // 해당 섹션으로 스크롤
		  var section = document.getElementById(sectionId);
		  if (section) {
		    window.scrollTo({
		      top: section.offsetTop - navbar.offsetHeight, // 네비게이션 바 높이만큼 조정
		      behavior: 'smooth'
		    });
		  }
		}
		
		// Intersection Observer 설정
		var sections = document.querySelectorAll('.section');
		var observerOptions = {
		  root: null,
		  rootMargin: '0px',
		  threshold: 0.8
		};

		var observer = new IntersectionObserver(function(entries) {
		  entries.forEach(function(entry) {
		    if (entry.isIntersecting) {
		      var id = entry.target.id;
		      
		      // 모든 버튼에서 active 클래스 제거
		      var navLinks = document.querySelectorAll('#navbar a');
		      navLinks.forEach(function(link) {
		        link.classList.remove('active');
		      });

		      // 현재 보이는 섹션에 해당하는 버튼에 active 클래스 추가
		      var activeLink = document.querySelector('#navbar a[href="javascript:void(0)"][onclick="scrollToSection(\'' + id + '\')"]');
		      if (activeLink) {
		        activeLink.classList.add('active');
		      }
		    }
		  });
		}, observerOptions);

		// 각 섹션을 observer에 등록
		sections.forEach(function(section) {
		  observer.observe(section);
		});
		
		
			
			
		// ===========================================================
			
			
			
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