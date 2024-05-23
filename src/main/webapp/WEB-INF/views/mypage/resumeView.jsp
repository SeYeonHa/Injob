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
.skill-container {
		display: flex;
		width : 30px;
		gap: 20px; /* 버튼 사이 간격 조정 */
		margin : 10px;
	}
	.skill-button {
		flex: 1 1 calc(25% - 20px);
		height: 3em;
		display: flex;
		justify-content: center;
		align-items: center;
		color : white;
		background-color: #3CC35E;
		border: 1px solid #ccc;
		transition: background-color 0.3s;
		font-weight: bold;
		padding: 0 10px;
    min-width: 220px;
	}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>

		<div class="container-ha">
			<section class="box align-right">
				<!--  사이드바  -->
				



				<div class="box-contents">
					<div class="mtuHome">
					   <%@include file="/WEB-INF/include/aside.jsp"%>
					   <div class="contWrap" style="padding : 10px; border : 5px ridge; ">
						<c:forEach var="list" items="${list}">
							<div style="display: flex; flex-direction: column;">
								<div style="margin-bottom: 20px;">
									<h4 class="mar-10">이력서 제목 : ${ list.re_title }</h4>
									<hr>
								</div>
								<div
									style="display: flex; flex-direction: row; align-items: flex-start;">
									<div style="margin-right: 20px;">
										<img src="/img/${list.re_profile}" class="img-box"
											style="width: 220px; height: 230px;border : 5px ridge;">
									</div>
									<div>
										<table class="jh_resume_table"
											style="width: auto; height: 230px; table-layout: fixed; border : 5px ridge ; ">
											<colgroup>
												<col style="width: 25%;">
												<col style="width: 75%;">
											</colgroup>
											<tr>
												<td>이름</td>
												<td>${list.user_name}</td>
											</tr>
											<tr>
												<td>생년월일</td>
												<td><c:set var="partial"
														value="${fn:substring(list.user_social_num, 0, 6)}" />${partial}</td>
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
								
								<!-- 기술 스택 및 자격증 -->
								<span style="margin : 20px 10px; font-size: large; border : 1px dotted; padding : 10px;">자격증 &nbsp | &nbsp ${
										list.license }</span>
								</div>
								
								<!--  학력 세부사항  -->
								
									<div id="inputContainer">
									<!-- 학력 세부사항 -->
									<div >
										<h3 class="mar-10">학력 세부사항</h3>
										<div id="inputContainer">
											<c:forEach var="school" items="${school}">
												<div class="input-group" >
													<span style="border : 1px dotted; padding : 10px; margin-left : 10px; font-size: large;">
													${school.school_name}${school.school_type}</span>
												</div>
											</c:forEach>
										</div>
									</div>
									<!-- 스킬 -->
									<div >
										<h3 class="mar-10">기술 스택</h3>
										<div class="skill-container">
											<c:forEach var="skill" items="${skill}">
												<div class="skill-button">
													${skill.stack_name}</div>
											</c:forEach>
										</div>
									</div>


									<!-- 자기소개서 제목 -->
								<div >
									<h3 class="mar-10">지원 동기</h3>
									<input type="text" class="form-control mt-2" id="floatingInput"
										placeholder="제목을 입력하세요" value="${ list.re_intti }" readonly>
								</div>
								<!-- 자기 소개 -->
								<div class=" w-100">
									<h3 class="mar-10">자기소개</h3>
								</div>
									<textarea value="${list.re_intcon}" class="w-100 opacity-50"
										rows="20" style="height: 300px; width: 100%;" readonly>${list.re_intcon}</textarea>

								</div>


								<!-- 수정 버튼과 삭제 버튼을 한 줄에 표시하고 오른쪽에 붙임 -->
								<div style="display: flex; justify-content: flex-end; margin-top: 10px;">
									<!-- 수정 버튼 -->
									<button type="button" class="btn btn-primary"
										style="margin-right: 5px;"
										onclick="location.href='/Mypage/ResumeUpdate?re_id=${list.re_id}'">
										수정하기</button>
									<!-- 삭제 버튼 -->
									<button type="button" class="btn btn-danger" style="margin-right: 5px;"
										onclick="location.href='/Mypage/ResumeDelete?re_id=${list.re_id}'">
										삭제</button>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/Mypage/Resume?nowpage=1'">
										목록으로</button>
										
								</div>
                              
							</div>
						</c:forEach>
					</div>
					</section>
				</div>

	</main>
	<script>
	// JSP에서 Java 변수 값을 JavaScript로 전달
    var skillsString = '<%= request.getAttribute("skills") %>';
    var skillsArray = skillsString.split(',');

    var container = document.getElementById('skillsContainer');
    skillsArray.forEach(function(skill) {
        var skillBox = document.createElement('div');
        skillBox.className = 'skill-box';
        skillBox.innerText = skill;
        container.appendChild(skillBox);
    });
	
    function toggleSkill(element) {
        element.classList.toggle("active");
    }
    
	</script>

	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>