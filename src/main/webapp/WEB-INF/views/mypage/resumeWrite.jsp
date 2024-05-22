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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

<style>
	.skill-container {
		display: flex;
		flex-wrap: wrap;
		gap: 20px; /* 버튼 사이 간격 조정 */
	}
	.skill-button {
		flex: 1 1 calc(25% - 20px);
		height: 3em;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #f0f0f0;
		border: 1px solid #ccc;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	.skill-button:hover {
		background-color: #e0e0e0;
	}
	.skill-button.active {
		background-color: #3CC35E;
		color : white;
		font-weight: bold;
	}
	.input-group {
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>

		<div class="container-ha">
			<section class="box align_right">
		<!--  사이드바  -->
			

				<div class="box-contents">
				  <div class="mtuHome"> 
				    <%@include file="/WEB-INF/include/aside.jsp"%>
					<div class="contWrap"  style="border : 5px ridge ;">
						<form action="/Mypage/ResumeSubmit" method="post" var="list" items="${list}">
							<input type="hidden" name="user_id" value="${user_id}" />

							<div style="display: flex; flex-direction: column; margin:10px;">
								<div style="margin-bottom: 20px; ">
									<h2 class="mar-10">이력서 제목 :
									 <input type="text" name="re_title"
											placeholder="제목을 입력하세요" required
											style="display: inline-block; width: 700px; height: 50px; " />
									</h2>
									<hr>
								</div>
								<div
									style="display: flex; flex-direction: row; align-items: flex-start;">
									<div style="margin-right: 20px;">
										<input type="file" name="re_profile" class="img-box"
													style="width: 220px; height: 230px;border : 5px ridge ;">
									</div>
									<div>
										<table class="jh_resume_table"
											style="width: auto; height: 230px; table-layout: fixed; border : 5px ridge ;">
											<colgroup>
												<col style="width: 25%;">
												<col style="width: 75%;">
											</colgroup>
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
								<!-- 자격증 -->
								<div class="mar-10">
									<span>자격증 &nbsp | &nbsp <input type="text"
											name="license" placeholder="보유 자격증을 입력하세요"></span>

								</div>
								<!--  학력 세부사항  -->
								<div class="mt-5">
									<h3 class="mar-10">
										학력 세부사항
										<button type="button" class="btn btn-block btn-primary"
											onclick="addInputFields()">
											<h5>+</h5>
										</button>
									</h3>
									<div id="inputContainer">
										<!-- 기본 학력 입력 필드 -->
										<div class="input-group">
											<input type="text" name="school_name" placeholder="학교 이름 입력" style="width: 33%; height: 1.5em; margin-right: 10px;">
											<select name="school_type" style="height: 1.5em; margin-right: 10px;">
												<option value="대학교">대학교</option>
												<option value="고등학교">고등학교</option>
												<option value="중학교">중학교</option>
												<option value="기타">기타</option>
											</select>
											<button type="button" onclick="removeInputField(this)">X</button>
										</div>
									</div>
								</div>
								<!-- 스킬  -->
								<div class="mt-5">
									<h3 class="mar-10">기술 스택</h3>
									<div class="skill-container">
										<c:forEach var="skill"
											items="${fn:split('JAVA,CSS,JAVASCRIPT,HTML,PYTHON,C++,DJANGO,GIT', ',')}"
											varStatus="status">
											<div class="skill-button" onclick="toggleSkill(this)">
												${skill} 
											</div>
										</c:forEach>
									</div>
								</div>

								<!-- 자기소개서 제목 -->
								<div class="mt-5">
									<h3 class="mar-10">자기소개 제목</h3>
									<input type="text" class="form-control mt-2" name="re_intti"
												id="floatingInput" placeholder="제목을 입력하세요" required>
								</div>
								<!-- 자기 소개 -->
								<div class="mt-5 w-100">
									<h3 class="mar-10">자기소개</h3>

									<textarea class="w-100 opacity-50"
												name="re_intcon" rows="20"
												style="height: 300px; width: 100%;" placeholder="내용을 입력하세요" reauired></textarea>

								</div>

							</div>

							<button type="submit" class="btn btn-block btn-success" >등록</button>
						</form>
					</div>
				</div>	
				</div>
			</section>
		</div>
		<script type="text/javascript">
		
		var selectedSkills = [];

		function toggleSkill(button) {
			var skill = button.innerText.trim();
			var index = selectedSkills.indexOf(skill);

			if (index === -1) {
				selectedSkills.push(skill);
				button.classList.add("active");
			} else {
				selectedSkills.splice(index, 1);
				button.classList.remove("active");
			}
		}

		function removeInputField(button) {
			button.parentElement.remove();
		}

		function addInputFields() {
			// 새로운 div 요소 생성
			var newDiv = document.createElement("div");
			newDiv.setAttribute("class", "input-group");

			// 첫 번째 상자: 텍스트 입력 필드
			var inputField = document.createElement("input");
			inputField.setAttribute("type", "text");
			inputField.setAttribute("name", "school_name");
			inputField.setAttribute("placeholder", "학교 이름 입력");
			inputField.style.width = "33%";
			inputField.style.height = "1.5em";
			inputField.style.marginRight = "10px"; // 간격 추가

			// 두 번째 상자: 옵션 선택 필드
			var selectField = document.createElement("select");
			selectField.setAttribute("name", "school_type");
			selectField.style.height = "1.5em";
			selectField.style.marginRight = "10px"; // 간격 추가

			var options = ["대학교", "고등학교", "중학교", "기타"];
			options.forEach(function(option) {
				var optionElem = document.createElement("option");
				optionElem.value = option;
				optionElem.text = option;
				selectField.appendChild(optionElem);
			});

			// 세 번째 상자: 삭제 버튼
			var deleteButton = document.createElement("button");
			deleteButton.setAttribute("type", "button");
			deleteButton.innerHTML = "X";
			deleteButton.onclick = function() {
				newDiv.remove();
			};

			// 생성된 필드를 div에 추가
			newDiv.appendChild(inputField);
			newDiv.appendChild(selectField);
			newDiv.appendChild(deleteButton);

			// 새로운 div를 컨테이너에 추가
			document.getElementById("inputContainer").appendChild(newDiv);
		}

		function submitForm(event) {
			// 선택된 스킬 버튼들 가져오기
			var selectedSkillButtons = document.querySelectorAll(".skill-button.active");

			// 선택된 스킬 정보만 제출하기 위해 기존 hidden input 제거
			var existingInputs = document.querySelectorAll('input[name="stack_name"]');
			existingInputs.forEach(function(input) {
				input.remove();
			});

			// 선택된 스킬 이름들을 배열에 저장
			selectedSkills = [];
			selectedSkillButtons.forEach(function(button) {
				selectedSkills.push(button.innerText.trim());
			});

			// 선택된 스킬 정보만 hidden input으로 추가
			selectedSkills.forEach(function(skill) {
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "stack_name";
				input.value = skill;
				event.target.appendChild(input);
			});

			// 폼을 제출
			event.target.submit();
		}

		document.querySelector("form").addEventListener("submit", submitForm);
		</script>

		<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>
