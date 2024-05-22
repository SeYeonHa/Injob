<%@   page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title 수정수정rr</title>
<link rel="icon" type="image/png" href="/img/logo.png" />
<link href="/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"  />
<script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/common.css" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
   rel="stylesheet">


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
	<%-- 사용자 정보가 있는 경우에만 출력 --%>
   <%--  <c:if test="${not empty user}">
        <h1>Welcome, ${user.user_name}!</h1>
        <p>Your email address: ${user.user_email}</p>
        <p>Your address: ${user.user_address}</p>
        <!-- 기타 등등 필요한 정보를 출력하거나 활용 -->
    </c:if> --%>
    <!-- ---------------------------------- -->
<%@include file="/WEB-INF/include/Header.jsp"%>
	<main>
		<div class="inner">
			<h2>강재영</h2>
			<h2>강재영</h2>
			<h2>강재영</h2>
			<h2>강재영</h2>
			<h2>강재영</h2>
			<div>
				<a href="/Posting/PMain">메인 공고</a>
			</div>
			<div>
				<a href="/Posting/PMain2">메뉴 목록</a>
				<a href="/ComMypage/Post?com_id=1">기업 마이페이지</a>
			</div>
    
    
	</main>
	<%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>





