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
							<li><a href="/Text_User/User_Info_Mng.asp">회원정보 수정</a></li>
							<li><a href="/Text_User/User_PWD_Mng.asp">비밀번호 변경</a></li>
							<li><a href="/Text_User/User_Mailing_Mng.asp">메일·문자 설정</a></li>
						</ul>
					</div>
				</section>
			</aside>
			
		<!--  메인  -->

				<div class="box-contents">


					<div class="card">
						<div class="card-header">
							<h3 class="card-title">이력서 목록</h3>

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
								<thead style="text-align: center;">
									<tr>
										<th>이력서 번호</th>
										<th>자소서 제목</th>
										<th>자격증</th>
										<th>가입일</th>
									</tr>
								</thead>
								<tbody style="border-bottom: 1px solid #dee2e6;">
									<c:forEach var="R" items="${response.list}">

										<tr
											onclick="location.href='/Mypage/ResumeView?user_id=${user_id}&re_id=${R.re_id}'">
											<td>${R.re_id }</td>
											<td>${R.re_title }</td>
											<td>${R.license}</td>
											<td>${R.indate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<br>
						<button type="button" onclick="location.href=`/Mypage/ResumeWrite?user_id=${user_id}`" class="btn btn-block btn-success" >작성</button>
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






