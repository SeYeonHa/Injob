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
			     	<%@include file="/WEB-INF/include/aside.jsp"%>
                     <div class="contWrap">
					   <div class="card">
						 <div class="card-header">
							<h3 class="card-title">지원 이력</h3>

						
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead style="text-align: center;">
									<tr>
										<th>회사명</th>
										<th>공고 제목</th>
										<th>이력서 번호</th>
										<th>결과</th>
									</tr>
								</thead>
								<tbody style="border-bottom: 1px solid #dee2e6;">
									<c:forEach var="H" items="${response.list}">
										
										<tr>
											<td>${H.com_name }</td>
											<td>${H.po_title }</td>
											<td>${H.re_id}</td>
							
											<td class="result">${H.result}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<%@include file="/WEB-INF/include/applyHistoryPaging.jsp"%>
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
		function setColorForResult(resultElement) {
			var resultText = resultElement.innerText.trim();
			if (resultText === "합격") {
				resultElement.style.color = "blue";
			} else if (resultText === "불합격") {
				resultElement.style.color = "red";
			} else if (resultText === "진행중") {
				resultElement.style.color = "black";
			}
		}

		document.addEventListener("DOMContentLoaded", function() {
			var resultElements = document.querySelectorAll(".result");
			resultElements.forEach(function(element) {
				setColorForResult(element);
			});
		});
	</script>


</body>

</html>






