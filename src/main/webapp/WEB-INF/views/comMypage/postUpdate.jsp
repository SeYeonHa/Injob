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
						<form action="/ComMypage/PostUpdateSubmit" method="post" var="list" items="${list}">
						  <c:forEach var="list" items="${list}">
							<input type="hidden" name="com_id" value="1" />

							<div style="display: flex; flex-direction: column;">
								<div style="margin-bottom: 20px;">
									<h2 class="mar-10">공고 제목 :
									 <input type="text" name="po_title"
											value="${list.po_title}" required
											style="display: inline-block; width: auto; height: 50px;" />
									</h2>
									<hr>
								</div>
								<div
									style="display: flex; flex-direction: row; align-items: flex-start;">
									<div style="margin-right: 20px;">
										<input type="file" name="po_profile" class="img-box"
													value="${ list.po_profile }"
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
										<select	name="career">
										<option value="신입">신입</option>
										<option value="경력">경력</option>
										<option value="무관">무관</option>
										<option value="2년이상">2년이상</option>
										<option value="5년이상">5년이상</option>
										<option value="10년이상">10년이상</option>
									</select> <span>&ensp;&ensp;</span> 
									
										<span>학력 &nbsp | &nbsp </span>
										<select	name="po_grade">
										<option value="고졸">고졸</option>
										<option value="대졸">대졸</option>
										<option value="무관">무관</option>
									</select> <span>&ensp;&ensp;</span> 
									
										<span>분야 &nbsp | &nbsp </span>
										<select	name="hope_department">
										<option value="풀스택">풀스택</option>
										<option value="백엔드">백엔드</option>
										<option value="프론트엔드">프론트엔드</option>
										<option value="무관">무관</option>
									</select> <span>&ensp;&ensp;</span> 
									
									
								</div>
								<div class="mt-5">
									<h3 class="mar-10">기타</h3>
										<span>급여 &nbsp | &nbsp </span>
										<select	name="money">
										<option value="면접 후 협의">면접 후 협의</option>
										<option value="2400">2400이상</option>
										<option value="3000 이상">3000 이상</option>
										<option value="4000 이상">4000 이상</option>
										<option value="5000 이상">5000 이상</option>
									</select> <span>&ensp;&ensp;</span> 
								
										<span>마감날짜 &nbsp | &nbsp </span>
										<input type="date" name="po_end_date" style="width: 150px;" required/>
										 <span>&ensp;&ensp;</span> 
								</div>
								
								<!-- 공고 내용 -->
								<div class="mt-5 w-100">
									<h3 class="mar-10">공고 내용</h3>

									<textarea class="w-100 opacity-50"
												name="po_content" rows="10"
												style="height: 300px; width: 100%;" value="${list.po_content}" required></textarea>

								</div>

							</div>

							<button type="submit" class="btn btn-block btn-success" style="margin-right: 5px;">등록</button>
							<button type="button" class="btn btn-secondary"
										onclick="location.href='/ComMypage/Post?com_id=${com_id}'">
										취소</button>
						  </c:forEach>
						</form>
					</div>
				</div>
			</section>
		</div>
		<script>
           
            
        </script>

		<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>





