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
#main:hover {
    transform: scale(1.05); /* 호버 효과 시 크기 확대 */
    /*box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
    box-shadow: 0px 0px 30px skyblue;
}
#main{
 border: 1px solid #ccc;
    border-radius: 15px;
        margin: 3px; /* 여백을 줄입니다. */
    padding: 8px; /* 여백을 줄입니다. */
    /*margin: 10px;
    padding: 15px 10px;*/
    text-align: center;
    max-width: 300px;
    height: auto;
    transition: all 0.3s ease;
 position: relative; /* 부모 요소를 기준으로 자식 요소 위치를 조정하기 위해 position 속성 추가 */
}

.listFoot {
    position: absolute; /* 부모 요소에 대해 절대 위치로 설정합니다. */
    bottom: 0; /* 아래쪽으로부터 위치를 조정합니다. */
    width: 100%; /* 부모 요소의 너비와 같게 설정합니다. */
    opacity: 0; /* 초기에 버튼을 투명하게 설정합니다. */
    transition: opacity 0.3s ease; /* 부드러운 전환 효과를 위한 transition 추가 */
}
#main:hover .listFoot {
    opacity: 1; /* 마우스가 올라갈 때 버튼이 나타나도록 설정합니다. */
}

.pstyle{
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 4개의 열을 갖는 그리드 설정 */
  grid-gap: 20px; /* 각 요소 사이의 간격 설정 */
  transition: 0.3s ease-in-out;
}

.like {
    width: 30px; /* 넓은 영역으로 만들기 위해 너비를 늘립니다. */
    height: 30px; /* 높이도 같이 늘립니다. */
    cursor: pointer; /* 마우스 커서를 변경하여 사용자가 클릭 가능한 요소임을 나타냅니다. */
    background: url('/img/like_off.png') no-repeat; /* 배경 이미지로 사용합니다. */
    background-size: cover; /* 배경 이미지를 버튼 크기에 맞게 조정합니다. */
}
#pimg{
height: 150px;
transition: all 0.3s ease;
   }
#pimg:hover {visibility: visible;
    opacity: 1;
    margin-top: 0px;
    transition-delay: 0.3s;
}
#main:hover #pimg {
    height: 200px; /* 마우스 호버 시 이미지의 높이를 늘립니다. */
}
.card-footer{
    opacity: 0; /* 초기에 버튼 투명하게 설정 */
    transition: opacity 0.3s ease; /* 부드러운 전환 효과를 위한 transition 추가 */
}

.card-footer:hover{
     opacity: 1; /* 마우스가 올라갈 때 버튼이 나타나도록 설정 */
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
					<!-- ******* --><a href ="/Detail/Detail?com_id=${posting.com_id }" style="text-decoration-line: none;">
									<div class="clogo"><img src ="/img/${posting.po_profile}.jpg" alt="프로필img" id="pimg"></div>
									<div class="listCont">
									<!--  	<div class="pCor">
												<span class ="posId">${posting.po_id }</span>
										</div>-->
										<div class ="pTit" style="font-weight: bold;">${posting.po_title }</div>
										<div class ="pInfo">
											<span class ="pPart">
												${posting.hope_department }
											</span>
											<br>
										<div class ="pStackBox">
											<span class ="tag tag-tack">${posting.stack }</span>
										</div>
											<span class ="pAddress">
											  ${posting.com_address }
											</span>
										</div>
									</div>
										<div class ="pAssist">
											<span class ="pPeriod">${posting.po_end_date }</span>
										<br />	
									</a>
									<div class="listFoot">
											<span style="font-size: smaller;">🏆 합격축하금 100만원</span>
										</div>
										<div>
									</div>
							</li>	
						</ul>
					
						<div class="card-footer" style="background-color: white;">
						<a href ="/Detail/Detail?com_id=${posting.com_id }" style="text-decoration-line: none;"class="btn btn-primary">즉시지원하기</a>
						</div>
						<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <button class="like" type="button"><img src="/img/like_off.png" alt="북마크"></button>
					 </div>
				</div>
			</c:forEach>
			</div>
			</div>
		
  </main>
			

<script >
document.addEventListener("DOMContentLoaded", function() {
    var cards = document.querySelectorAll('.main'); // 모든 카드 요소를 선택합니다.

    cards.forEach(function(card) {
        var image = card.querySelector('.pimg'); // 각 카드 내의 이미지를 선택합니다.
        var footer = card.querySelector('.card-footer'); // 각 카드의 버튼을 선택합니다.
        
        card.addEventListener("mouseover", function() {
            footer.style.opacity = '1'; // 마우스를 카드 위에 올리면 버튼이 나타납니다.
        });

        card.addEventListener("mouseout", function() {
            footer.style.opacity = '0'; // 마우스가 카드를 벗어나면 버튼이 사라집니다.
        });
    });
});

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