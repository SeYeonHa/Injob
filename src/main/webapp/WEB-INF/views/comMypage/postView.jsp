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
		
				<div class="box-contents">
					<div class="mtuHome">
					    <!--  사이드바  -->
			           <%@include file="/WEB-INF/include/comAside.jsp"%>
						<div class="contWrap">
						 <c:forEach var="list" items="${list}">
							<input type="hidden" name="com_id" value="${list.com_id}" />

							<div style="display: flex; flex-direction: column;">
								<div style="margin-bottom: 20px;">
									<h2 class="mar-10">공고 제목 : ${list.po_title}</h2>
									<hr>
								</div>
								<div
									style="display: flex; flex-direction: row; align-items: flex-start;">
									<div style="margin-right: 20px;">
										<img src="/img/${list.po_profile}" class="img-box"
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
													<td>회사명</td>
													<td>${list.com_name}</td>
												</tr>
												<tr>
													<td>설립년도</td>
												<td><c:set var="partial"
														value="${fn:substring(list.com_indate, 0, 10)}" />${partial}</td>
												</tr>
												<tr>
													<td>연락처</td>
													<td>${list.com_phone}</td>
												</tr>
												<tr>
													<td>주소</td>
													<td>${list.com_address}</td>
												</tr>
												<tr>
													<td>기업형태</td>
													<td>${list.com_type}</td>
												</tr>
										</table>
									</div>
								</div>
								
								<!-- 지원 자격 -->
								<div class="mt-5">
									<h3 class="mar-10">지원 자격</h3>
										<span>경력 &nbsp | &nbsp </span>
										<select	name="career" disabled>
										<option value="${list.career}" disabled">${list.career}</option>
										
									</select> <span>&ensp;&ensp;</span> 
									
										<span>학력 &nbsp | &nbsp </span>
										<select	name="po_grade" disabled>
										<option value="${list.po_grade}">${list.po_grade}</option>
									</select> <span>&ensp;&ensp;</span> 
									
										<span>분야 &nbsp | &nbsp </span>
										<select	name="hope_department"  disabled>
										<option value="${list.hope_department}">${list.hope_department}</option>
									</select> <span>&ensp;&ensp;</span> 
									
									
								</div>
								<div class="mt-5">
									<h3 class="mar-10">기타</h3>
										<span>급여 &nbsp | &nbsp </span>
										<select	name="money" disabled>
										<option value="면접 후 협의">면접 후 협의</option>
									</select> <span>&ensp;&ensp;</span> 
								
										<span>마감날짜 &nbsp | &nbsp </span>
										<span><c:set var="partial2"
														value="${fn:substring(list.po_end_date, 0, 10)}" />${partial2}</span>
										 <span>&ensp;&ensp;</span> 
								</div>
								
								<!-- 공고 내용 -->
								<div class="mt-5 w-100">
									<h3 class="mar-10">공고 내용</h3>

									<textarea class="w-100 opacity-50"
												name="po_content" rows="10"
												style="height: 300px; width: 100%;" value="${list.po_content}" readonly>${list.po_content}</textarea>

								</div>

								<!-- 수정 버튼과 삭제 버튼을 한 줄에 표시하고 오른쪽에 붙임 -->
								<div style="display: flex; justify-content: flex-end; margin-top: 10px;">
									<!-- 수정 버튼 -->
									<button type="button" class="btn btn-primary"
										style="margin-right: 5px;"
										onclick="location.href='/ComMypage/PostUpdate?com_id=${com_id}&po_id=${list.po_id}'">
										수정하기</button>
									<!-- 삭제 버튼 -->
									<button type="button" class="btn btn-danger" style="margin-right: 5px;"
										onclick="location.href='/ComMypage/PostDelete?com_id=${com_id}&po_id=${list.po_id}'">
										삭제</button>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/ComMypage/Post?com_id=${com_id}'">
										목록으로</button>
										
								</div>
							</div>
						</c:forEach>
					 </div>	
					</div>
				</div>
			</section>
		</div>
		<script>
            
            
        </script>

		<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>






