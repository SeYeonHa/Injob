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
			<section class="box align-right">
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
					<div class=" mx-2 pb-4 w-80">
						<c:forEach var="list" items="${list}">
							<div style="display: flex; flex-direction: column;">
								<div style="margin-bottom: 20px;">
									<h2 class="mar-10">이력서 제목 : ${ list.re_title }</h2>
									<hr>
								</div>
								<div
									style="display: flex; flex-direction: row; align-items: flex-start;">
									<div style="margin-right: 20px;">
										<img src="/img/${list.re_profile}" class="img-box"
											style="width: 220px; height: 230px;">
									</div>
									<div>
										<table class="jh_resume_table"
											style="width: auto; height: 230px; table-layout: fixed;">
											<colgroup>
												<col style="width: 25%;">
												<col style="width: 75%;">
											</colgroup>
											<tr>
												<td>이름</td>
												<td>${list.user_name}</td>
											</tr>
											<tr>
												<td>생년월일</td>
												<td><c:set var="partial"
														value="${fn:substring(list.user_social_num, 0, 6)}" />${partial}</td>
											</tr>
											<tr>
												<td>연락처</td>
												<td>${list.user_phone}</td>
											</tr>
											<tr>
												<td>이메일</td>
												<td>${list.user_email}</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- 기술 스택 및 자격증 -->
								<div class="mar-10">
									<br> <span>기술스택 &nbsp | &nbsp </span><select
										value="rv.skill" disabled>
										<option value="Java">Java</option>
										<option value="Springboot">Springboot</option>
										<option value="C">C</option>
										<option value="CSS">CSS</option>
										<option value="html">Html</option>
										<option value="Flutter">Flutter</option>
										<option value="JavaScript">JavaScript</option>
									</select> <span>&ensp;&ensp;</span> <span>자격증 &nbsp | &nbsp ${
										list.license }</span>
								</div>
								<!-- 자기소개서 제목 -->
								<div class="mt-5">
									<h3 class="mar-10">자기소개서 제목</h3>
									<input type="text" class="form-control mt-2" id="floatingInput"
										placeholder="제목을 입력하세요" value="${ list.re_intti }" readonly>
								</div>
								<!-- 자기 소개 -->
								<div class="mt-5 w-100">
									<h3 class="mar-10">자기소개</h3>

									<textarea value="${list.re_intcon}" class="w-100 opacity-50"
										rows="20" style="height: 300px; width: 100%;" readonly>${list.re_intcon}</textarea>

								</div>

								<!-- 수정 버튼과 삭제 버튼을 한 줄에 표시하고 오른쪽에 붙임 -->
								<div
									style="display: flex; justify-content: center; margin-top: 10px;">
									<c:choose>
													<c:when test="${result == '진행중'}">
														<!-- 진행중인 경우 합격과 불합격 버튼 표시 -->
														<button type="button" class="btn btn-success btn-sm result 1">합격</button>
														<button type="button" class="btn btn-danger btn-sm result 0">불합격</button>
													</c:when>
													<c:otherwise>
														<!-- 그 외의 경우에는 결과 값 표시 -->
									                    <button type="button" class="btn btn-primary" style="margin-right: 5px;"
									                    onclick="location.href='/ComMypage/ApplyHistory?com_id=${com_id}'">${result}</button>
									                </c:otherwise>
												</c:choose>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/ComMypage/ApplyHistory?com_id=${com_id}'">
										목록으로</button>
										
								</div>

							</div>
						</c:forEach>
					</div>
				</div>


			</section>
		</div>
	</main>
	<script>
		
	
	
	</script>

	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>