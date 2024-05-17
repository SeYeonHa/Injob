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
<!-- Theme style -->
<link rel="stylesheet" href="/css/adminlte.css">

<style>

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>

		<div class="container-ha">
			<section class="box align_right">
		<!--  사이드바  -->
			<aside class="container-123">
				<section class="secLnb">
					<div class="lnbGroup">
						<h2 class="lnbTit">
							<a href="/ComMypage/Post?com_id=${com_id}">기업회원 홈</a>
						</h2>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">공고 관리</h2>
						<ul>
							<li><a href="/ComMypage/PostWrite?com_id=${com_id}">공고
									등록</a></li>
							<li><a href="/ComMypage/Post?com_id=${com_id}">공고 현황</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">지원현황 관리</h2>
						<ul>
							<li><a href="/ComMypage/ApplyHistory?com_id=${com_id}">입사지원
									현황</a></li>
							<li><a href="/user/consulting">헤드헌팅 채용상담</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">스크랩/관심이력서</h2>
						<ul>
							<li><a href="/User/Scrap">스크랩 이력서</a></li>
							<li><a href="/User/FavorCo">관심이력서/헤드헌터</a></li>
							<li><a href="/User/Alarm">MY 알림</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">회원정보 관리</h2>
						<ul>
							<li><a href="/Text_User/User_Info_Mng.asp">회원정보 수정</a></li>
							<li><a href="/Text_User/User_PWD_Mng.asp">비밀번호 변경</a></li>
							<li><a href="/Text_User/User_Mailing_Mng.asp">메일·문자 설정</a></li>
						</ul>
					</div>
				</section>
			</aside>

				<div class="box-contents">


					<div class="card">
						<div class="card-header">
							<h3 class="card-title">지원 이력</h3>
							<div class="mtuTab devFixedTab">
								<div class="tabs">
									<button class="on" data-flag="result_panel">진행중</button>
									<button data-flag="resultOn_panel">완료</button>
								</div>
							</div>

						
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0 tab-content">
						  <div id="result_panel" class="tab_panel active">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>지원 번호</th>
										<th>지원자 이름</th>
										<th>이력서 제목</th>
										<th>공고 제목</th>
										<th>마감 날짜</th>
										<th>결과</th>
									</tr>
								</thead>
								<tbody>
									<ul>
									<c:forEach var="H" items="${Historylist}">
										<li>
										<tr>
											<input type="hidden" class="ap_id" value="${H.ap_id }">
											<td >${H.ap_id }</td>
											<td>${H.user_name }</td>
											<td>${H.re_title}</td>
											<td>${H.po_title}</td>
											<td>${H.stringDay}</td>
											<td><c:choose>
													<c:when test="${H.result == '진행중'}">
														<!-- 진행중인 경우 합격과 불합격 버튼 표시 -->
														<button type="button" class="btn btn-success btn-sm result 1">합격</button>
														<button type="button" class="btn btn-danger btn-sm result 0">불합격</button>
													</c:when>
													<c:otherwise>
														<!-- 그 외의 경우에는 결과 값 표시 -->
									                    ${H.result}
									                </c:otherwise>
												</c:choose></td>
										</tr>
										</li>
									</c:forEach>
									</ul>
								</tbody>
							</table>
						  </div>
						  
						  
						</div>
						
					</div>
				</div>
			</section>
		</div>
	</main>

	<footer>
		<%@include file="/WEB-INF/include/Footer.jsp"%>
	</footer>

	<script>
	
		document.addEventListener('DOMContentLoaded', function(){
			
			// 모든 버튼 요소를 선택합니다.
			const tabs = document.querySelectorAll('.mtuTab .tabs button');
			const panels = 	document.querySelectorAll('.tab_content .tab_panel');
			
			// 각 버튼에 클릭 이벤트 리스너를 추가합니다.
			tabs.forEach(tab => {
				  tab.addEventListener('click', function() {
					  const flag = this.getAttribute('data-flag');
					  
					  panels.forEach(panel => {
				            panel.classList.remove('active');
				        });
					  // 해당하는 패널에 active 클래스 추가
					
					  const targetPanel = document.querySelector(`#\${flag}`);
					
				        if (targetPanel) {
				            targetPanel.classList.add('active');
				        }
				        
				        // 모든 탭 버튼의 on 클래스 제거
				        tabs.forEach(t => {
				            t.classList.remove('on');
				        });

				        // 클릭된 탭 버튼에 on 클래스 추가
				        this.classList.add('on');
				        
				        // 스크랩 공고일 때 이벤트 발생
			            if (flag === 'resultOn_panel') {
			                // 여기에 스크랩 공고 클릭 시 실행할 코드를 추가합니다.
			                console.log('지원 현황 완료 버튼이 클릭되었습니다.');
			                // 예: 스크랩 공고 데이터를 불러오는 함수 호출
			                loadResultOnData();
			            }
				  });
				
			});//tabs
			
		    let	resultsEl = document.querySelectorAll('.result');
			//bookmark 
			 // 북마크 요소에 클릭 이벤트 리스너 추가
		    resultsEl.forEach((oneresult, index) => {
		        oneresult.addEventListener('click', function() {
		            // 북마크 요소의 자식 요소인 버튼 선택
	  
		            // bookmarkOn 클래스가 존재하지 않을 경우 insert
		                //필요한거 po_id
		                //user_id  <-- 근데 이거는 시큐리티 세션이 가지고 있음
		              
		                const apId = this.closest('tr').querySelector('.ap_id').value;      
		                console.log(apId); 
		                
		            if (oneresult.classList.contains('1')) {
		                // bookmarkOn 클래스가 이미 존재할 경우 update
		                alert('합격입니다.'); 
		                passResult(apId);
		            } else {
		                alert('불합격입니다.');
		                failResult(apId); 
		            }
		        });
		    });
			
		    function passResult(apId){
				fetch(`/ComMypage/PassResult`,{
					method: 'POST',
			        headers: {
			            'Content-Type': 'application/json'
			        },
			        body: JSON.stringify({ ap_id : apId })
					
				}).then(response => {
			        if (!response.ok) {
			            throw new Error('Failed to toggle result');
			        }
			        return response.text(); 
			        
			    }).then(booktext => {
			    	console.log(booktext);
			    	
			    }).catch(error => console.error('Error toggling result:', error));
					
			}
			
		    function loadResultOnData() {
		        // 스크랩 공고 데이터를 불러오는 로직을 여기에 추가합니다.
		        console.log('스크랩 공고 데이터를 불러옵니다.');
		        // 예: fetch 요청을 사용하여 데이터를 불러오기
		        fetch('/ComMypage/ResultOn')
		            .then(response => response.json())
		            .then(data => {
		                console.log('스크랩 공고 데이터:', data);
		                // 데이터를 화면에 표시하는 로직 추가
		                displayBookmarkData(data);
		            })
		            .catch(error => console.error('Error loading bookmark data:', error));
		    }
			
			
		});
        
    </script>

</body>

</html>






