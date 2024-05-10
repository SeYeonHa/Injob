<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 상세보기</title>

<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet" href="/css/common.css" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}

.nanum-gothic-extrabold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 800;
	font-style: normal;
}

body {
	width: 80%;
	margin: 0 auto;
}

.title {
	font-weight: bolder;
	font-size: 30px;
	text-align: center;
}

form {
	
}

.ac {
	display: grid;
	grid-template-columns: 1fr 1fr;
	border: 2px solid black;
	padding: 30px;
}

.person {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr;
	border: 1px solid black;
	padding: 30px;
}

.sub_title1 {
	font-weight: bold;
}

.sub_title2 {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.content {
	border: 1px solid black;
	padding: 30px;
}

#inside_title {
	color: #3f98f7;
}

#goUpdate {
	display: block;
	width: 120px;
	margin: 20px auto;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

#goUpdate:hover {
	background-color: #0056b3;
}

main {
	margin: 0 auto;
	width: 1200px;
	text-align: center;
}

.sub_title {
	font-weight: border;
	text-align: center;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	font-size: 20px;
	font-weight: border;
	padding: 10px;
	margin-left: 10px;
	.
	td1
	{
	width
	:
	50px;
}

.td2 {
	width: 650px;
	margin-right: 50px;
}

.td3 {
	width: 150px;
	padding-right: 100px;
}

.td4 {
	margin-right: 50px;
	padding-right: 50px;
	width: 200px;
}

}
button {
	margin-right: 50px;
}

.content1 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	border: 1px solid #3f98f7;
	padding: 10px;
	border-radius: 5px;
	margin: 10px; . td1 { width : 50px;
	border-right: 1px solid rgba(63, 98, 247, 0.5);
}

.td2 {
	width: 650px;
	border-right: 1px solid rgba(63, 98, 247, 0.5);
}

.td3 {
	width: 150px;
	border-right: 1px solid rgba(63, 98, 247, 0.5);
}

.td4 {
	width: 200px
}

.td5 {
	width: 150px;
}
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>

		<c:forEach var="posting" items="${detailList}" varStatus="status">
			<div class="title">${posting.po_title}</div>
			<div>&nbsp;</div>
			<h3>채용정보</h3>

			<div>&nbsp;</div>
			<div class="ac">
				<div class="apply">
					<div class="sub_title1">지원자격</div>
					<div>&nbsp;</div>
					<div>경력</div>
					<div id="inside_title">${posting.career}</div>
					<div>학력</div>
					<div id="inside_title">${posting.po_grade}</div>
					<div>스킬</div>
					<div id="inside_title">${posting.stack}</div>
					<div>주소</div>
					<div id="inside_title">${posting.com_address}</div>
				</div>
			</div>

		</c:forEach>
		
		<div class="content">
			<div>${posting.po_content}</div>
		</div>


	<%@include file="/WEB-INF/include/Footer.jsp"%>

</body>
</html>






