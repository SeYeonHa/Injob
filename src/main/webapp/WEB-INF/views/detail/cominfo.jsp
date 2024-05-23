<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업정보 상세보기</title>

<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/cominfo.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<style>
body {
	width: 90%;
	margin: 0 auto;
}

.flex-container {
	display: flex;
	align-items: center;
	justify-content: center; 
	height : 180px;
	width: 100%;
	position: relative;
	height: 180px;
}

.flex-container2 {
	display: flex;
	background-color: #f1f1f1;
}

.flex-container > div {
	color: white;
	margin: 10px;
	text-align: center;
	line-height: 150px;
	font-size: 20px;
}

.logo-box {
	margin-top: 15px;
	margin-left: 100px;
	width: 124px;
	height: 114px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
	position: absolute;
}

.logoimg {
	width: 100px;
	margin-bottom: 30px;
}

.bglogo-container {
	position: relative;
	display: flex;
  align-items: center;
}

.bglogoimg {
	width: auto;
	height: auto;
	margin: 0 auto;
}

.logo-box {
	position: absolute;
	top: 50%;
	left: 26%;
	transform: translate(-50%, -50%);
	width: 124px;
	height: 114px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
	
}

.content {
	padding-top: 70px;
	margin-left: -15px;
}

.header-title {
	color: black;
}

.com-header-body {
	color: white;
	left: 34%;
	top: 20%; position : absolute;
	bottom: 50%;
	font-size: 35px;
	position: absolute;
}

#navbar {
	overflow: hidden;
	background-color: darkgreen;
}

#navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

#navbar a:hover {
	background-color: green;
	color: white;
}

#navbar a.active {
	background-color: #90EE90;
	color: white;
}

.content {
	padding: 16px;
}

.sticky {
	position: fixed;
	top: 0;
	width: 100%;
}

.sticky+.content {
	padding-top: 60px;
}

table {
	width: 100%;
	border: 1px solid;
}

.com-title {
	font-size: 25px;
	font-weight: bold;
	text-align: left;
}

.field-label {
	color: grey;
	padding-top: 10px;
	padding-bottom: 10px;
}

.table-basic-info {
	margin: 0 auto;
	width:
	border: solid 1px grey;
}

.value-inline,
.reference-inline {
  display: inline-block;
  margin-right: 5px;
}

.reference-inline {
	color: grey;
	font-size: 13px;
}

.values {
  white-space: nowrap;
}


</style>

</head>
<body>

	<%@include file="/WEB-INF/include/Header.jsp"%>
	<%@include file="/WEB-INF/include/CInfoHeader.jsp"%>

	<div class="flex-container">
		<div class="bglogo-container">
			<img src="/img/${posting.bglogo}" alt="bg로고img" class="bglogoimg">
			<div class="logo-box">
				<img src="/img/${posting.com_logo}" alt="로고img" class="logoimg">
			</div>
			<div class="com-header-body">
				<div>${posting.com_name}</div>
			</div>
		</div>
		<div style="flex-grow: 1;"></div>
		<div style="flex-grow: 99"></div>
	</div>


	<div id="navbar">
		<a class="active" href="javascript:void(0)">기업정보</a> <a
			href="javascript:void(0)">채용</a> <a href="javascript:void(0)">연봉정보</a>
	</div>
	<br>

	<div class="content">
		<div class="com-title">기업 정보</div>  
	</div>
	<table class="table-basic-info">
		<colgroup>
			<col class="col-label">
			<col class="col-value">
			<col class="col-label">
			<col class="col-value">
		</colgroup>
		<tbody > 
			<tr class="field">
				<th class="field-label" style="padding-left : 20px;" >산업</th>
				<td class="field-value">
					<div class="value-container">
						<div class="value">포털 및 기타 인터넷 정보매개 서비스업</div>
					</div>
				</td>

				<th class="field-label">사원수</th>
				<td class="field-value">
					<div class="value-container">
						<div class="values">
							<div class="value-inline">${posting.employee}</div>
							<div class="reference-inline">(2023.12.31)</div>
						</div>
					</div>
				</td>
			</tr>
			<tr class="field">
				<th class="field-label" style="padding-left : 20px;">기업구분</th>
				<td class="field-value">
					<div class="value-container">
						<div class="value">대기업</div>
					</div>
				</td>

				<th class="field-label">설립일</th>
				<td class="field-value">
					<div class="value-container">
						<div class="values">
							<div class="value-inline">${posting.com_birth}</div>
							<div class="reference-inline">(14년차)</div>
						</div>
					</div>
				</td>
			</tr>
			<tr class="field">

				<th class="field-label" style="padding-left : 20px;">자본금</th>
				<td class="field-value">
					<div class="value-container">
						<div class="values">

							<div class="value-inline">${posting.stock}</div>
							<div class="reference-inline">(2023.12.31)</div>
						</div>
					</div>
				</td>

				<th class="field-label">매출액</th>
				<td class="field-value">
					<div class="value-container">
						<div class="values">

							<div class="value-inline">${posting.sales}</div>
							<div class="reference-inline">(2023.12.31)</div>
						</div>
					</div>
				</td>
			</tr>
			<tr class="field">

				<th class="field-label" style="padding-left : 20px;">대표자</th>
				<td class="field-value">
					<div class="value-container">
						<div class="value">${posting.com_ceo}</div>
					</div>
				</td>

				<th class="field-label">대졸초임</th>
				<td class="field-value">
					<div class="value-container">
						<div class="values">
							<div class="salary-average">
								<div class="salary-average-item">4,875만원</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr class="field">

				<th class="field-label" style="padding-left : 20px;">홈페이지</th>
				<td class="field-value">
					<div class="value-container">
						<div class="value">
							<a href="${posting.page}">careers.com</a>
						</div>
					</div>
				</td>

				<th class="field-label">주소</th>
				<td class="field-value" colspan="3">
					<div class="value-container">
						<div class="value">${posting.com_address}</div>
					</div>
				</td>
			</tr>
			<tr class="field full-width">
			</tr>
		</tbody>
	</table>



	<script>
		window.onscroll = function() {
			myFunction()
		};

		var navbar = document.getElementById("navbar");
		var sticky = navbar.offsetTop;

		function myFunction() {
			if (window.pageYOffset >= sticky) {
				navbar.classList.add("sticky")
			} else {
				navbar.classList.remove("sticky");
			}
		}
	</script>

	<%@include file="/WEB-INF/include/Footer.jsp"%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>


</html>