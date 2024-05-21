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
    <!--   <span class="top_tit dev-select-text">직무</span>-->
      <span class="box_top dev_wrap-department">직무</span>
      </button>
      </div>
      
      <div class="filter-box department-box">
       <ul>
         <li><button class="dev-button-all active" data-department="전체">전체</button></li>
         <li><button class="dev-button-item" data-department="백엔드">백엔드</button></li>
         <li><button class="dev-button-item" data-department="프론트엔드">프론트엔드</button></li>
         <li><button class="dev-button-item" data-department="디자인">디자인</button></li>
         <li><button class="dev-button-item" data-department="엔지니어링">엔지니어링</button></li>
         <li><button class="dev-button-item" data-department="개발">개발</button></li>
       </ul>
       <div class ="button-box">
		<button class ="search-reset">초기화</button>
		<button class = "search-button">적용하기</button>
	   </div>
      </div>
      
      <div class="dropdown">
        <button class="btn_filter area dev-toggle-filter dev-part-ctgr open">
          <span class="btn_box dev_wrap-local">지역</span>
        </button>
     <div class="filter-box area-box">
       <ul>
         <li><button class ="dev-button-all active" data-local="전체">전체</button></li>
         <li><button class ="dev-button-item " data-local="서울">서울</button></li>
         <li><button class ="dev-button-item " data-local="경기">경기</button></li>
         <li><button class ="dev-button-item " data-local="인천">인천</button></li>
         <li><button class ="dev-button-item " data-local="대전">대전</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
    </div> 
</div>

      <div class="dropdown">
       <!--   <button class="btn_filter career dev-toggle-filter dev-part-ctgr open"> -->
        <button class="btn_filter career dev-toggle-filter dev-part-ctgr open career-button">
          <span class="btn_box dev_wrap-career">경력</span>
        </button>
     <div class="filter-box career-box">
       <ul>
         <li><button class ="dev-button-item" data-career="경력무관">경력무관</button></li>
         <li><button class ="dev-button-item" data-career="신입">신입</button></li>
        <!--   <li><button class ="dev-button-item ">경력</button></li>-->
         <li><button class ="dev-button-item" data-career="경력">경력</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
    </div> 
</div>

      <div class="dropdown">
        <button class="btn_filter grade dev-toggle-filter dev-part-ctgr open">
          <span class="btn_box dev_wrap-grade">학력</span>
        </button>
     <div class="filter-box grade-box">
       <ul>
         <li><button class ="dev-button-item" data-career="학력무관">학력무관</button></li>
         <li><button class ="dev-button-item " data-career="고졸">고졸</button></li>
         <li><button class ="dev-button-item " data-career="대졸">대졸</button></li>
       </ul>
       <div class ="button-box">
         <button class="search-reset">초기화</button>
         <button class="search-button">적용하기</button>
       </div>
       <!-- 필터링된 공고를 표시할 요소 -->
    </div> 
</div>
    <div id="job-listings">
      <!-- 필터링된 결과 -->
    </div>
    <p id="total-count"> 총 <em id="getSearchCount">${total_count}</em>건의 공고</p>



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
					                <a href ="/Detail/Detail?com_id=${posting.com_id }" style="text-decoration-line: none;">
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
										<!--  <span class ="pPeriod">${posting.po_end_date }</span> -->	
											<span class ="pPeriod">${posting.stringDay }</span>
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
					<!--   <button class="like" type="button"><img src="/img/like_off.png" alt="북마크">
					 <ul></ul></button>-->
					 <!--<c:out value="${posting.ub_boolean}" />-->
					 <c:choose>
                       <c:when test="${posting.ub_boolean == 1}">
                        <button class="like" type="button"  data-posting-id="${posting.po_id}"><img src="/img/like_on.png" alt="좋아요"></button>
                       </c:when>
                       <c:otherwise>
                        <button class="like" type="button"  data-posting-id="${posting.po_id}"><img src="/img/like_off.png" alt="좋아요"></button>
                       </c:otherwise>
                     </c:choose>
					 
					 </div>
				</div>
				<input type="hidden" name="user_id" id="user_id"  data-user-id="${ posting.user_id }" />
				<!--  <input type="hidden" name="ub_boolean" id="ubBoolean"  data-user-id="${ posting.ub_boolean }" /> -->
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
/*
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
	
	   });*/
	   
document.addEventListener("DOMContentLoaded", function() {
    const likeButtons = document.querySelectorAll('.like');
function addLike(postingId) {
    fetch(`/Likes/addLike`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ po_id: postingId })
    }).then(response => {
        if (!response.ok) {
            throw new Error('Failed to toggle like');
        }
        return response.text(); 
    }).then(liketext => {
        console.log('Server response:', liketext);
    }).catch(error => console.error('Error toggling like:', error));
}

function deleteLike(postingId) {
    fetch(`/Likes/deleteLike`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ po_id: postingId })
    }).then(response => {
        if (!response.ok) {
            throw new Error('Failed to toggle like');
        }
        return response.text(); 
    }).then(liketext => {
        console.log('Server response:', liketext);
    }).catch(error => console.error('Error toggling like:', error));
}

function toggleLike(button) {
    var img = button.querySelector('img');
    var currentSrc = img.getAttribute('src');

    if (currentSrc.includes('like_on.png')) {
        img.setAttribute('src', '/img/like_off.png');
        console.log('스크랩이 해제되었습니다.');
        alert('스크랩이 해제되었습니다.');
        // 이미 스크랩된 상태에서 스크랩 버튼을 클릭한 경우
        var postingId = button.getAttribute('data-posting-id');
        deleteLike(postingId);
    } else {
        img.setAttribute('src', '/img/like_on.png');
        console.log('스크랩 공고 버튼이 클릭되었습니다.');
        alert('스크랩 되었습니다.');
        // 스크랩되지 않은 상태에서 스크랩 버튼을 클릭한 경우
        var postingId = button.getAttribute('data-posting-id');
        addLike(postingId);
    }
}

likeButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        toggleLike(button);
        console.log('Button clicked');
    });
});
});	   
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------


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
			    button.addEventListener('click', function(event) {
			    	var clickedButton = event.target;
			        var department = clickedButton.getAttribute('data-department');
                  console.log(department);
	        
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
});

document.addEventListener('DOMContentLoaded', function() {
    var areaButtons = document.querySelectorAll('.area-box .dev-button-item');
    var allButtonArea = document.querySelector('.area-box .dev-button-all');

    areaButtons.forEach(function(button) {
        button.addEventListener('click', function(event) {
            var clickedButton = event.target; 
            var local = clickedButton.getAttribute('data-local');
            console.log(local);

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
        
        var buttons = document.querySelectorAll('.dev-button-item');

        buttons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                var clickedButton = event.target;
                var career = clickedButton.getAttribute('data-career');
                var grade = clickedButton.getAttribute('data-grade');
                console.log(career);
                console.log(grade);
            });
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


/*
//--------------------------------------
document.addEventListener("DOMContentLoaded", function() {
		    
		    var psearchVo ={
				department: "전체",
				local: "전체",
				career: "경력무관",
				grade: "학력무관"
				
		}
		var psearchIndex = 0; 
		
		function changePsearchIndex(index, value){
			switch (index){
			case 0:
				psearchVo.department = value;
				break;
			case 1:
				psearchVo.local = value;
				break;
			case 2:
				psearchVo.career =value;
				break;
			case 3:
				psearchVo.grade = value;
				break;
			default:
				console.log("서치버튼클릭중 인데슥에서 오류남");
				break;
			}	
		}
		function fetchData() {
			console.log("fdsfds");
		    fetch("/Posting/Search", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(psearchVo)
		    })
		    .then(response => {
		        if (!response.ok) {
		            throw new Error('서버 응답 오류');
		        }
		        return response.json();
		    })
		    .then(data => {
		        // 서버로부터 받은 데이터를 처리하는 로직
		        console.log(data); // 예시: 받은 데이터를 콘솔에 출력
		    })
		    .catch(error => {
		        console.error('문제 발생:', error);

		    });
		    
		 // 모든 버튼 요소를 선택합니다.
		    var btnBoxes = document.querySelectorAll('.btn_filter');

		    // 각 버튼 요소에 대해 클릭 이벤트를 추가합니다.
		    btnBoxes.forEach(function(btnBox) {
		        btnBox.addEventListener('click', function() {
		        	// 현재 클릭된 버튼의 부모 요소에서 모든 버튼을 찾습니다.
		            var parentClass = btnBox.parentElement.classList;
		     	
		            // 클릭된 버튼 요소의 클래스를 확인하여 이벤트를 처리합니다.
		            var btnClass = parentClass.contains('dev_wrap-department') ? 'department' :
		                           parentClass.contains('dev_wrap-local') ? 'local' :
	                               parentClass.contains('dev_wrap-grade') ? 'grade' :
		                           parentClass.contains('dev_wrap-career') ? 'career' : '';
		            var filterBox = btnBox.nextElementSibling;

		            var siblingFilterBoxes = document.querySelectorAll('.filter-box');
		            siblingFilterBoxes.forEach(function(siblingFilterBox) {
		                if (siblingFilterBox !== filterBox) {
		                    siblingFilterBox.classList.remove('open');
		                }
		            });
		            
		         // 각 버튼에 대한 처리
		            switch (btnClass) {
		                case 'department':
		                	filterBox.classList.toggle('open');
		                	psearchIndex = 0;
		                	break;
		                case 'local':
		                   filterBox.classList.toggle('open');
		                   psearchIndex = 1;
		                    break;
		                case 'career':
		                    filterBox.classList.toggle('open');
		                    psearchIndex = 2;
		                    break;
		                case 'grade':
		                    filterBox.classList.toggle('open');
		                    psearchIndex = 3;
		                    break;
		                default:
		                    break;
		            }
		            var buttons = filterBox.querySelectorAll('ul li button');
		            
		            buttons.forEach(function(button) {
		                button.addEventListener('click', function() {
		                    // 현재 클릭된 버튼을 제외한 다른 버튼들의 active 클래스를 제거합니다.
		                    buttons.forEach(function(otherButton) {
		                        if (otherButton !== button) {
		                            otherButton.classList.remove('active');
		                        }
		                    });
		                    // 현재 클릭된 버튼에 active 클래스를 추가합니다.
		                    button.classList.add('active');
		                    
		                });
		            });//buttons.forEach
		            
		    })

		    })
		
		}
})
*/
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.search-button').forEach(function(button) {
        button.addEventListener('click', function() {
        	console.log('search-button 클릭됨');
            const activeDepartment = document.querySelector('.department-box .dev-button-item.active');
            const activeLocal = document.querySelector('.area-box .dev-button-item.active');
            const activeCareer = document.querySelector('.career-box .dev-button-item.active');
            const activeGrade = document.querySelector('.grade-box .dev-button-item.active');

            const department = activeDepartment ? activeDepartment.getAttribute('data-department') : null;
            const local = activeLocal ? activeLocal.getAttribute('data-local') : null;
            const career = activeCareer ? activeCareer.getAttribute('data-career') : null;
            const grade = activeGrade ? activeGrade.getAttribute('data-grade') : null;

            fetchJobListings(department, local, career, grade);
            
        });
    });

    function fetchJobListings(department, local, career, grade) {
        const requestData = {
            department: department === '전체' ? null : department,
            local: local === '전체' ? null : local,
            career: career === '경력무관' ? null : career,
            grade: grade === '학력무관' ? null : grade
        };
    	console.log('requestData:', requestData);

        fetch('/Posting/Search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.jobListings) {
                updateJobListings(data.jobListings);
            } else {
                updateJobListings([]);
            }
            const totalCountElement = document.getElementById('total-count');
            if (totalCountElement) {
                totalCountElement.textContent = `총 ${data.totalCount}개의 공고가 있습니다.`;
                console.log('totalCount:', data.totalCount);
            } else {
                console.error('total-count element not found');
            }

        })
        .catch(error => {
            console.error('Error fetching job listings:', error);
        });
    }

    function updateJobListings(jobListings) {
    	 console.log('updateJobListings 함수 호출됨');
        const jobListingsContainer = document.getElementById('job-listings');
        if (!jobListingsContainer) {
            console.error('job-listings container not found');
            return;
        }

        jobListingsContainer.innerHTML = '';

        if (jobListings.length === 0) {
            jobListingsContainer.innerHTML = '<p>조건에 맞는 공고가 없습니다.</p>';
            return;
        }

        jobListings.forEach(job => {
            const jobElement = document.createElement('div');
            jobElement.className = 'job-listings';
            jobElement.innerHTML = `
                <h3>${job.po_title}</h3>
                <p>직무: ${job.hope_department}</p>
                <p>경력: ${job.career}</p>
                <p>지역: ${job.com_address}</p>
                <p>학력: ${job.po_grade}</p>
            `;
          //  plist.appendChild(jobElement);
           jobListingsContainer.appendChild(jobElement);
        });
    }

});




</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>

</html>