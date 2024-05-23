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
		
				<div class="box-contents">
					<div class="mtuHome">
						 
		                  	<!--  사이드바  -->
	               	<%@include file="/WEB-INF/include/comAside.jsp"%>
					<div class="contWrap">

					  <div class="card">
						<div class="card-header">
							<h3 class="card-title" data-flag="result_panel">지원 이력</h3>
							<div class="mtuTab devFixedTab">
							<!--	<div class="tabs">
									<button class="on" data-flag="result_panel">진행중</button>
									<button data-flag="resultOn_panel">완료</button>
								</div> -->
							</div>

						
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0 tab-content">
						  <div id="result_panel" class="tab_panel active">
							<table class="table table-hover text-nowrap">
								<thead style="text-align: center;">
									<tr>
										<th>지원 번호</th>
										<th>지원자 이름</th>
										<th>이력서 제목</th>
										<th>공고 제목</th>
										<th>마감 날짜</th>
										<th>결과</th>
									</tr>
								</thead>
								<tbody class="ha-result" style="border-bottom: 1px solid #dee2e6;">
									<ul>
									<c:forEach var="H" items="${response.list}" >
										<li>
										<tr onclick="location.href=`/ComMypage/ComResumeView?ap_id=${H.ap_id}`">
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
							<%@include file="/WEB-INF/include/applyHistoryPaging2.jsp"%>
						  </div>
						  
						  </div>
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
			                loadResultData();
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
			
		    function passResult(apId) {
		        fetch(`/ComMypage/PassResult`, {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/json'
		            },
		            body: JSON.stringify({ ap_id: apId })
		        }).then(response => {
		            if (!response.ok) {
		                throw new Error('Failed to toggle result');
		            }
		            return response.text();
		        }).then(result => {
		            console.log(result);
		            window.location.reload();
		        }).catch(error => console.error('Error toggling result:', error));
		    }

		    function failResult(apId) {
		        fetch(`/ComMypage/FailResult`, {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/json'
		            },
		            body: JSON.stringify({ ap_id: apId })
		        }).then(response => {
		            if (!response.ok) {
		                throw new Error('Failed to toggle result');
		            }
		            return response.text();
		        }).then(result => {
		            console.log(result);
		            window.location.reload();
		        }).catch(error => console.error('Error toggling result:', error));
		    }

		    function updateResultMessage(result) {
		        // 결과를 처리하여 화면에 업데이트하는 로직을 작성합니다.
		        // 예를 들어, 결과를 어떤 HTML 요소에 삽입하거나 업데이트합니다.
		        const resultElement = document.querySelector('#resultMessage');
		        resultElement.textContent = result; // 결과를 포함하는 HTML 요소에 결과를 설정합니다.

		        // 창을 새로 고침하여 변경된 결과를 표시합니다.
		        window.location.reload();
		    }

			
		    function loadResultData() {
		        // 스크랩 공고 데이터를 불러오는 로직을 여기에 추가합니다.
		        console.log('지원현황 결과를 불러옵니다.');
		        // 예: fetch 요청을 사용하여 데이터를 불러오기
		        fetch('/comMypage/overall/load')
		            .then(response => response.json())
		            .then(data => {
		                console.log('지원결과 데이터:', data);
		                // 데이터를 화면에 표시하는 로직 추가
		                displayResultData(data);
		            })
		            .catch(error => console.error('Error loading bookmark data:', error));
		    }
		    
		    function displayResultData(data) {
		        const resultPanel = document.querySelector('#resultOn_panel .ha-result ul');
		        console.log(resultPanel);
		        resultPanel.innerHTML = ''; // 기존 내용을 초기화합니다.

		        data.forEach(item => {
		            const li = document.createElement('li');
		            li.innerHTML = `
		                <tr>
		                    <input type="hidden" class="ap_id" value="${item.ap_id}">
		                    <td>${item.ap_id}</td>
		                    <td>${item.user_name}</td>
		                    <td>${item.re_title}</td>
		                    <td>${item.po_title}</td>
		                    <td>${item.stringDay}</td>
		                    <td>
		                        \${item.result === '진행중' ? 
		                            '<button type="button" class="btn btn-success btn-sm result 1">합격</button>' +
		                            '<button type="button" class="btn btn-danger btn-sm result 0">불합격</button>'
		                            : item.result}
		                    </td>
		                </tr>
		            `;
		            resultPanel.appendChild(li);
		        });
		    }
			
			
		});
        
    </script>

</body>

</html>






