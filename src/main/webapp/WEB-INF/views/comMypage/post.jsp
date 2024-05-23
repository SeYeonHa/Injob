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
		
			
		<!--  메인  -->

				<div class="box-contents">
                    <div class=" mtuHome">
					
						 
		                 <!--  사이드바  -->

		            	<%@include file="/WEB-INF/include/comAside.jsp"%>

						<div class="contWrap">
         
				
						<div class="card-header">
							<h3 class="card-title">공고 목록</h3>

						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0" >
							<table class="table table-hover text-nowrap" style="margin:10px">
								<thead style="text-align: center;">
									<tr>
										<th>공고 번호</th>
										<th>공고 제목</th>
										<th>희망 부서</th>
										<th>경력</th>
										<th>시작날짜</th>
										<th>마감날짜</th>
									</tr>
								</thead>
								<tbody style="border-bottom: 1px solid #dee2e6;">
									<c:forEach var="P" items="${Postlist}">

										<tr
											onclick="location.href='/ComMypage/PostView?com_id=${com_id}&po_id=${P.po_id}'">
											<td>${P.po_id }</td>
											<td>${P.po_title }</td>
											<td>${P.hope_department}</td>
											<td>${P.career}</td>
											<td>
											<c:set var="partial1"
														value="${fn:substring(P.po_start_date, 0, 10)}" />${partial1}</td>
											<td>
											<c:set var="partial2"
														value="${fn:substring(P.po_end_date, 0, 10)}" />${partial2}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<br>
						<button type="button"
						style="display: flex; justify-content: flex-end; margin: 10px 10px;"
							onclick="location.href=`/ComMypage/PostWrite?com_id=${com_id}`"
							class="btn btn-block btn-success">작성</button>
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






