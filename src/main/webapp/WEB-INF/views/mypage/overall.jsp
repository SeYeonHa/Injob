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
.mtuHome{
 margin-top: 50px
}
.contWrap {
	min-height: auto;
	position: relative;
	padding: 0 39px 39px;
	background: #fff;
	border: 1px solid #dce1eb;
}

.mtuTab {
	margin: 0;
	box-sizing: border-box;
	margin-bottom: 30px;
	
}

.mtuHome .mtuTab .tabs {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0;
	border-left: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
}

.mtuHome .mtuTab .tabs button.on {
	z-index: 1;
	
	border:  1px solid #e6e6e6;
border-bottom: none;
}

.mtuHome .mtuTab .tabs button {
	width: 25%;
	height: 46px;
	flex-grow: 1;
	border-bottom: 1px solid #000;
}

.mtuTab .tabs button.on {
	background: #fff;
	border-color: #000;
	z-index: 2;
}

.mtuTab .tabs button {
	position: relative;
	float: left;
	width: 236px;
	height: 54px;
	background: #f9fafb;
	box-sizing: border-box;
	border-top: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
	border-left: 1px solid #e6e6e6;
}





.mtuTab .tabs button {
	font-weight: 700;
	color: #333;
}

.mtuTab .tabs button {
	display: block;
	
	width: 100%;
	height: 100%;
	font-size: 15px;
	letter-spacing: 0;
	color: #666;
	text-align: center;
	box-sizing: border-box;
}



.ai-recommendations-list ul li {
	border-bottom: 1px solid #e8e8e8;
	display: flex;
	width: 100%;
	padding: 24px;
	box-sizing: border-box;
}

.mtuHome .contWrap .ai-recommendations-list .recruit-content {
	padding-left: 0;
	border-left: 0;
}

.ai-recommendations-list .recruit-content {
	overflow: hidden;
	flex: 1 1 auto;
	padding-left: 24px;
	padding-right: 24px;
	border-left: 1px solid #e8e8e8;
}

.ai-recommendations-list .recruit-apply {
	display: flex;
	align-items: center;
	width: 94px;
	flex: 0 0 auto;
}

.ai-recommendations-list .recruit-content .congratulations-passing {
	display: inline-flex;
	align-items: center;
	border: 1px solid rgba(255, 195, 46, .3);
	font-size: 13px;
	line-height: 20px;
	color: #333;
	margin-bottom: 8px;
	background-color: #fffcf5;
	padding: 3px 8px;
	border-radius: 2px;
}

.ai-recommendations-list .recruit-content .company {
	display: flex;
	align-items: center;
	margin-bottom: 4px;
}

}
.tplBtn, .bookmark {
	position: relative;
	overflow: hidden;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	line-height: normal;
	white-space: nowrap;
}

.bookmark {
	position: relative;
	display: inline-block;
	background-image: url(/img/bookmark-check.svg);
	background-repeat: no-repeat;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-position: 0px 0px;
}

.bookmark.On {
	background-image: url(/img/bookmark-check-fill.svg);
}

.ai-recommendations-list .recruit-content .headers {
	display: flex;
	min-width: 0;
	align-items: center;
}

.ai-recommendations-list .recruit-content .title {
	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-all;
	font-size: 18px;
	line-height: 26px;
	color: #222;
	font-weight: 700;
}

.ai-recommendations-list .recruit-content .recruitment .item {
	display: flex;
	align-items: center;
	font-size: 13px;
	line-height: 20px;
	color: #6a6a6a;
}

.ai-recommendations-list .recruit-content .recruitment .item:not(:first-child):before
	{
	content: "";
	display: block;
	width: 1px;
	height: 12px;
	margin-left: 8px;
	margin-right: 8px;
	background-color: #e8e8e8;
}

.ai-recommendations-list .recruit-content .job {
	margin-top: 16px;
	font-size: 13px;
	line-height: 20px;
	color: #6a6a6a;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.ai-recommendations-list .recruit-content .recruitment {
	display: flex;
	margin-top: 4px;
}

.ai-recommendations-list .recruit-apply .button.homepage {
	background-color: #5288ff;
}

.ai-recommendations-list .recruit-apply button {
	display: block;
	width: 100%;
	height: 32px;
	font-size: 12px;
	line-height: 18px;
	font-weight: 600;
	color: #fff;
	border-radius: 4px;
	background-color: #ff501b;
}

.tplBtnBlue {
	background: #39f;
}

.tplBtn_1 {
	font-weight: bold;
	padding: 7px 10px 7px 10px;
}

.tplBtn_1 span {
	color: #fff;
}

.tplBtn span, bookmark span {
	position: relative;
	white-space: nowrap;
}

.ai-recommendations-list .recruit-apply .deadline {
	margin-top: 8px;
	text-align: center;
	font-size: 12px;
	line-height: 18px;
	color: #6a6a6a;
}

.ai-recommendations-list .recruit-apply {
	display: flex;
	align-items: center;
	width: 94px;
	flex: 0 0 auto;
}

.ai-recommendations-list .recruit-apply-wrap {
	width: 100%;
}

.tab_content .tab_panel{
	display: none;
} 
.tab_content .tab_panel.active{
	display: block;
} 
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main class="mtuHome">
		<div class="contWrap inner">
			<div class="mtuTab devFixedTab">
				<div class="tabs">
					<button class="on" data-flag="AI_panel">AI추천</button>
					<button data-flag="bookmark_panel">스크랩 공고</button>
					<button data-flag="recent_panel">최근 본 공고</button>
				</div>
			</div>

			<!-- 스마트매치 -->
			<div class ="tab_content">
				<div id="AI_panel" class="tab_panel active">
					<h2 class="skip">스마트매치 리스트</h2>
					<div class="ai-recommendations-list" id="smartMatch">	
						 <input type="hidden" id="PageFlag" value="AI">
						<ul>
						<c:forEach var="item" items="${aiList }">
							<li>
							  	<input type="hidden" class="posting_id" value ="${item.po_id}">
								<div class="recruit-content">
									<div class="congratulations-passing">
										<span>합격축하금 100만원</span>
									</div>
									<div class="company">
										<a class="company" href="#" target="_blank">
											<div class="name">${item.com_name}</div>
										</a>
									</div>
									<div class="headers">
										<a href="#"
											target="_blank" class="title">${item.po_title} Backend 개발자</a>
										<c:choose>
									        <c:when test="${not empty item.ub_boolean and item.ub_boolean == 1}">
									            <button type="button" class="bookmark On"></button>
									        </c:when>
									        <c:otherwise>
									            <button type="button" class="bookmark"></button>
									        </c:otherwise>
									    </c:choose>
									</div>
									<a class="devLinkRecruit"
										href="#"
										target="_blank">
										<div class="recruitment">
											<div class="item">${item.po_grade}초대졸↑</div>
											<div class="item">${item.career}경력8년↑</div>
											<div class="item">${item.com_address}서울 &gt; 강서구</div>
										</div>
										<div class="job">${item.po_content}백엔드개발자</div>
									</a>
								</div>
								<div class="recruit-apply">
									<div class="recruit-apply-wrap">
										<button type="button"
											class="tplBtn tplBtn_1 ">
											<span>즉시지원</span>
										</button>
										<div class="deadline">
										 <span>~${item.stringDay} </span>
										</div>
									</div>
								</div>
							</li>		
						</c:forEach>
							
							<li>
								<div class="recruit-content">
									<div class="congratulations-passing">
										<span>합격축하금 100만원</span>
									</div>
									<div class="company">
										<a class="company" href="#" target="_blank">
											<div class="name">나무기술㈜</div>
										</a>
									</div>
									<div class="headers">
										<a href="#"
											target="_blank" class="title">클라우드 관리시스템 Backend 개발자</a>
										<button type="button"
											class="bookmark"
											data-mem-sys="877816"></button>
									</div>
									<a class="devLinkRecruit"
										href="#"
										target="_blank">
										<div class="recruitment">
											<div class="item">초대졸↑</div>
		
											<div class="item">경력8년↑</div>
											<div class="item">서울 &gt; 강서구</div>
										</div>
										<div class="job">백엔드개발자</div>
									</a>
								</div>
								<div class="recruit-apply">
									<div class="recruit-apply-wrap">
										<button type="button"
											class="tplBtn tplBtn_1 ">
											<span>즉시지원</span>
										</button>
										<div class="deadline">
											~05.19 <span>(일)</span>
										</div>
									</div>
								</div>
							</li>
							<li class="">
								<div class="recruit-content">
									<div class="company">
										<a class="company"
											href="#"
											target="_blank">
											<div class="name">㈜위즈코리아</div>
										</a>
										<button type="button"
											class="bookmark tplBtnFavOff js-tplBtn FavGA"
											data-mem-sys="279808"></button>
									</div>
									<div class="headers">
										<a href="#"
											target="_blank" class="title">㈜위즈코리아 `24년도 상반기 직무별 신입/경력자
											정기채용</a>
										<button type="button"
											class="bookmark tplBtnFavOff"
											data-mem-sys="279808"></button>
									</div>
									<a class="devLinkRecruit"
										href="#"
										target="_blank">
										<div class="recruitment">
											<div class="item">초대졸↑</div>
											<div class="item">신입·경력3년↑</div>
											<div class="item">서울, 대전, 광주, 대구</div>
										</div>
										<div class="job">
											경영·비즈니스기획,웹기획,총무,법무담당자,비서 <span>외 15건</span>
										</div>
									</a>
								</div>
		
								<div class="recruit-apply">
	 							  <div class="recruit-apply-wrap">	
										<button type="button"
											class="tplBtn tplBtn_1"
											onclick="GA_Event('마이페이지_PC', '추천공고', '즉시지원')">
											<span>즉시지원</span>
										</button>
		
		
										<div class="deadline">
											~06.02 <span>(일)</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id ="bookmark_panel" class="tab_panel">
					<h2>북마크</h2>
					<div class="ai-recommendations-list">	
						 <input type="hidden" id="PageFlag" value="BookMark">
						<ul></ul>
					</div>
				</div>
				<div id="recent_panel" class="tab_panel">
					<h2>최근본 공고</h2>
				</div>
			</div>
			
		</div>
	</main>

	<footer>
		<%@include file="/WEB-INF/include/Footer.jsp"%>
	</footer>

	<script>
	document.addEventListener('DOMContentLoaded', function() {
		
		
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
		            if (flag === 'bookmark_panel') {
		                // 여기에 스크랩 공고 클릭 시 실행할 코드를 추가합니다.
		                console.log('스크랩 공고 버튼이 클릭되었습니다.');
		                // 예: 스크랩 공고 데이터를 불러오는 함수 호출
		                loadBookmarkData();
		            }
			  });
			
		});//tabs
		
		
		
		
		
	    let	booksEl = document.querySelectorAll('.bookmark');
		//bookmark 
		 // 북마크 요소에 클릭 이벤트 리스너 추가
	    booksEl.forEach((onebook, index) => {
	        onebook.addEventListener('click', function() {
	            // 북마크 요소의 자식 요소인 버튼 선택
  
	            // bookmarkOn 클래스가 존재하지 않을 경우 insert
	                //필요한거 po_id
	                //user_id  <-- 근데 이거는 시큐리티 세션이 가지고 있음
	              
	                const postingId = this.closest('li').querySelector('.posting_id').value;      
	                console.log(postingId); 
	                
	            if (onebook.classList.contains('On')) {
	                // bookmarkOn 클래스가 이미 존재할 경우 update
	                onebook.classList.remove('On');
	                alert('테스트 클래스가 제거됩니다.');   
	                deleteBookMark(postingId);
	            } else {
	                
	                addBookMark(postingId);  
	                onebook.classList.add('On');
	                alert('테스트 클래스가 추가됩니다.');
	            }
	        });
	    });
		
		
	    function addBookMark(postingId){
			fetch(`/Bookmarks/addBook`,{
				method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ po_id: postingId })
				
			}).then(response => {
		        if (!response.ok) {
		            throw new Error('Failed to toggle bookmark');
		        }
		        return response.text(); 
		        
		    }).then(booktext => {
		    	console.log(booktext);
		    	
		    }).catch(error => console.error('Error toggling bookmark:', error));
				
		}
	    function deleteBookMark(postingId){
			fetch(`/Bookmarks/deleteBook`,{
				method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ po_id: postingId })
				
			}).then(response => {
		        if (!response.ok) {
		            throw new Error('Failed to toggle bookmark');
		        }
		        return response.text(); 
		        
		    }).then(booktext => {
		    	console.log(booktext);
		    	
		    }).catch(error => console.error('Error toggling bookmark:', error));
				
		}
	    function loadBookmarkData() {
	        // 스크랩 공고 데이터를 불러오는 로직을 여기에 추가합니다.
	        console.log('스크랩 공고 데이터를 불러옵니다.');
	        // 예: fetch 요청을 사용하여 데이터를 불러오기
	        fetch('/Bookmarks/overall/load')
	            .then(response => response.json())
	            .then(data => {
	                console.log('스크랩 공고 데이터:', data);
	                // 데이터를 화면에 표시하는 로직 추가
	                displayBookmarkData(data);
	            })
	            .catch(error => console.error('Error loading bookmark data:', error));
	    }
	    
	    function displayBookmarkData(data) {
	        const bookmarkPanel = document.querySelector('#bookmark_panel .ai-recommendations-list ul');
	        console.log(bookmarkPanel);
	        bookmarkPanel.innerHTML = ''; // 기존 내용을 초기화합니다.

	        data.forEach(item => {
	            const li = document.createElement('li');
	            li.innerHTML = `
	                <input type="hidden" class="posting_id" value="\${item.po_id}">
	                <div class="recruit-content">
	                    <div class="congratulations-passing">
	                        <span>합격축하금 100만원</span>
	                    </div>
	                    <div class="company">
	                        <a class="company" href="#" target="_blank">
	                            <div class="name">${item.com_name}</div>
	                        </a>
	                    </div>
	                    <div class="headers">
	                        <a href="#" target="_blank" class="title">\${item.po_title} Backend 개발자</a>
	                        <button type="button" class="bookmark \${item.ub_boolean ? 'On' : ''}"></button>
	                    </div>
	                    <a class="devLinkRecruit" href="#" target="_blank">
	                        <div class="recruitment">
	                            <div class="item">\${item.po_grade} 초대졸↑</div>
	                            <div class="item">\${item.career} 경력8년↑</div>
	                            <div class="item">\${item.com_address} 서울 &gt; 강서구</div>
	                        </div>
	                        <div class="job">\${item.po_content} 백엔드개발자</div>
	                    </a>
	                </div>
	                <div class="recruit-apply">
	                    <div class="recruit-apply-wrap">
	                        <button type="button" class="tplBtn tplBtn_1">
	                            <span>즉시지원</span>
	                        </button>
	                        <div class="deadline">
	                            <span></span>
	                            
	                        </div>
	                    </div>
	                </div>
	            `;
	            bookmarkPanel.appendChild(li);
	        });
	    }

	});//DOMContentLoaded	
    </script>

</body>

</html>






