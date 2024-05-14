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


					<div class="card">
						<div class="card-header">
							<h3 class="card-title">지원 이력</h3>

							<div class="card-tools">
								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="table_search"
										class="form-control float-right" placeholder="Search">

									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>회사명</th>
										<th>공고 제목</th>
										<th>이력서 번호</th>
										<th>결과</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="H" items="${Historylist}">
										
										<tr>
											<td>${H.com_name }</td>
											<td>${H.po_title }</td>
											<td>${H.re_id}</td>
											<td>${H.result}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
	
        function updateResumeForm(id) {
            console.log(id);
            $.ajax({
                type: "GET",
                url: "/person/updateResume/" + id
            }).done((res) => {
                location.href = "/person/updateResume/" + id;
            }).fail((err) => {

            });
        }

        //For Demo only
        var links = document.getElementsByClassName('link')
        for (var i = 0; i <= links.length; i++)
            addClass(i)


        function addClass(id) {
            setTimeout(function () {
                if (id > 0) links[id - 1].classList.remove('hover')
                links[id].classList.add('hover')
            }, id * 750)
        }
    </script>

</body>

</html>






