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
					<div class="contWrap" style="padding : 10px; border : 5px ridge; ">
						<form
							action="/Mypage/ResumeUpdateSubmit?nowpage=1"
							method="post" var="list" items="${list}">


							<c:forEach var="list" items="${list}">

								<input type="hidden" name="user_id" value="${ user_id }" />
								<input type="hidden" name="re_id" value="${ list.re_id }" />

								<div style="display: flex; flex-direction: column;">
									<div style="margin-bottom: 20px;">
										<h2 class="mar-10">
											이력서 제목 : <input type="text" name="re_title"
												value="${ list.re_title }" required
												style="display: inline-block; width: 700px; height: 50px;" />
										</h2>
										<hr>
									</div>
									<div
										style="display: flex; flex-direction: row; align-items: flex-start;">
										<div style="margin-right: 20px;">
											<input type="file" name="re_profile" class="img-box"
												value="${ list.re_profile }"
												style="width: 220px; height: 230px; border : 5px ridge;">
										</div>
										<div>
											<table class="jh_resume_table"
												style="width: auto; height: 230px; table-layout: fixed; border : 5px ridge;">
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
									<!-- 자격증 -->
								<div class="mar-10">
									<span style="margin : 10px; font-size: large;">자격증 &nbsp | &nbsp <input type="text"
											name="license" value="${list.license }"></span>
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
                                        <c:forEach var="school" items="${school}">
                                            <div class="input-group">
                                                <input type="text" name="school_name" value="${school.school_name}" style="width: 33%; height: 1.5em; margin-right: 10px;">
                                                <select name="school_type" style="height: 1.5em; margin-right: 10px;">
                                                    <option value="대학교" <c:if test="${school.school_type == '대학교'}">selected</c:if>>대학교</option>
                                                    <option value="고등학교" <c:if test="${school.school_type == '고등학교'}">selected</c:if>>고등학교</option>
                                                    <option value="중학교" <c:if test="${school.school_type == '중학교'}">selected</c:if>>중학교</option>
                                                    <option value="기타" <c:if test="${school.school_type == '기타'}">selected</c:if>>기타</option>
                                                </select>
                                                <button type="button" onclick="removeInputField(this)">X</button>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- 스킬  -->
										<div class="mt-5">
											<h3 class="mar-10">기술 스택</h3>
											<div class="skill-container">
												<c:forEach var="skillName"
													items="${fn:split('JAVA,CSS,JAVASCRIPT,HTML,PYTHON,C++,DJANGO,GIT', ',')}"
													varStatus="status">
													<c:set var="isActive" value="false" />
													<c:forEach var="userSkill" items="${skill}">
														<c:if test="${userSkill.stack_name == skillName}">
															<c:set var="isActive" value="true" />
														</c:if>
													</c:forEach>
													<div class="skill-button ${isActive ? 'active' : ''}"
														onclick="toggleSkill(this)">${skillName}</div>
												</c:forEach>
											</div>
										</div>



									</div>
									<!-- 자기소개서 제목 -->
									<div class="mt-5">
										<h3 class="mar-10">지원동기</h3>
										<input type="text" class="form-control mt-2" name="re_intti"
											id="floatingInput" placeholder="제목을 입력하세요"
											value="${ list.re_intti }">
									</div>
									<!-- 자기 소개 -->
									<div class="mt-5 w-100">
										<h3 class="mar-10">자기소개</h3>

										<textarea value="${list.re_intcon}" class="w-100 opacity-50"
											name="re_intcon" rows="20"
											style="height: 300px; width: 100%;">${list.re_intcon}</textarea>

									</div>

									<!-- 수정 버튼과 삭제 버튼을 한 줄에 표시하고 오른쪽에 붙임 -->
									<div
										style="display: flex; justify-content: flex-end; margin: 10px 10px;">
										<!-- 수정 버튼 -->
										<button type="submit" class="btn btn-primary"
											style="margin-right: 5px;">수정완료</button>
										<!-- 삭제 버튼 -->
										<button type="button" class="btn btn-secondary"
											onclick="location.href='/Mypage/Resume?nowpage=1'">
											목록으로</button>
									</div>

								</div>
							</c:forEach>

						</form>
					</div>
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






