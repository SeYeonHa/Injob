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

.grid-container {
  display: grid;
  gap: 10px;
  padding: 10px;
  border: 2px solid black;
}

.grid-item {
  text-align: left;
  padding: 20px;
  font-size: 20px;
  border: 1px solid black;
}

.item1 {
  grid-column: 1 / span 2;
  grid-row: 1;
  text-align: left;
}

.item2 {
  grid-column: 3;
  grid-row: 1 / span 2;
  text-align: left;
  font-size: 15px;
	font-weight: bold;
}

.item3 {
	font-size: 15px;
}

.item4 {
	font-size: 15px;
	font-weight: bold;
}


.container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 20px;
	border: 2px solid black;
	padding: 30px;
}

.section {
    border: 1px solid #ccc;
    padding: 20px;
}

.work-condition {
    grid-column: span 1;
}

.company-info {
    grid-column: span 1;
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
	grid-template-columns: 2fr 2fr 1fr;
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

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>

		<c:forEach var="posting" items="${detailList}" varStatus="status">
			<div>&nbsp;</div>
			<h3>채용정보</h3>
			<div>&nbsp;</div>
			
			<div class="grid-container">
			  <div class="grid-item item1">
				  <span style="font-size: 20px;">${posting.com_name}</span>
				  <br>
				  <span style="font-weight:bold; font-size: 25px;">${posting.po_title}</span>
			  </div>
			  <div class="grid-item item2">기업정보</div>
			  <div class="grid-item item3"><div class="sub_title1">지원자격</div>
					<div>&nbsp;</div>
					<span>경력</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.career}</span>
					<br><br>
					<span>학력</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.po_grade}</span>
					<br><br>
					<span>스킬</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.stack}</span>
					<br><br>
					<span>주소</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="inside_title">${posting.com_address}</span>
				</div>  
			  <div class="grid-item item4">근무조건</div>
			</div>
			
			
		</c:forEach>
		
<script>

</script>


	<%@include file="/WEB-INF/include/Footer.jsp"%>

</body>
</html>






