<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title 수정수정</title>
<link rel="icon" type="image/png" href="/img/logo.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

<style>
*{
  font-family: "Nanum Gothic", sans-serif;
  font-weight: 400;
  font-style: normal;
}



.nanum-gothic-extrabold {
  font-family: "Nanum Gothic", sans-serif;
  font-weight: 800;
  font-style: normal;
}
   
</style>
</head>
<body>
<%@include file="/WEB-INF/include/Header.jsp"%>
  <main>
	<h2>Home</h2>
	<div><a href="/Menus/WriteForm">새 메뉴 추가</a></div>
	<div><a href="/Menus/WriteForm2">새 메뉴 추가2</a></div>
	<div><a href="/Menus/List">메뉴 목록</a></div>	
	<div>&nbsp;</div>
	<div><a href="/Users/List">사용자 목록</a></div>
	<div><a href="/Users/WriteForm">사용자 추가</a></div>
	<div>&nbsp;</div>	
	<div><a href="/Board/List?menu_id=MENU01">게시물 목록</a></div>
	<div><a href="/Board/WriteForm?menu_id=MENU01">게시물 등록</a></div>
  </main>	
  <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>






