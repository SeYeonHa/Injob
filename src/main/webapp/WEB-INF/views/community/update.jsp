<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 수정</title>
<link rel="icon" type="image/png" href="/img/logo02.png" />
<link rel="stylesheet" href="/css/test.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
h2 {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 30px;
}

table {
    border-collapse: separate; /* 바깥 테두리를 제거하기 위해 separate로 변경 */
    border-spacing: 0; /* 셀 사이의 간격을 없애기 위해 0으로 설정 */
    width: 70%;
    color: #333;
    font-family: Arial, sans-serif;
    font-size: 14px;
    text-align: left;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    margin: auto;
    margin-top: 50px;
    margin-bottom: 50px;
}

table td {
    text-align: center;
    padding: 10px;
    border: 1px solid #fff; /* 흰색으로 안쪽 테두리 설정 */
}

table input[type=text] {
    width: 100%;
}

table textarea {
    width: 100%;
    height: 250px;
}

table td:nth-of-type(1),
table td:nth-of-type(3) {
    width: 150px;
    background-color: #54C399;
    color: white;
}

table td:nth-of-type(2),
table td:nth-of-type(4) {
    width: 250px;
}

table tr:nth-of-type(3) td:nth-of-type(2) {
    text-align: left;
}

table tr:nth-of-type(4) td[colspan] {
    height: 250px;
    width: 600px;
    text-align: left;
    vertical-align: baseline;
}

table tr:last-child td {
    background-color: white;
    color: black;
}

table {
    border-left: 1px solid white; /* 왼쪽 테두리 설정 */
    border-right: none; /* 오른쪽 테두리 제거 */
    border-top: none; /* 위쪽 테두리 제거 */
    border-bottom: none; /* 아래쪽 테두리 제거 */
}

footer {
    text-align: center;
    margin-top: 150px;
    padding: 10px;
    background-color: #f2f2f2;
    border-top: 1px solid #ddd;
}

.btn-detail {
    display: inline-block;
    padding: 8px 16px;
    background-color: #54C399;
    color: #fff;
    border: none; /* 테두리 제거 */
    border-radius: 3px;
    text-decoration: none;
    transition: background-color 0.5s ease;
}

.btn-detail-link {
    display: inline-block;
    padding: 8px 16px;
    background-color: #54C399;
    color: #fff;
    border-radius: 3px;
    text-decoration: none;
    transition: background-color 0.5s ease;
}

.btn-detail:hover, .btn-detail-link:hover {
    background-color: #3EAD81; /* 마우스를 올렸을 때의 색상 변경 */
}
</style>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>

</head>
<body>
  <main>
    
    <%@include file="/WEB-INF/include/Header.jsp" %>
  <section class="img-container"></section>
    <div class = "main-wrap inner"></div>
    <h2>게시글 내용 수정</h2>
    <form  action="/Community/Update"  method="POST">
    <input type="hidden"  name="board_id" value="${vo.board_id}" />  
    <input type="hidden"  name="user_id" value="${vo.user_id}" />  
    <%-- <input type="hidden"  name="nowpage" value="${nowpage}" />   --%>
    <table id="table">
     <tr>
       <td>글번호</td>
       <td>${vo.board_id}</td>
       <td>조회수</td>
       <td>${vo.hit}</td>      
     </tr>
     <tr>
       <td>작성자</td>
       <td>${vo.user_id}</td>
       <td>작성일</td>
       <td>${vo.indate}</td>
     </tr>
     <tr>
       <td>제목</td>
       <td colspan="3">
       <input type="text" name="title" value="${vo.title}" />     
       </td>  
     </tr>
     <tr>
       <td>내용</td>
       <td colspan="3">
       <textarea name="content">${vo.content}</textarea>
       </td>
     </tr>  
     <tr>
       <td colspan="4">
    <input class="btn-detail" type="submit" value="수정" />
    <a class="btn-detail-link" href="/Community/List?user_id=${user_id}&nowpage=${nowpage}">목록</a>
</td>

    
    </table>  
   </form>   
  
  </main>
 
  <script>
    const goListEl = document.getElementById('goList');
    goListEl.addEventListener('click', function(e) {
        location.href = '/community/List';
    })
  
  </script>
  <%@include file="/WEB-INF/include/Footer.jsp" %>
</body>
</html>
