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
			
			
		<!--  메인  -->

				<div class="box-contents">
                   <div class="mtuHome">
					  <%@include file="/WEB-INF/include/aside.jsp"%>
				       <div class="contWrap">
				       		<div class="card-header">
							<h2 class="card-title" style="font-weight: bold;">이력서 현황</h2>

						    </div>
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
											onclick="location.href='/Mypage/ResumeView?re_id=${R.re_id}'">
											<td>${R.re_id }</td>
											<td>${R.re_title }</td>
											<td>${R.license}</td>
											<td>${R.indate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						  </div>
						  <div
								style="display: flex; justify-content: center;">
								<div style="display: flex; justify-content: left ;"></div>
								<!-- 왼쪽 빈 공간 -->
								<div style="margin: 0 auto; display: flex; justify-content: center;">
									<%@include file="/WEB-INF/include/resumePaging.jsp"%>
								</div>
								<div>
									<button type="button" style="margin: 10px 10px; display: flex; justify-content: right;"
										onclick="location.href='/Mypage/ResumeWrite?user_id=${user_id}'"
										class="btn btn-block btn-success">작성</button>
								</div>
					    </div>
				       </div>
						
						<!-- /.card-header -->
						

					

				



					
                    <%@include file="/WEB-INF/include/rightAside.jsp"%>
                  </div>
				</div>
				

			</section>
		</div>
	</main>

	<footer>
		<%@include file="/WEB-INF/include/Footer.jsp"%>
	</footer>

	<script>
	
       
    </script>

</body>

</html>