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
								<a href="/Mypage/Resume?user_id=${user_id}">개인회원 홈</a>
							</h2>
						</div>
						<div class="lnbGroup">
							<h2 class="lnbTit">이력서 관리</h2>
							<ul>
								<li><a href="/Mypage/ResumeWrite?user_id=${user_id}">이력서
										등록</a></li>
								<li><a href="/Mypage/Resume?user_id=${user_id}">이력서 현황</a></li>
							</ul>
						</div>
						<div class="lnbGroup">
							<h2 class="lnbTit">입사지원 관리</h2>
							<ul>
								<li><a href="/Mypage/ApplyHistory?user_id=${user_id}">입사지원
										현황</a></li>
								<li><a href="/user/consulting">헤드헌팅 채용상담</a></li>
							</ul>
						</div>
						<div class="lnbGroup">
							<h2 class="lnbTit">스크랩/관심기업</h2>
							<ul>
								<li><a href="/User/Scrap">스크랩 공고</a></li>
								<li><a href="/User/FavorCo">관심기업/헤드헌터</a></li>
								<li><a href="/User/Alarm">MY 알림</a></li>
							</ul>
						</div>
						<div class="lnbGroup">
							<h2 class="lnbTit">회원정보 관리</h2>
							<ul>
								<li><a href="/Text_User/User_Info">회원정보 수정</a></li>
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
									style="display: flex; justify-content: flex-end; margin-top: 10px;">
									<!-- 수정 버튼 -->
									<button type="button" class="btn btn-primary"
										style="margin-right: 5px;"
										onclick="location.href='/Mypage/ResumeUpdate?user_id=${user_id}&re_id=${list.re_id}'">
										수정하기</button>
									<!-- 삭제 버튼 -->
									<button type="button" class="btn btn-danger" style="margin-right: 5px;"
										onclick="location.href='/Mypage/ResumeDelete?user_id=${user_id}&re_id=${list.re_id}'">
										삭제</button>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/Mypage/Resume?user_id=${user_id}'">
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
		// 모달 창을 보여주는 함수
		function showDeleteConfirmation() {
			var modal = document.getElementById("deleteConfirmationModal");
			modal.style.display = "block";
			// 삭제할 re_id 값을 저장합니다.
			modal.dataset.reId = reId;
		}

		// 모달 창을 닫는 함수
		function closeDeleteConfirmationModal() {
			var modal = document.getElementById("deleteConfirmationModal");
			modal.style.display = "none";
		}

		// 삭제 확인 버튼을 눌렀을 때의 동작을 처리하는 함수
		function confirmDelete() {
			var reId = document.getElementById("deleteConfirmationModal").dataset.reId;
			// 삭제 작업을 수행하는 URL로 이동합니다.
			if (reId) {
				location.href = `/Mypage/ResumeDelete?re_id=${reId}`;
			}
			closeDeleteConfirmationModal();
		}

		//For Demo only
		var links = document.getElementsByClassName('link')
		for (var i = 0; i <= links.length; i++)
			addClass(i)

		function addClass(id) {
			setTimeout(function() {
				if (id > 0)
					links[id - 1].classList.remove('hover')
				links[id].classList.add('hover')
			}, id * 750)
		}
	</script>

	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>