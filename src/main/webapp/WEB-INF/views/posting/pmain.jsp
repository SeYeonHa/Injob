<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#main:hover {
    transform: scale(1.05); /* 호버 효과 시 크기 확대 */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}
#main{
 border: 1px solid #ccc;
    border-radius: 15px;
    margin: 10px;
    padding: 15px 10px;
    text-align: center;
    max-width: 300px;
    height: auto;
    transition: all 0.3s ease;
}
.pstyle{
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 4개의 열을 갖는 그리드 설정 */
  grid-gap: 20px; /* 각 요소 사이의 간격 설정 */
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
  <main>
    <div class="inner">
     <h2>공고</h2>
    <div class="pstyle">
   <c:forEach var="posting" items="${postingList}" varStatus="status">
      <div id ="main" class ="main">
						<ul data-totalcount = "4" data-pageno ="1">
							<li>
									<div class="clogo"><img src ="/img/${posting.po_profile}.jpg" alt="프로필img"></div>
									<div class="listCont">
										<div class="pCor">
											<span class ="posId">${posting.po_id }</span>
										</div>
										<div class ="pTit">${posting.po_title }</div>
										<div class ="pInfo">
											<span class ="pPart">
												${posting.hope_department }
											</span>
											<span class ="pAddress">
											  ${posting.com_address }
											</span>
										</div>
										<div class ="pStackBox">
											<span class ="tag tag-tack">${posting.stack }</span>
										</div>
									</div>
									<div class="listFoot">
										<div class ="pAssist">
											<span>🏆 합격축하금 100만원</span> <br>
											<span class ="pPeriod">${posting.po_end_date }</span>
										</div>
									</div>
									<button class="bookmark"></button>
							</li>	
						</ul>

				</div>
			</c:forEach>
			</div>
			</div>
  </main>
 <%@include file="/WEB-INF/include/Footer.jsp"%>
</body>
</html>