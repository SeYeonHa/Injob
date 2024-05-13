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
						<form action="/Mypage/ResumeSubmit" method="post" var="list"
							items="${list}">
							<input type="hidden" name="user_id" value="1" />

							<div class="border border-tertiary p-5 rounded shadow">
								<h1 class="mar-10">
									이력서 제목 : <input type="text" name="re_title"
										placeholder="제목을 입력하세요" required
										style="display: inline-block; width: 450px; height: 50px;" />
								</h1>
								<div class="d-flex justify-content-center">
									<div style="width: auto;">
										<div class="jh_resume_flexbox mt-3" style="display: flex;">
											<input type="file" name="re_profile" class="img-box"
												style="width: 250x; height: 226px; margin-right: 100px;">
											<table class="jh_resume_table" style="width: auto;">
												<tr>
													<td>이름</td>
													<td>${rv.user_name}</td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td><c:set var="partial"
															value="${fn:substring(rv.user_social_num, 0, 6)}" />
														${partial}</td>
												</tr>
												<tr>
													<td>연락처</td>
													<td>${rv.user_phone}</td>
												</tr>
												<tr>
													<td>이메일</td>
													<td>${rv.user_email}</td>
												</tr>
											</table>
										</div>
									</div>
									<div class="mar-10">
									<span>기술스택 &nbsp | &nbsp </span><select
										value="rv.skill" disabled>
										<option value="Java">Java</option>
										<option value="Springboot">Springboot</option>
										<option value="C">C</option>
										<option value="CSS">CSS</option>
										<option value="html">Html</option>
										<option value="Flutter">Flutter</option>
										<option value="JavaScript">JavaScript</option>
									</select> <span>&ensp;&ensp;</span> <span style="display: inline-block;">
										자격증 &nbsp | <label for="license"></label> <textarea
											id="license" name="license"
											style="display: inline-block; width : 300px; vertical-align: top;"></textarea>
									</span>
									</div>

									<div class="mt-5">

										<h3>자기소개서 제목</h3>
										<label for="re_intti"></label><br>
										<textarea id="re_intti" name="re_intti" rows="2" cols="80"></textarea>
										<br>
										<br>

									</div>
									<br>
									<div class="mt-5 jh_resume_skill"></div>
									<div class="mt-5 w-100">
										<h3>자기소개</h3>

										<label for="re_intcon"></label><br>
										<textarea id="re_intcon" name="re_intcon" rows="20" cols="80"></textarea>
										<br>
										<br>

									</div>

								</div>
							</div>

							<button type="submit" class="btn btn-block btn-success" >등록</button>
						</form>
					</div>
				</div>
			</section>
		</div>
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






