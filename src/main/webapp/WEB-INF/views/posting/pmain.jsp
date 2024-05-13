<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet" href="/css/common.css" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

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
#main:hover {
    transform: scale(1.05); /* 호버 효과 시 크기 확대 */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}
#main{
 border: 1px solid #ccc;
    border-radius: 15px;
    margin: 10px;
    padding: 15px 10px;
    text-align: center;
    max-width: 300px;
    height: auto;
    transition: all 0.3s ease;
}
.pstyle{
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 4개의 열을 갖는 그리드 설정 */
  grid-gap: 20px; /* 각 요소 사이의 간격 설정 */
}
.like{
width: 20px;

}
#pimg{
height: 150px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
  <main>
    <div class="inner">
     <h2>공고</h2>
    <div class="pstyle">
   <c:forEach var="posting" items="${postingList}" varStatus="status">
      <div id ="main" class ="main">
						<ul data-totalcount = "4" data-pageno ="1">
							<li>
					<!-- ******* -->		<a href ="/Detail/Detail?com_id=${posting.com_id }" style="text-decoration-line: none;">
									<div class="clogo"><img src ="/img/${posting.po_profile}.jpg" alt="프로필img" id="pimg"></div>
									<div class="listCont">
									<!--  	<div class="pCor">
												<span class ="posId">${posting.po_id }</span>
										</div>-->
										<div class ="pTit">${posting.po_title }</div>
										<div class ="pInfo">
											<span class ="pPart">
												${posting.hope_department }
											</span>
											<br>
											<span class ="pAddress">
											  ${posting.com_address }
											</span>
										</div>
										<div class ="pStackBox">
											<span class ="tag tag-tack">${posting.stack }</span>
										</div>
									</div>
									<div class="listFoot">
										<div class ="pAssist">
											<span class ="pPeriod">${posting.po_end_date }</span>
										<br />
										<br />	
										<hr />
											<span>🏆 합격축하금 100만원</span> <br>
										</div>
										<div>
									</div>
									<br /><br>
									</a>
							</li>	
						</ul>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="likebtn" class="like" type="button"><img src="/img/like_off.png" alt="북마크"></button>
							
				</div>
			</c:forEach>
			</div>
			</div>
		
  </main>
			<div id="timer">00:00:00</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
	   function immediateLike() {
	      function redirectToLoginPage() {
	         window.location.href = "/login/login"
	      }
	      
	      // 알림 창을 띄우고 확인 누를 시 redirectToLoginPage 함수 호출
	      if (confirm("로그인이 필요합니다. 로그인 페이지로 이동합니다")) {
	         redirectToLoginPage();   
	      }
	   }


	// 즉시 지원 버튼 클릭 시 Apply 함수 호출
	      //document.getElementById("likebtn").addEventListener("click", immediateLike);
	
	   var buttons = document.querySelectorAll(".like");
	    buttons.forEach(function(button) {
	        button.addEventListener("click", immediateLike);
	    });
	
	   });
	   
</script>

<script>
        // 시간 설정
        // JS에서 월은 -1된 값을 넣어야함, ex) 2024년 5월 14일 2시 45분은 아래와 같음
        const endTime = new Date(2024, 4, 14, 14, 45, 0); 

        function updateTimer() {
            const now = new Date(); // 현재 시간
            const timeDiff = endTime - now; // 남은 시간

            // 남은 시간 변환
            const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

            // 남은 시간 표시
            document.getElementById('timer').textContent =
              `${days}일 ` +
              `${hours < 10 ? '0' + hours : hours}:` +
              `${minutes < 10 ? '0' + minutes : minutes}:` +
              `${seconds < 10 ? '0' + seconds : seconds}`;

            // 타이머 종료 조건
            if (timeDiff < 0) {
                clearInterval(timerInterval);
                document.getElementById('timer').textContent = "00일 00:00:00";
                alert('마감이요~');
            }
        }

        // 1초마다 업데이트
        let timerInterval = setInterval(updateTimer, 1000);
    </script>



 <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>

</html>