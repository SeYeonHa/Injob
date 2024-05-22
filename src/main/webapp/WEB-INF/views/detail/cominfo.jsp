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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
   rel="stylesheet">
<style>

body {
   width: 100%;
   margin: 0 auto;
}

.flex-container {
  display: flex;
  align-items: stretch;
  background-image: url("/img/logo101.jpg");
  height: 180px;
  width: 100%;
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
	margin-left: 200px;
	width  : 124px;
	height : 114px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
	
}

.logoimg {
	width: 100px;
	margin-bottom: 30px;

}


.content {
  padding-top: 70px;
  margin-left: 200px;
}

.header-title {
	color: black;
}

.com-header-body {
	color: white;
	left: 370px;
	position: absolute;
	bottom : 66%;
	font-size: 35px;
}

#navbar {
  overflow: hidden;
  background-color: #333;
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
  background-color: #ddd;
  color: black;
}

#navbar a.active {
  background-color: #04AA6D;
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

.sticky + .content {
  padding-top: 60px;
}

table {
  width: 100%;
  border: 1px solid;
}

.com-title {
	font-size: 25px;
	font-weight: bold;
}

</style>

</head>
<body>

	<%@include file="/WEB-INF/include/Header.jsp"%>
	<%@include file="/WEB-INF/include/CInfoHeader.jsp"%>

	<div class="flex-container">
		<div style="flex-grow: 1">
			<div class="logo-box">
				<img src="/img/${posting.com_logo}.jpg" alt="프로필img" class="logoimg">
			</div>
			<div class="com-header-body">
				<div>${posting.com_name}</div>
			</div>
		</div>
		<div style="flex-grow: 1;"></div>
		<div style="flex-grow: 99"></div>
	</div>
	
	
	<div id="navbar">
  <a class="active" href="javascript:void(0)">기업정보</a>
  <a href="javascript:void(0)">채용</a>
  <a href="javascript:void(0)">연봉정보</a>
</div>

<div class="content">
  <div class="com-title">기업 정보</div>
  
  <table>
       <tr>
           <td class="col-1">산업</td>
           <td class="col-2">통신 및 방송 장비 제조업</td>
           <td class="col-3">사원수</td>
           <td class="col-4">${posting.employee}</td>
       </tr>
       <tr>
           <td class="col-1">기업구분</td>
           <td class="col-2">${posting.com_type}</td>
           <td class="col-3">설립일</td>
           <td class="col-4">${posting.com_birth}</td>
       </tr>
       <tr>
           <td class="col-1">자본금</td>
           <td class="col-2">2</td>
           <td class="col-3">매출액</td>
           <td class="col-4">4</td>
       </tr>
       <tr>
           <td class="col-1">대표자</td>
           <td class="col-2">${posting.com_ceo}</td>
           <td class="col-3">주요사업</td>
           <td class="col-4">데이터베이스업, 인터넷 관련 소프트웨어, 시스템통합, 인터넷광고사업...</td>
       </tr>
       <tr>
           <td class="col-1">홈페이지</td>
           <td class="col-2"><a href="https://careers.kakao.com/index">careers.kakao.com</a></td>
           <td class="col-3">주소</td>
           <td class="col-4">${posting.com_address}</td>
       </tr>

   </table>
  
 
</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
	window.onscroll = function() {myFunction()};
	
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
</body>
	
	
</html>