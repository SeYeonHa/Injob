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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />


<style>

body{
 background-color: #f2f4f7;
}
.my-content-top {
	padding: 30px 30px 20px;
	box-sizing: border-box;
	position: relative;
}

.my-content-top .my-profile-wrap {
	position: absolute;
	left: 15px;
	top: 30px;
	
}
.my-content-top .my-profile-wrap #resumePerEl{
   text-decoration: underline;
   color: blue;;
   margin-top: 10px;
   display: inline-block;
}
.my-profile {
	position: relative;
}

.my-profile .pie-chart {
	/* background: conic-gradient(rgb(0, 42, 255) 0%, rgb(0, 42, 255) 70%,
		rgb(244, 244, 244) 20%, rgb(244, 244, 244) 100%); */
	position: relative;
	width: 110px;
	height: 110px;
	border-radius: 50%;
	transition: background 3s ease;
}

.my-profile .profile-img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	background: url(/img/man-profil.png) no-repeat center;
	background-size: contain;
	border: 3px solid #fff;
	box-sizing: border-box;
}

.my-profile .profile-btn {
	position: absolute;
	bottom: 3px;
	right: 2px;
	z-index: 1;
	width: 30px;
	height: 30px;
	background: url(/img/camera.png) no-repeat center;
	background-size: contain;
	border-radius: 50%;
	overflow: visible;
	cursor: pointer;
}

.my-career {
	display: block;
	font-size: 13px;
	letter-spacing: 0px;
	color: #002aff;
	margin-top: 10px;
}

.my-status-wrap {
	padding-left: 130px;
}

.my-status-wrap .my-status-top {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
}

.my-status-wrap .badge.status-incomplete {
	color: rgba(255, 0, 0, 0.7);
	border: 1px solid rgba(255, 0, 0, 0.7);
}

.my-status-wrap .badge {
	position: relative;
	width: auto;
	height: 24px;
	font-size: 12px;
	letter-spacing: 0px;
	line-height: 24px;
	color: #222222;
	padding: 0 12px;
	border-radius: 28px;
	border: 1px solid #222222;
	background-color: #ffffff;
	margin: 0;
}

.user-status-title {
	display: flex;
	align-items: baseline;
	justify-content: space-between;
}

.user-status-title h1 {
	display: flex;
	align-items: baseline;
	max-width: 90%;
	font-size: 24px;
	letter-spacing: -0.5px;
	line-height: 30px;
	color: #222222;
	white-space: nowrap;
}

.my-status-wrap .my-status-box {
	display: inline-block;
	width: 100%;
	font-size: 14px;
	letter-spacing: 0px;
	line-height: 22px;
	border: 1px solid #e8e8e8;
	padding: 16px;
	margin: 20px 0;
	box-sizing: border-box;
}



.my-status-wrap .my-status-list {
	display: flex;
	align-items: baseline;
	position: relative;
}

.my-status-wrap .my-status-list h5 {
	min-width: 65px;
	font-size: 13px;
	letter-spacing: 0px;
	font-weight: 500;
	line-height: 20px;
	color: #222222;
	margin-right: 8px;
}

.my-status-wrap .my-status-list .expand {
	position: relative;
	width: 100%;
}

.my-status-wrap .my-status-list ~ .my-status-list {
	margin-top: 8px;
}

.my-status-wrap .no-data {
	font-size: 13px;
	letter-spacing: 0px;
	line-height: 20px;
	color: #002aff;
}

.my-status-wrap .my-status-box .status a {
	
	font-weight: bold;
	color: #222222;
	padding-right: 20px;
}

.mtuHome {
	margin-top: 0;
}

.box-contents {
	border: none;
}

.my-status-wrap .my-status-list .expand .expand-list {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	gap: 8px;
	max-height: 30px;
	line-height: 30px;
	overflow: hidden;
}

.my-status-wrap .my-status-list .expand .skill-list li {
	color: #3b65ff;
	background-color: #f0f5ff;
}

.my-status-wrap .my-status-list .expand .expand-list li {
	height: 30px;
	font-size: 12px;
	letter-spacing: 0px;
	line-height: 30px;
	width: auto;
	padding: 0 12px;
	border-radius: 99px;
}

.my-content-bottom .my-active-list {
	display: flex;
	flex-direction: row;
	width: 100%;
	border-top: 1px solid #ebebee;
}

.my-content-bottom .my-active-list .list {
	position: relative;
	width: calc(100%/ 5);
}

.my-content-bottom .my-active-list .list a {
	display: inline-block;
	width: 100%;
	height: 60px;
	padding: 21px 0;
	text-align: center;
	box-sizing: border-box;
}

.my-content-bottom .my-active-list .list a .title {
	font-size: 14px;
	letter-spacing: 0px;
	color: #333333;
}

.my-content-bottom .my-active-list .list a .tooltip p {
	color: #fff;
	white-space: nowrap;
}

.my-content-bottom .my-active-list .list:nth-child(n+2) {
	border-left: 1px solid #ebebee;
}

.my-content {
	
	margin-bottom: 20px;
}

.mtuHome .contWrap {
	border: none;
	background: none;
}
.my-content-bottom h2{
	font-size: 22px;
    letter-spacing: -.5px;
    line-height: 30px;
    margin-bottom: 24px;
    margin-left: 10px
}
.activity{
 background-color : #fff;
 border: 1px solid #dce1eb;
}
.tab_content{
background-color : #fff;
}
/*  */
/*  */
/*  */
/*  */

.mtuTab{
 margin-bottom: 0;
}


.aislide  .listCell {
	display: block;
	cursor: pointer;
	border: 1px solid #e8e8e8;
	box-sizing: border-box;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, .05);
	border-radius: 8px;
	width: 80%;
	height: 280px;
	position: relative;
	transition: .3s;
	color: #333;
	padding: 5px;
}



.aislide  .listCell .pLogo {
	position: relative;
	height: 130px;
	overflow: hidden;
	border-radius: 8px 8px 0 0;
	z-index: -1;
}

.aislide  .listCell .pLogo img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	display: block;
	border: 0;
	vertical-align: top;
	padding: 0;
	margin: 0
}

.aislide  .listCell .listCont {
	padding: 25px 24px 16px;
	margin: -1px;
	border-top: 1px solid rgba(0, 0, 0, .05);
	position: relative;
}
/* posNm */
.aislide  .listCell .listCont .pCor {
	display: flex;
	align-items: center;
}

.aislide  .listCell .listCont .pCor .posNm {
	max-width: calc(100% - 23px);
	font-weight: 700;
	font-size: 15px;
	letter-spacing: 0;
	line-height: 22px;
	color: #171717;
	display: inline-block;
	margin: 0 7px 0 0;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.aislide  .listCell .listCont pTit {
	margin: 12px 0 0;
	font-size: 16px;
	letter-spacing: 0;
	color: #171717;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.aislide  .listCell .listCont .pInfo {
	margin: 4px 0 0;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.aislide  .listCell .listCont .pInfo span {
	color: #6a6a6a;
	font-size: 13px;
	letter-spacing: 0;
	line-height: 22px;
	padding: 0 8px 0 0;
	position: relative;
}

.aislide  .listCell .listCont .pInfo .pPart:after {
	content: "";
	display: inline-block;
	width: 1px;
	height: 10px;
	background-color: #d2d2d2;
	position: absolute;
	right: 0;
	top: 50%;
	transform: translateY(-50%);
}

.aislide  .listCell .listCont .pInfo .pAddress {
	padding: 0 0 0 8px;
}

.aislide  .listCell .listCont .pStackBox {
	margin: 12px 0 0;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	height: 16px;
	overflow: hidden;
}

.aislide  .listCell .listCont .pStackBox span {
	color: #9e9e9e;
	font-size: 12px;
	letter-spacing: 0;
	line-height: 16px;
	position: relative;
	display: inline-block;
}

.aislide  .listCell .listCont .pStackBox pStack {
	max-width: 236px;
	display: inline-block;
	font-size: 0;
}

.aislide  .listCell .listCont .pStackBox .pStack tag
	{
	max-width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.aislide  .listCell .listFoot {
	padding: 16px 0 24px;
	margin: 0 24px;
	border-top: 1px solid #e8e8e8;
}

.aislide  .listCell .listFoot .pAssist {
	font-size: 14px;
	letter-spacing: 0;
	line-height: 22px;
	color: #171717;
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.recruitList_tit {
    font-size: 22px;
    letter-spacing: -.5px;
    line-height: 30px;
    margin-bottom: 24px;
    position: absolute;
    left: 10px;
    top: 10px
}
 .swiper {
      width: 100%; /* 예를 들어 전체 화면의 80%로 설정 */
      height: 377px; /* 슬라이더의 높이 설정 */
      margin: auto; /* 슬라이더를 가운데 정렬 */
      padding: 62px 50px;
      background-color: #fff;
      border: 1px solid #dce1eb;
      margin-bottom: 20px;
    }
    .swiper-slide{
	box-sizing: border-box;
	padding-right:  6px;
}
.swiper-button-next{
	right: 10px;
}

    /* 개별 슬라이드의 넓이를 조정합니다 */
    
    /* 내비게이션 버튼 스타일 */
    .swiper-button-prev, .swiper-button-next {
      color: #000; /* 버튼 색상 설정 */
    }
    .swiper-scrollbar{
    display: none;
    }
    .swiper-wrapper{
     margin-left: 30px;
    }
    .listCont div span, .listCont div{
      width: 100%; /* 원하는 너비 설정 */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
    }
    .listCont .last_date{
    	position: absolute;
    	top: 27px;
    	right: 25px;
    	width: 50px;
    	height: 30px;
    	line-height:28px;
    	text-align:center;
    	background-color: orange;
    	color: #fff;
    }
    .listCont .pTit{
     width: 150px;
    }
    
    /* Modal Background */
        .modal-background {
            display: none; /* Initially hidden */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            overflow-y: auto; /* 높이가 초과되면 세로 스크롤 추가 */
            justify-content: center;
            align-items: center;
            z-index: 9999; /* High z-index to ensure it is on top */
            /*  dsds*/
        }

        /* Modal Container */
        .modal-container {
            width: 880px;
            height: 557px;
            background: white;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 10000; /* Ensure it is above the background */
            overflow-y: auto; /* 높이가 초과되면 세로 스크롤 추가 */
            
        }

        /* Close Button */
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

       /* Prevent background interaction when modal is open */
      body.modal-open {
          overflow: hidden;
      }
      .popup-section{
      margin: 0 auto;
      }
      .popup-section .step{
        width: 100px;
        height: 30px;
        background: url('/img/question1.png') no-repeat center center;
        background-size: contain; 
        margin: 30px auto;
       
      }
      .popup-header{
       width: 80%;
       margin: 0 auto;
       text-align: center;
      }
      .popup-header h2{
         width: 100%;
         margin: 5px 0;
      }
      .popup-header .text{
       width: 100%;
       margin: 5px 0;
      }
      .category-list {
       display: flex;
       flex-wrap: wrap;
       justify-content: center;
       margin-top: 20px;
      }
       .category-list .category-list-item {
          margin: 0 6px 13px 6px;
      }
      .category-list .category-list-item.on{
       border: 1px solid black;
      }
       .category-list li {
          display: inline-block;
      }
      li {
          list-style: none;
      }
       .category-list .category-list-item input {
          display: none;
      }
      input, select, button {
          vertical-align: middle;
      }
      select, input, option, textarea {
          vertical-align: middle;
          font-size: 12px;
          letter-spacing: 0px;
          color: #666;
}
 .category-list .category-list-item label {
    display: inline-block;
    height: 42px;
    padding: 12px 15px 0;
    border: 1px solid #ddd;
    border-radius: 3px;
    font-size: 13px;
    letter-spacing: 0px;
    color: #333;
    transition: all 0.2s ease-in-out;
    box-sizing: border-box;
}
label {
    cursor: pointer;
    vertical-align: middle;
}
.rank-selection {
    margin-bottom: 20px;
}

.rank-label {
   
}
.rankpup{
 display: flex;
 justify-content: center;
 align-items: center;
  margin: 20px 0;
}

.priority-select {
    width: 89px;  /* 넓이 설정 */
    height: 36px; /* 높이 설정 */
    margin-right: 10px;
    font-weight: bold;
    font-size: 1rem;
}
 .popup-footer {
    
    width: calc(100% - 15px);
    height: 135px;
    margin: 20px auto;
    z-index: 30;
    display: flex;
    justify-content: center;
    align-items: center;

}
 .popup-footer .button {
   
    bottom: 30px;
    width: 180px;
    height: 57px;
    background: green;
    font-size: 18px;
    letter-spacing: 0px;
    color: #fff;
}
#select_resume{
 width: 140px;
 margin-right: 8px;
 height: 30px;
 line-height: 40px;
 font-size: 18px;
 padding: 5px;
 box-sizing: border-box;
}
#select_resume option{

}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>
		
		  
		   
		 <!-- <div id ="right_wrap"> </div>right_wrap -->
	
		<div class="container-ha">
			<section class="box align_right">
				<!--  사이드바  -->
				
				

				<div class="box-contents">
					 
						<div class="mtuHome">
						 
		                  	<%@include file="/WEB-INF/include/aside.jsp"%>
							<div class="contWrap">
							 
								<div class="my-content">
								
									<!-- Slider main container -->
				<div class="swiper aislide">
				<p class="recruitList_tit"><strong>강재영님</strong>의 활동 기반 맞춤공고</p>
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<c:forEach var="item" items="${aiList}" begin="0" end="4">
			                <div class="swiper-slide">
			                    <a href="/Detail/Detail?po_id=${item.po_id} " class="listCell">
			                        <div class="pLogo"><img src="/img/${item.po_profile}.jpg" alt="Company Logo"></div>
			                        <div class="listCont">
			                            <p class ="last_date">D-${item.daysRemaining}</p>
			                            <div class="pCor">
			                                <span class="posNm">${item.com_name}</span>
			                            </div>
			                            <div class="pTit">${item.po_title}</div>
			                            <div class="pInfo">
			                                <span class="pPart">${item.com_address}</span>
			                                <span class="pAddress"> ${item.career}</span>
			                            </div>
			                            <div class="pStackBox">
			                                <span class="tag tag-tack">${item.po_content}</span>
			                                <!-- <span class="tag tag-tack">java</span>
			                                <span class="tag tag-tack">html</span> -->
			                            </div>
			                        </div><!-- listCount -->
			                    </a>
			                </div>
			            </c:forEach>		
						
						
						
						
					</div>
					
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>

					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>

					<!-- If we need scrollbar -->
					<div class="swiper-scrollbar"></div>
				</div>
				                  <div class ="activity">
									<section class="my-content-top">
										<div class="my-profile-wrap">
											<div class="my-profile">
												<div class="pie-chart">
													<div class="profile-img">
														<p class="img">
															<img src="">
														</p>
													</div>
												</div>
												<button class="profile-btn" onclick="location.href=`/Mypage/Resume?user_id=${user_id}&nowpage=1`" type="button"></button>
											</div>
											<a id="resumePerEl" href="/Mypage/Resume?user_id=${user_id}&nowpage=1">이력서 50% 완성</a>
										</div>
										<!-- my-profile-wrap -->
										<div class="my-info-wrap">
											<div class="my-status-wrap">
												<div class="my-status-top">
													<div class="badge status-incomplete">이력서 미완성</div>
												</div>
												<!-- my-status-top이력서posion -->
												<div class="user-status-title">
													<h1>
														<span id="school_name">구덕고등학교</span>
													</h1>
													<select title="1번이력서" id="select_resume" class="select_resume">
												        <c:forEach var="resume" items="${resumeList}" varStatus="status">
												            <option value="${status.index + 1}">${status.index + 1}번이력서</option>
												        </c:forEach>
												    </select>
												</div>
												<div class="my-status-box">
													<p class="status">
														<a href="/Mypage/Resume?user_id=${user_id}" target="_blank"> 구덕고등학교졸업 > </a>
													</p>	
												</div>
												<div class="my-status-list">
													<h5 class="list-title">보유스킬</h5>
													<div class="expand">
														<ul class="skill-list expand-list">
															<li>JAVA</li>
															<li>Spring Boot</li>
															<li>JPA</li>
															<li>ORM</li>
															<li>MyBatis</li>
															<li>OracleDB</li>
															<li>RDBMS</li>
															<li>분석력</li>
														</ul>
													</div>
												</div>
												<div class="my-status-list">
													<h5 class="list-title">구직 선호도</h5>
													<a href="#" class="no-data" id="openModal">이직 시 연봉상승 vs 워라벨 당신의 선택은? </a>
												</div>
											</div>
										</div>
										<!-- my-info-wrap -->
									</section>
									<div class="my-content-bottom">
										<h2 class="skip">주요활동내역</h2>
										<ul class="my-active-list">
											<li class="list"><a class="box-botton"
												href="/Mypage/Resume?user_id=${user_id}">
													<p class="title">
														지원완료 <strong class="count">0</strong>
													</p>
											</a></li>
											<li class="list"><a class="box-botton"
												href="/Mypage/Resume?user_id=${user_id}">
													<p class="title">
														이력서 열람 <strong class="count">0</strong>
													</p>
											</a></li>
											<li class="list"><a class="box-botton"
												href="/User/PositionOffer?tabStat=1#dev-tab-position">
													<p class="title">
														포지션 제안 <strong class="count">0</strong>
													</p>
											</a></li>
											<li class="list"><a class="box-botton"
												href="/User/Scrap/Index" onclick=>
													<p class="title">
														스크랩 공고 <strong class="count">${bookCount}건</strong>
													</p>
													<div class="tooltip mtuSpImgBefore mtuSpImgAfter">
														<p>
															이번주 마감 <strong>1</strong>건
														</p>
													</div>
											</a></li>
											<li class="list"><a class="box-botton"
												href="/User/FavorCo">
													<p class="title">
														관심기업공고 <strong class="count">22</strong>
													</p>
													<div class="tooltip mtuSpImgBefore mtuSpImgAfter">
														<p>
															이번주 마감 <strong>8</strong>건
														</p>
													</div>
											</a></li>
										</ul>
									</div>
								  </div>
								</div>
								<div class="allcontent">
									<div class="mtuTab devFixedTab">
										<div class="tabs">
											<button class="on" data-flag="AI_panel">AI추천</button>
											<button data-flag="bookmark_panel">스크랩 공고</button>
											<button data-flag="recent_panel">최근 본 공고</button>
										</div>
									</div>

								<!-- 스마트매치 -->
								<div class="tab_content">
									<div id="AI_panel" class="tab_panel active">
									
										<div class="ai-recommendations-list" id="smartMatch">
											<input type="hidden" id="PageFlag" value="AI">
											<ul>
												<c:forEach var="item" items="${aiList }">
													<li><input type="hidden" class="posting_id"
														value="${item.po_id}">
														<div class="recruit-content">
															<div class="congratulations-passing">
																<span>합격축하금 100만원</span>
															</div>
															<div class="company">
																<a class="company"
																	href="/SaveCookie?po_id=${item.po_id}"
																	>
																	<div class="name">${item.com_name}</div>
																</a>
															</div>
															<div class="headers">
																<a href="/SaveCookie?po_id=${item.po_id}"
																	 class="title">${item.po_title}
																	Backend 개발자</a>
																<c:choose>
																	<c:when
																		test="${not empty item.ub_boolean and item.ub_boolean == 1}">
																		<button type="button" class="bookmark On"></button>
																	</c:when>
																	<c:otherwise>
																		<button type="button" class="bookmark"></button>
																	</c:otherwise>
																</c:choose>
															</div>
															<a class="devLinkRecruit"
																href="/SaveCookie?po_id=${item.po_id}" >
																<div class="recruitment">
																	<div class="item">${item.po_grade}초대졸↑</div>
																	<div class="item">${item.career}경력8년↑</div>
																	<div class="item">${item.com_address}서울&gt;강서구</div>
																</div>
																<div class="job">${item.po_content}백엔드개발자</div>
															</a>
														</div>
														<div class="recruit-apply">
															<div class="recruit-apply-wrap">
																<button type="button" class="tplBtn tplBtn_1 ">
																	<span>즉시지원</span>
																</button>
																<div class="deadline">
																	<span>~${item.stringDay} </span>
																</div>
															</div>
														</div></li>
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
															<a href="#" target="_blank" class="title">클라우드 관리시스템
																Backend 개발자</a>
															<button type="button" class="bookmark"
																data-mem-sys="877816"></button>
														</div>
														<a class="devLinkRecruit" href="#" target="_blank">
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
															<button type="button" class="tplBtn tplBtn_1 ">
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
															<a class="company" href="#" target="_blank">
																<div class="name">㈜위즈코리아</div>
															</a>
															<button type="button"
																class="bookmark tplBtnFavOff js-tplBtn FavGA"
																data-mem-sys="279808"></button>
														</div>
														<div class="headers">
															<a href="#" target="_blank" class="title">㈜위즈코리아
																`24년도 상반기 직무별 신입/경력자 정기채용</a>
															<button type="button" class="bookmark tplBtnFavOff"
																data-mem-sys="279808"></button>
														</div>
														<a class="devLinkRecruit" href="#" target="_blank">
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
															<button type="button" class="tplBtn tplBtn_1"
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
									<div id="bookmark_panel" class="tab_panel">
										<div class="ai-recommendations-list">
											<input type="hidden" id="PageFlag" value="BookMark">
											<ul></ul>
										</div>
									</div>
									<div id="recent_panel" class="tab_panel">
										<div class="ai-recommendations-list">
											<input type="hidden" id="PageFlag" value="Cookie">
											<ul></ul>
										</div>
									</div>
								</div>
                              </div>
							</div>
							<%@include file="/WEB-INF/include/rightAside.jsp"%>
						</div>

					
				</div>
			</section>
		</div>
		</main>
		 <!-- Modal Structure -->
       <div class="modal-background" id="modalBackground">
           <div class="modal-container">
               <button class="close-button" id="closeModal">&times;</button>
               <div class="popup-section">
                   <div class="step">
                    
                  </div>
                  <div class="popup-header">
                      <h2 class="title">원하시는 복지를 선택해주세요</h2>
                      <p class="text">질문지를 받아 좋은 기업을 추천해 드려요</p>
                   </div>
                   <div class="popup-body">
                     <ul class="category-list" id="welfare">
                       <li class="category-list-item">
                      <input type="checkbox" data-code="4대보험" data-type="welfare" >
                      <label for="1st-list-item1" >4대 보험</label>
                    </li>
                    <li class="category-list-item q1">
                      <input type="checkbox"  data-code="식대" data-type="welfare" >
                      <label for="1st-list-item2" >식사 제공</label></li>
                    <li class="category-list-item q1">
                      <input type="checkbox"  data-code="교통비" data-type="welfare" >
                      <label>교통비 지원</label>
                    </li> 
                    <li class="category-list-item q1">
                      <input type="checkbox"  data-code="커피" data-type="welfare" >
                      <label>커피 제공</label>
                    </li>
                    <li class="category-list-item q1">
                      <input type="checkbox"  data-code="헬스장" data-type="welfare" >
                      <label>헬스장 이용</label>
                    </li>          
                   </ul>            
                </div>
                <div class="step">
                    
                  </div>
                  <div class="popup-header">
                      <h2 class="title">원하시는 연봉을 선택해주세요</h2>
                      <p class="text">눈치 보지 말고 원하시는 금액을 적어주세요</p>
                   </div>
                   <div class="popup-body">
                     <ul class="category-list" id="salary">
                       <li class="category-list-item">
                      <input type="checkbox"  data-code="2500" data-type="salary" >
                      <label >2500이상</label>
                    </li>
                    <li class="category-list-item q2">
                      <input type="checkbox"  data-code="3000" data-type="salary" >
                      <label for="1st-list-item2" >3000이상</label></li>
                    <li class="category-list-item q2">
                      <input type="checkbox"  data-code="3500" data-type="salary" >
                      <label >3500이상</label>
                    </li>
                    <li class="category-list-item q2">
                      <input type="checkbox"  data-code="4000" data-type="salary" >
                      <label  >4000이상</label>
                    </li>  
                    <li class="category-list-item q2">
                      <input type="checkbox"  data-code="4500" data-type="salary" >
                      <label  >4500이상</label>
                    </li>  
                    <li class="category-list-item q2">
                      <input type="checkbox"  data-code="5000" data-type="salary" >
                      <label  >5000이상</label>
                    </li>          
                   </ul>            
                </div>
                <div class="step">
                    
                  </div>
                  <div class="popup-header">
                      <h2 class="title">원하시는 근무 지역을 선택해 주세요</h2>
                      <p class="text">근무지가 가까우면 능률이 오릅니다.</p>
                   </div>
                   <div class="popup-body">
                     <ul class="category-list" id="region">
                       <li class="category-list-item">
                      <input type="checkbox"  data-code="서울" data-type="location" >
                      <label for="1st-list-item1" >서울</label>
                    </li>
                    <li class="category-list-item">
                      <input type="checkbox"  data-code="경기" data-type="location" >
                      <label for="1st-list-item2" >경기</label></li>
                    <li class="category-list-item">
                      <input type="checkbox"  data-code="인천" data-type="location" >
                      <label for="1st-list-item3" >인천</label>
                    </li>
                    <li class="category-list-item">
                      <input type="checkbox"  data-code="대구" data-type="location" >
                      <label for="1st-list-item4" >대구</label>
                    </li>
                    <li class="category-list-item">
                      <input type="checkbox"  data-code="부산" data-type="location" >
                      <label for="1st-list-item5" >부산</label>
                    </li>
                    <li class="category-list-item">
                      <input type="checkbox" data-code="제주" data-type="location" >
                      <label for="1st-list-item6" >제주</label>
                    </li>
                   </ul>            
                </div>
                <div class="popup-header">
                      <h2 class="title">순위를 정해주세요</h2>
                      <p class="text">순위에 따른 점수를 부과하여 더 좋은 기업을 추천해 드려요</p>
                      
                </div>
                <div class="popup-body rankpup">
                   <div class="rank-selection">
                    <label for="priority1" class="rank-label">1순위</label>
                    <select id="priority1" class="priority-select">
                        <option value="welfare">복지</option>
                        <option value="salary">연봉</option>
                        <option value="location">근무지역</option>
                    </select>
                </div>
                <div class="rank-selection">
                    <label for="priority2" class="rank-label">2순위</label>
                    <select id="priority2" class="priority-select">
                        <option value="welfare">복지</option>
                        <option value="salary">연봉</option>
                        <option value="location">근무지역</option>
                    </select>
                </div>
                <div class="rank-selection">
                    <label for="priority3" class="rank-label">3순위</label>
                    <select id="priority3" class="priority-select">
                        <option value="welfare">복지</option>
                        <option value="salary">연봉</option>
                        <option value="location">근무지역</option>
                    </select>
                </div>
                
                </div>
                <div class="popup-footer">
                  <button type="button" class="button" id="QuestionSave" style="">저장하기</button>
                </div> 
                  
                   
            </div>
               <!-- Modal Content can go here -->
           </div>
       </div>
		<%@include file="/WEB-INF/include/Footer.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
		<script>
		 // JSP에서 resumeList를 JavaScript로 전달
        var resumeList = ${resumeListJson};
        var resumePercent =0;

        function updateResumePercent(percent) {
            // 맨 처음에 percent 값을 resumePercent에 할당
            var resumePercent = percent;

            var persentEl = document.querySelector('#resumePerEl');
            persentEl.textContent = "이력서 " + resumePercent + "% 완성";

            // pie-chart의 배경색을 업데이트
            var pieChart = document.querySelector('.my-profile .pie-chart');

            // 변경된 값만 업데이트합니다.
            pieChart.style.background = `conic-gradient(rgb(0, 42, 255) 0%, rgb(0, 42, 255) \${resumePercent}%, rgb(244, 244, 244) \${resumePercent}%, rgb(244, 244, 244) 100%)`;
        }
        
        
        // 학교 이름 배열을 업데이트하는 함수
        function updateSchoolNames(selectedIndex ,qus = false) {
        	resumePercent =0;
        	if(qus === true){
        		console.log("증가함");
        		resumePercent +=20;
        	}
        	const profileImgElement =  document.querySelector('.my-profile .profile-img');
        	const imageURL = resumeList[selectedIndex].re_profile;
            if (imageURL) {
                profileImgElement.style.backgroundImage = `url('/img/\${imageURL}')`;
                profileImgElement.style.backgroundSize = 'cover';
                resumePercent +=20
            }else{
            	 profileImgElement.style.backgroundImage = "url('/img/man-profil.png')";
            	 profileImgElement.style.backgroundSize = 'contain';
            }
        	
        	
        	
        	
            const schoolNames = resumeList[selectedIndex].schoolNameArray.slice().reverse();
            const statusElement = document.querySelector(".status");
            const schoolNameElement = document.querySelector("#school_name");
            
            // 역순 배열의 마지막 값을 school_name 요소에 설정
            if (schoolNames.length > 0) {
                schoolNameElement.textContent = schoolNames[schoolNames.length - 1]+"에서 공부했어요";
                resumePercent += 20; // 학교가 있을 경우 resumePercent에 20 추가
            } else {
            	schoolNameElement.textContent = "졸업한 학교를 등록해주세요";
            }
            // 학교 이름 배열을 문자열로 변환하여 <p> 요소에 설정
            statusElement.innerHTML = '';
            if (schoolNames  && schoolNames.length > 0) {
            for (var i = 0; i < schoolNames.length; i++) {
                var school = document.createElement('a');
                school.href = "/User/Resume/Write";
                school.target = "_blank";
                school.textContent = schoolNames[i] + " 졸업 >";
                statusElement.appendChild(school);
             
              } 
            resumePercent += 20; // 학교가 있을 경우 resumePercent에 20 추가
            }
        // 기술 스택 업데이트
        var stacks = resumeList[selectedIndex].schoolStackArray;
        var stackListElement = document.querySelector(".skill-list");
        if (stacks && stacks.length > 0) {
        stackListElement.innerHTML = ''; // 기존 리스트 초기화
        for (var i = 0; i < stacks.length; i++) {
            var stackItem = document.createElement('li');
            stackItem.textContent = stacks[i];
            stackListElement.appendChild(stackItem);
          }
        resumePercent += 20; // 스택이 있을 경우 resumePercent에 20 추가
        }
        console.log(resumePercent);
     // updateResumePercent 함수가 호출되면서 일정한 시간 간격으로 percent가 증가하도록 설정합니다.
     // 이를 위해 setInterval 함수를 사용할 수 있습니다.
	     var percent = 0;
	     var interval = setInterval(function() {
	         updateResumePercent(percent);
	         percent += 1; // 증가하는 속도를 조절할 수 있습니다.
	         if (percent > resumePercent) clearInterval(interval); // resumePercent에 도달하면 interval을 종료합니다.
	     }, 20);
    }
       let qus = false;
       
		document.addEventListener('DOMContentLoaded', function() {
			    updateSchoolNames(0);
			    let selectedIndex=0;
	            // 선택 이벤트 리스너 추가
	            document.getElementById("select_resume").addEventListener("change", function() {
	                 selectedIndex = this.selectedIndex;
	                updateSchoolNames(selectedIndex);
	                
	            });
			
	        
	     // Get the modal elements
	           const openModalButton = document.getElementById('openModal');
	           const modalBackground = document.getElementById('modalBackground');
	           const closeModalButton = document.getElementById('closeModal');

	           // Open the modal
	           openModalButton.addEventListener('click', function(event) {
	               event.preventDefault(); // Prevent default link behavior
	               modalBackground.style.display = 'flex'; // Show the modal
	               document.body.classList.add('modal-open'); // Prevent background interaction
	           });

	           // Close the modal
	           closeModalButton.addEventListener('click', function() {
	               modalBackground.style.display = 'none'; // Hide the modal
	               document.body.classList.remove('modal-open'); // Allow background interaction
	           });

	           // Close the modal when clicking outside the modal container
	           window.addEventListener('click', function(event) {
	               if (event.target === modalBackground) {
	                   modalBackground.style.display = 'none'; // Hide the modal
	                   document.body.classList.remove('modal-open'); // Allow background interaction
	               }
	           });
	         
	           var firstListItems = document.querySelectorAll('#welfare li');

	           firstListItems.forEach(function(item) {
	               item.addEventListener('click', function() {
	                   // 클릭된 요소에 on 클래스를 추가합니다.
	                   firstListItems.forEach(function(li) {
	                       li.classList.remove('on');
	                   });
	                   item.classList.add('on');
	               });
	           });

	           // 두 번째 카테고리 리스트에 대한 처리
	           var secondListItems = document.querySelectorAll('#salary li');

	           secondListItems.forEach(function(item) {
	               item.addEventListener('click', function() {
	                   // 클릭된 요소에 on 클래스를 추가합니다.
	                   secondListItems.forEach(function(li) {
	                       li.classList.remove('on');
	                   });
	                   item.classList.add('on');
	               });
	           });

	           // 세 번째 카테고리 리스트에 대한 처리
	           var thirdListItems = document.querySelectorAll('#region li');

	           thirdListItems.forEach(function(item) {
	               item.addEventListener('click', function() {
	                   // 클릭된 요소에 on 클래스를 추가합니다.
	                   thirdListItems.forEach(function(li) {
	                       li.classList.remove('on');
	                   });
	                   item.classList.add('on');
	               });
	           });
	           
	           /*  */
	        var selectedItems = {};

// 저장하기 버튼 클릭 시 선택된 항목을 출력
document.getElementById('QuestionSave').addEventListener('click', function() {
    // 각 순위 선택에 대한 처리
    var priority1 = document.getElementById('priority1').value;
    var priority2 = document.getElementById('priority2').value;
    var priority3 = document.getElementById('priority3').value;

    // 각 카테고리 리스트에 대한 처리
    var categoryLists = document.querySelectorAll('.category-list');
    categoryLists.forEach(function(list) {
        var selectedLi = list.querySelector('li.on'); // 선택된 LI 요소 찾기
        if (selectedLi) {
            var code = selectedLi.querySelector('input').getAttribute('data-code'); // 선택된 LI의 data-code 값 가져오기
            var type = selectedLi.querySelector('input').getAttribute('data-type'); // 선택된 LI의 data-type 값 가져오기
            selectedItems[type] = code; // 객체에 저장
        }
    });

    // 순위에 대한 객체에 저장
    selectedItems['priority1'] = priority1;
    selectedItems['priority2'] = priority2;
    selectedItems['priority3'] = priority3;

    
    console.log(selectedItems);
    RankUpdate(selectedItems);
    qus = true;
    updateSchoolNames(selectedIndex, qus);
    modalBackground.style.display = 'none'; // Hide the modal
    document.body.classList.remove('modal-open'); // Allow background interaction
    
});
function RankUpdate(){
	fetch(`/Mypage/Rank`,{
		method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(selectedItems)
		
	}).then(response => {
        if (!response.ok) {
            throw new Error('Failed to toggle bookmark');
        }
        return response.json(); 
        
    }).then(data => {
    	console.log(data);
    	displayPowerData(data)
    	
    }).catch(error => console.error('Error toggling bookmark:', error));
		
}

function displayPowerData(data) {
    const bookmarkPanel = document.querySelector('#AI_panel .ai-recommendations-list ul');
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
                    <a class="company" href="/SaveCookie?po_id=\${item.po_id}" >
                        <div class="name">${item.com_name}</div>
                    </a>
                </div>
                <div class="headers">
                    <a href="/SaveCookie?po_id=\${item.po_id}" target="_blank" class="title">\${item.po_title} Backend 개발자</a>
                    <button type="button" class="bookmark \${item.ub_boolean ? 'On' : ''}"></button>
                </div>
                <a class="devLinkRecruit" href="/SaveCookie?po_id=\${item.po_id}" >
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
                    <div class="deadline score">
                        <span>\${item.score}</span>
                        
                    </div>
                </div>
            </div>
        `;
        bookmarkPanel.appendChild(li);
    });
}
			
			/*--------------- 스와이퍼 --------------------------------*/
			
			 const swiper = new Swiper('.swiper', {
			      // Optional parameters
			      direction: 'horizontal',
			      loop: true,
			      // 자동 슬라이딩 활성화
			      autoplay: {
			          delay: 3000, // 슬라이드 간의 시간 간격 (밀리초)
			          disableOnInteraction: false, // 사용자 입력이 있을 때 자동 슬라이딩을 일시 중지하지 않음
			      },
			      // 자동 슬라이딩 활성화
			      
			      // Number of slides to show
			      slidesPerView: 3,
			      // If we need pagination
			      pagination: {
			        el: '.swiper-pagination',
			      },

			      // Navigation arrows
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },

			      // And if we need scrollbar
			     /*  scrollbar: {
			        el: '.swiper-scrollbar',
			      }, */
			    });
			
			 /*--------------- 스와이퍼 --------------------------------*/
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
			            if (flag === 'recent_panel') {
			                // 여기에 스크랩 공고 클릭 시 실행할 코드를 추가합니다.
			                console.log('최근 본 공고 버튼이 클릭되었습니다.');
			                // 예: 스크랩 공고 데이터를 불러오는 함수 호출
			                loadRecentCookData();
			            }
				  });
				
			});//tabs
			
			
			
			
			
		    let	booksEl = document.querySelectorAll('.mtuHome .bookmark');
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
		        fetch('/Mypage/Bookmarks/Load')
		            .then(response => response.json())
		            .then(data => {
		                console.log('스크랩 공고 데이터:', data);
		                // 데이터를 화면에 표시하는 로직 추가
		                displayBookmarkData(data);
		            })
		            .catch(error => console.error('Error loading bookmark data:', error));
		    }//loadBookmarkData fetch
		    function loadRecentCookData(){
		    	// 최근본 공고 텝 클릭시 비동기처리
		    	console.log('최근본 공고 텝 클릭');
		        // 예: fetch 요청을 사용하여 데이터를 불러오기
		        fetch('/Mypage/CookDatas/Load')
		            .then(response => {
		            	if (!response.ok) {
		                    throw new Error('Network response was not ok');
		                }
		                return response.json();
		            	
		            })
		            .then(data => {
		                console.log('최근 쿠키 공고 데이터:', data);
		                // 데이터를 화면에 표시하는 로직 추가
		                displayRecentCookData(data);
		            })
		            .catch(error => console.error('Error loading bookmark data:', error));
		    	
		    }//loadRecentCookData fetch
		    function displayRecentCookData(data){
		    	console.log('최근쿠키 공고 데이터:', data);
		    	//recent_panel
		    	 const cookiePanel = document.querySelector('#recent_panel .ai-recommendations-list ul');
		    	 console.log(cookiePanel);
		    	 cookiePanel.innerHTML = '';
		    	 
		    	 data.forEach(item => {
			            const li = document.createElement('li');
			            li.innerHTML = `
			                <input type="hidden" class="posting_id" value="\${item.po_id}">
			                <div class="recruit-content">
			                    <div class="congratulations-passing">
			                        <span>합격축하금 100만원</span>
			                    </div>
			                    <div class="company">
			                        <a class="company" href="/SaveCookie?po_id=\${item.po_id}" >
			                            <div class="name">${item.com_name}</div>
			                        </a>
			                    </div>
			                    <div class="headers">
			                        <a href="/SaveCookie?po_id=\${item.po_id}" target="_blank" class="title">\${item.po_title} Backend 개발자</a>
			                        <button type="button" class="bookmark \${item.ub_boolean ? 'On' : ''}"></button>
			                    </div>
			                    <a class="devLinkRecruit" href="/SaveCookie?po_id=\${item.po_id}" >
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
			            cookiePanel.appendChild(li);
			        });
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
		                        <a class="company" href="/SaveCookie?po_id=\${item.po_id}" >
		                            <div class="name">${item.com_name}</div>
		                        </a>
		                    </div>
		                    <div class="headers">
		                        <a href="#" target="_blank" class="title">\${item.po_title} Backend 개발자</a>
		                        <button type="button" class="bookmark \${item.ub_boolean ? 'On' : ''}"></button>
		                    </div>
		                    <a class="devLinkRecruit" href="/SaveCookie?po_id=\${item.po_id}" >
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






