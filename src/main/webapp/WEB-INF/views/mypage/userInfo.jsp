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

<style>

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>

		<div class="container-ha">
			<section class="box align_right">
				<aside class="box-sidebar">
					<div class="container-123">
						<hr>
						<a href="/Mypage/UserInfo?user_id=1"
							class="link" style="width: 150px;">회원 정보</a>
						<hr>
						<a
							href="/Mypage/Resume?user_id=1"
							class="link">이력서 관리</a>
						<hr>
						<a href="/Mypage/Bookmark?user_id=1"
							class="link">북마크</a>
						<hr>
						<a href="/Mypage/ApplyHistory?user_id=1"
							class="link">지원 이력</a>
						<hr>
					</div>
				</aside>

				<div class="box-contents">
					<div class=" mx-2 pb-4 w-80">
						<c:forEach var="list" items="${list}">
							<div class="border border-tertiary p-5 rounded shadow">
								<h1>이력서 제목 : ${ list.re_title }</h1>

								<div class="d-flex justify-content-center">
									<div style="width: auto;">
										<div class="jh_resume_flexbox mt-3" style="display: flex;">
											<img src="/img/${list.re_profile}"
												style="width: 250px; height: 226px; margin-right: 100px;">
											<table class="jh_resume_table" style="width: auto;">
												<tr>
													<td>이름</td>
													<td>${list.user_name}</td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td><c:set var="partial"
															value="${fn:substring(list.user_social_num, 0, 6)}" />
														${partial}</td>
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

									<div class="mt-5">
										<h3>자기소개서 제목</h3>
										<input type="text" class="form-control mt-2"
											id="floatingInput" placeholder="제목을 입력하세요"
											value="${ list.re_intti }" readonly>
									</div>
									<br>
									<div class="mt-5 jh_resume_skill"></div>
									<div class="mt-5 w-100">
										<h3>자기소개</h3>

										<textarea value="${list.re_intcon}" class="w-100 opacity-50"
											rows="20" style="height: 300px; width: 100%;" readonly>${list.re_intcon}</textarea>

									</div>

									<div class="d-flex mt-4 justify-content-center">
												<button type="button" onclick="location.href=`/Mypage/ResumeUpdate?user1&re_id=${list.re_id}`">
												수정하기
												</button>
										<button type="button"
											onclick="location.href=`/Mypage/ResumeDelete?user_id=1&re_id=${list.re_id}`">
											삭제</button>
										<!-- 삭제 버튼 -->
										<button type="button"
											onclick="showDeleteConfirmation(${list.re_id})"
											class="btn btn-danger">삭제하기</button>
										<!-- 삭제 확인 모달 창 -->
										<div id="deleteConfirmationModal" class="modal"
											style="display: none;">
											<div class="modal-content">
												<span class="close" onclick="closeDeleteConfirmationModal()">&times;</span>
												<p>정말로 삭제하시겠습니까?</p>
												<button onclick="confirmDelete()" class="btn btn-danger">삭제</button>
												<button onclick="closeDeleteConfirmationModal()"
													class="btn btn-secondary">취소</button>
											</div>
										</div>

										<!--  -->
										
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
		<script>
		
		 // 모달 창을 보여주는 함수
		  function showDeleteConfirmation(reId) {
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
            for(var i = 0; i <= links.length; i++)
               addClass(i)


            function addClass(id){
               setTimeout(function(){
                  if(id > 0) links[id-1].classList.remove('hover')
                  links[id].classList.add('hover')
               }, id*750) 
            }
            
        </script>

		<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>






