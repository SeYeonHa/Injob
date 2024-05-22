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
				
    
				<div class="box-contents">
				  <div class ="mtuHome">
				    <%@include file="/WEB-INF/include/aside.jsp"%>
				    <div class="contWrap">
					<input type="hidden" name="po_id" value="1101" /> <input
						type="hidden" name="user_id" value="1" />

					<div class="card">
						<div class="card-header">
							<h3 class="card-title">이력서 목록</h3>

						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<form id="submitForm" action="/Mypage/ApplyResume" method="post">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th>선택</th>
											<th>이력서 번호</th>
											<th>자소서 제목</th>
											<th>자격증</th>
											<th>가입일</th>
										</tr>
									</thead>
									<tbody style="border-bottom: 1px solid #dee2e6;">
										<c:forEach var="R" items="${response.list}">
											<tr>
												<td><input type="radio" name="re_id" value="${R.re_id}"></td>
												<td>${R.re_id}</td>
												<td>${R.re_title}</td>
												<td>${R.license}</td>
												<td>${R.indate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%@include file="/WEB-INF/include/applyPaging.jsp"%>
								<!-- 수정: 버튼 타입을 submit으로 변경 -->
								<input type="submit" value="지원하기">
							</form>

						</div>
						<!-- /.card-header -->

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
		// 지원하기 버튼을 눌렀을 때 실행되는 함수
		function applyResume() {
			var selectedRadioButton = document
					.querySelector('input[name="re_id"]:checked');
			if (selectedRadioButton) {
				var reId = selectedRadioButton.value;
				// 선택한 이력서를 지원하는 URL로 이동합니다.
				location.href = `/Mypage/ApplyResume?re_id=${reId}`;
			} else {
				alert('이력서를 선택해주세요.');
			}
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

</body>

</html>






