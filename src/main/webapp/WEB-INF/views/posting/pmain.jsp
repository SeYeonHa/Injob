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
    transform: scale(1.05); 
    box-shadow: 0px 0px 30px skyblue;
}
#main{
 border: 1px solid #ccc;
    border-radius: 15px;
        margin: 3px; 
    padding: 8px;
    text-align: center;
    max-width: 300px;
    height: auto;
    transition: all 0.3s ease;
 position: relative; 
}

.listFoot {
    position: absolute; 
    bottom: 0; 
    width: 100%; 
    opacity: 0; 
    transition: opacity 0.3s ease; 
}
#main:hover .listFoot {
    opacity: 1; 
}

.pstyle{
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 20px; 
  transition: 0.3s ease-in-out;
}

.like {
    width: 30px; 
    height: 30px; 
    cursor: pointer; 
    background: url('/img/like_off.png') no-repeat; 
    background-size: cover; 
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
    height: 200px; 
}
.card-footer{
    opacity: 0;
    transition: opacity 0.3s ease; 
}

.card-footer:hover{
     opacity: 1; 
}
/*=======================================================*/
.department-box {
    display: none;
}

.department-box.show {
    display: block;
}
.department-box ul {
  list-style-type: none; 
  padding: 0;
}

.department-box li {
  display: inline-block; 
  margin-right: 10px; 
}

.department-box li button {
  padding: 8px 16px; 
  background-color: #f0f0f0; 
  border: 1px solid #ccc; 
  border-radius: 4px; 
  color: #333; 
  cursor: pointer; 
}

.department-box li button:hover {
  background-color: #e0e0e0; 
}

.department-box li button.active {
  border-color: #007bff; 
  color: #007bff; 
}
/*=========*/
.area-box {
    display: none;
}

.area-box.show {
    display: block;
}
.area-box ul {
  list-style-type: none; 
  padding: 0;
}

.area-box li {
  display: inline-block; 
  margin-right: 10px; 
}

.area-box li button {
  padding: 8px 16px; 
  background-color: #f0f0f0; 
  border: 1px solid #ccc; 
  border-radius: 4px; 
  color: #333; 
  cursor: pointer; 
}

.area-box li button:hover {
  background-color: #e0e0e0; 
}

.area-box li button.active {
  border-color: #007bff; 
  color: #007bff; 
}
/*---------*/
.career-box {
    display: none;
}

.career-box.show {
    display: block;
}
.career-box ul {
  list-style-type: none; 
  padding: 0;
}

.career-box li {
  display: inline-block; 
  margin-right: 10px; 
}

.career-box li button {
  padding: 8px 16px; 
  background-color: #f0f0f0; 
  border: 1px solid #ccc; 
  border-radius: 4px; 
  color: #333; 
  cursor: pointer; 
}

.career-box li button:hover {
  background-color: #e0e0e0; 
}

.career-box li button.active {
  border-color: #007bff; 
  color: #007bff; 
}
/*---------*/
.grade-box {
    display: none;
}

.grade-box.show {
    display: block;
}
.grade-box ul {
  list-style-type: none; 
  padding: 0;
}

.grade-box li {
  display: inline-block; 
  margin-right: 10px; 
}

.grade-box li button {
  padding: 8px 16px; 
  background-color: #f0f0f0; 
  border: 1px solid #ccc; 
  border-radius: 4px; 
  color: #333; 
  cursor: pointer; 
}

.grade-box li button:hover {
  background-color: #e0e0e0; 
}

.grade-box li button.active {
  border-color: #007bff; 
  color: #007bff; 
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
  <main>
    <div class="inner">

<div class="searchingBox">     
  <div class="container">
    <div class="topBox">
      <div class="dropdown">
      <button class="btn_filter job dev-toggle-filter dev-part-ctgr open">
      <span class="top_tit dev-select-text">직무</span>
      </button>
      </div>
      
      <div class="department-box">
       <ul>
         <li><button class="dev-button-all active">전체</button></li>
         <li><button class="dev-button-item">백엔드</button></li>
         <li><button class="dev-button-item">프론트엔드</button></li>
         <li><button class="dev-button-item">디자인</button></li>
         <li><button class="dev-button-item">엔지니어링</button></li>
         <li><button class="dev-button-item">개발</button></li>
       </ul>
       <div class ="button-box">
		<button class ="search-reset">초기화</button>
		<button class = "search-button">적용하기</button>
	   </div>
      </div>
      
      <div class="dropdown">
        <button class="btn_filter area dev-toggle-filter dev-part-ctgr open">
          <span>지역</span>
        </button>
     <div class="area-box">
       <ul>
         <li><button class ="dev-button-all active">전체</button></li>
         <li><button class ="dev-button-item ">서울</button></li>
         <li><button class ="dev-button-item ">경기</button></li>
         <li><button class ="dev-button-item ">인천</button></li>
         <li><button class ="dev-button-item ">대전</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
    </div> 
</div>

      <div class="dropdown">
        <button class="btn_filter career dev-toggle-filter dev-part-ctgr open">
          <span>경력</span>
        </button>
     <div class="career-box">
       <ul>
         <li><button class ="dev-button-item ">경력무관</button></li>
         <li><button class ="dev-button-item ">신입</button></li>
         <li><button class ="dev-button-item ">경력</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
    </div> 
</div>

      <div class="dropdown">
        <button class="btn_filter grade dev-toggle-filter dev-part-ctgr open">
          <span>학력</span>
        </button>
     <div class="grade-box">
       <ul>
         <li><button class ="dev-button-item">학력무관</button></li>
         <li><button class ="dev-button-item ">고등학교졸업</button></li>
         <li><button class ="dev-button-item ">대학졸업</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
    </div> 
</div>



<nav class="navbar navbar-light">
  <div class="container-fluid justify-content-end">
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>   
</div>
</div>
</div>
<hr />  

     <h2>공고</h2>
       <span> 총  <em id="getCount">${count}</em>건의 공고</span>  
    <div class="pstyle" id="plist">
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
											<span style="font-size: smaller;">💲합격축하금 100만원</span>
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
			

<script>
document.addEventListener("DOMContentLoaded", function() {
    var cards = document.querySelectorAll('.main'); 

    cards.forEach(function(card) {
        var image = card.querySelector('.pimg'); 
        var footer = card.querySelector('.card-footer'); 
        
        card.addEventListener("mouseover", function() {
            footer.style.opacity = '1'; 
        });

        card.addEventListener("mouseout", function() {
            footer.style.opacity = '0'; 
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
	   function immediateLike() {
	      function redirectToLoginPage() {
	         window.location.href = "/login/login"
	      }

	      if (confirm("로그인이 필요합니다. 로그인 페이지로 이동합니다")) {
	         redirectToLoginPage();   
	      }
	   }

	
	   var buttons = document.querySelectorAll(".like");
	    buttons.forEach(function(button) {
	        button.addEventListener("click", immediateLike);
	    });
	
	   });
	   
	   // like 좋아요
	   document.addEventListener("DOMContentLoaded", function() {
    var buttons = document.querySelectorAll(".like"); // 좋아요 버튼 모두 선택

    buttons.forEach(function(button) {
        button.addEventListener("click", function() {
            toggleLike(button); // 좋아요 버튼 클릭 시 toggleLike 함수 호출
        });
    });

    function toggleLike(button) {
        var img = button.querySelector('img');
        var currentSrc = img.getAttribute('src');
        
        if (currentSrc.includes('like_on.png')) {
            img.setAttribute('src', '/img/like_off.png');
        } else {
            img.setAttribute('src', '/img/like_on.png');
        }
    }
});
	   
	   
//---------------------------------------------------------

//-----
document.addEventListener('DOMContentLoaded', function() {
    var jobButton = document.querySelector('.job.dev-toggle-filter');
    var departmentBox = document.querySelector('.department-box');

    jobButton.addEventListener('click', function() {
        departmentBox.classList.toggle('show');
    });
});
//----- 직무

		document.addEventListener("DOMContentLoaded", function() {
			  var buttons = document.querySelectorAll('.dev-button-item');
			  var allButton = document.querySelector('.dev-button-all');
			  var resetButton = document.querySelector('.search-reset');

			  buttons.forEach(function(button) {
			    button.addEventListener('click', function() {
			      var isActive = button.classList.contains('active');

			      if (button !== allButton) {
			        allButton.classList.remove('active');
			        if (isActive) {
			          button.classList.remove('active');
			        } else {
			          button.classList.add('active');
			        }
			      } else {
			        if (!isActive) {
			          allButton.classList.add('active');
			          buttons.forEach(function(btn) {
			            if (btn !== allButton) {
			              btn.classList.remove('active');
			            }
			          });
			        }
			      }
			    });
			  });

			  allButton.addEventListener('click', function() {
			    buttons.forEach(function(button) {
			      button.classList.remove('active');
			    });
			    allButton.classList.add('active');
			  });

			  resetButton.addEventListener('click', function() {
			    buttons.forEach(function(button) {
			      button.classList.remove('active');
			    });
			    allButton.classList.remove('active');
			  });
			});
document.addEventListener('DOMContentLoaded', function() {
    // 직무 박스 내의 초기화 버튼 처리
    var resetButtonJob = document.querySelector('.department-box .search-reset');
    resetButtonJob.addEventListener('click', function() {
        var buttonsJob = document.querySelectorAll('.department-box .dev-button-item');
        var allButtonJob = document.querySelector('.department-box .dev-button-all');

        buttonsJob.forEach(function(button) {
            button.classList.remove('active');
        });
        allButtonJob.classList.remove('active');
    });
});
			
//----- 지역
document.addEventListener('DOMContentLoaded', function() {
    var jobButton = document.querySelector('.area.dev-toggle-filter');
    var areaBox = document.querySelector('.area-box');

    jobButton.addEventListener('click', function() {
        areaBox.classList.toggle('show');
    });
    console.log(areaBox)
});

document.addEventListener('DOMContentLoaded', function() {
    var areaButtons = document.querySelectorAll('.area-box .dev-button-item');
    var allButtonArea = document.querySelector('.area-box .dev-button-all');

    areaButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            if (button !== allButtonArea) {
                allButtonArea.classList.remove('active');
            }
        });
    });

    var resetButtonArea = document.querySelector('.area-box .search-reset');
    resetButtonArea.addEventListener('click', function() {
        var buttonsArea = document.querySelectorAll('.area-box .dev-button-item');
        var allButtonArea = document.querySelector('.area-box .dev-button-all');

        buttonsArea.forEach(function(button) {
            button.classList.remove('active');
        });
        allButtonArea.classList.remove('active');
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // 지역 박스 내의 초기화 버튼 처리
    var resetButtonArea = document.querySelector('.area-box .search-reset');
    resetButtonArea.addEventListener('click', function() {
        var buttonsArea = document.querySelectorAll('.area-box .dev-button-item');
        var allButtonArea = document.querySelector('.area-box .dev-button-all');

        buttonsArea.forEach(function(button) {
            button.classList.remove('active');
        });
        allButtonArea.classList.remove('active');
    });
});
//----경력, 학력
document.addEventListener('DOMContentLoaded', function() {
    
    function toggleBox(buttonSelector, boxSelector) {
        var button = document.querySelector(buttonSelector);
        var box = document.querySelector(boxSelector);

        button.addEventListener('click', function() {
            box.classList.toggle('show');
        });
    }

    function handleButtonClick(buttons, allButton) {
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                if (button !== allButton) {
                    allButton.classList.remove('active');
                }
            });
        });
    }

    function handleResetClick(resetButton, buttonSelector) {
        resetButton.addEventListener('click', function() {
            var buttons = document.querySelectorAll(buttonSelector);
            var allButton = document.querySelector(buttonSelector);

            buttons.forEach(function(button) {
                button.classList.remove('active');
            });
            allButton.classList.remove('active');
        });
    }

    // 경력 
    toggleBox('.career.dev-toggle-filter', '.career-box');
    var careerButtons = document.querySelectorAll('.career-box .dev-button-item');
    var allButtonCareer = document.querySelector('.career-box .dev-button-item');
    handleButtonClick(careerButtons, allButtonCareer);
    handleResetClick(document.querySelector('.career-box .search-reset'), '.career-box .dev-button-item');

    // 학력 
    toggleBox('.grade.dev-toggle-filter', '.grade-box');
    var gradeButtons = document.querySelectorAll('.grade-box .dev-button-item');
    var allButtonGrade = document.querySelector('.grade-box .dev-button-item');
    handleButtonClick(gradeButtons, allButtonGrade);
    handleResetClick(document.querySelector('.grade-box .search-reset'), '.grade-box .dev-button-item');
});



</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>

</html>