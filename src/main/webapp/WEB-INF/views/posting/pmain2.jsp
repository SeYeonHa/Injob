<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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

/**/
.body {
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    font-family: 'Pretendard-Regular';
    margin-left: 10%;
    margin-top: 20px;
    margin-bottom: 200px;
    position: relative;
    width: 1200px;
    height: 1000px;
    display: grid;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    padding: 20px;
    grid-template-columns: repeat(2,1fr);
    grid-row-gap: 150px;
}

.container .card {
    position: relative;
    max-width: 300px;
    height: 215px;
    margin: 30px 10px;
    padding: 20px 15px;
    display: flex;
    flex-direction: column;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    transition: 0.3s ease-in-out;
    background-color: white;
}

.container .card:hover {
   transform: scale(1.05); /* 호버 효과 시 크기 확대 */
    /*box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
    box-shadow: 0px 0px 30px skyblue;
}

.container .card .card-img-top {
    position: relative;
    width: 260px;
    height: 260px;
    top: -60px;
    left: 20px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}

.container .card .card-img-top {
    max-width: 100%;
    border-radius: 4px;
}

.container .card .card-body {
    position: relative;
    margin-top: -140px;
    padding: 10px 15px;
    text-align: center;
    color : #111;
    visibility: hidden;
    opacity: 0;
    transition: 0.3s ease-in-out;
}

.container .card:hover .card-body {
    visibility: visible;
    opacity: 1;
    margin-top: -80px;
    transition-delay: 0.3s;
}

.card-title{
    font-size: 4rem;
    margin-left: 10%;
    color: white;
    text-shadow: 1px 1px 1px black;
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
									<div class="row row-cols-1 row-cols-md-3 g-4">
									<div class="container">
  <div class="col">
    <div class="card">
      <img src="/img/${posting.po_profile}.jpg" class="card-img-top" alt="프로필img">
      <div class="card-body">
        <h5 class="card-title">${posting.po_title }/h5>
        <p class="card-text">
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
</div>

      </p>
      </div>
    </div>
  </div>
		</div>
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>

</html>