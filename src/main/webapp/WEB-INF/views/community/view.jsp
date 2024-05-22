<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 조회</title>
<link rel="icon" type="image/png" href="/img/logo02.png" />
<link rel="stylesheet"  href="/css/test.css" />
<link rel="stylesheet" href="/css/common.css" />
 <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
.btn.btn1 {
    display: inline-block;
    padding: 8px 16px;
    background-color: #65C398; /* 메인 색상 */
    color: #fff;
    border-radius: 3px;
    text-decoration: none;
    transition: background-color 0.5s ease;
}

.btn.btn1:hover {
    background-color: #4DAF88; /* 마우스를 올렸을 때의 색상 변경 */
}


#table {
    border-collapse: collapse; /* 바깥 테두리를 제거하기 위해 separate로 변경 */
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

#table td {
    text-align: center;
    padding: 10px;
    border: none; /* 바깥 테두리를 제거 */
}

#table td:nth-of-type(1),
#table td:nth-of-type(3) {
    width: 150px;
    background-color: #54C399;
    color: white;
    border: 1px solid #fff; /* 안쪽 테두리를 흰색으로 설정 */
}

#table td:nth-of-type(2),
#table td:nth-of-type(4) {
    width: 250px;
    border: 1px solid #fff; /* 안쪽 테두리를 흰색으로 설정 */
}

#table tr:nth-of-type(3) td:nth-of-type(2) {
    text-align: left;
}

#table tr:nth-of-type(4) td[colspan] {
    height: 250px;
    width: 600px;
    text-align: left;
    vertical-align: baseline;
}

#table tr:last-child td {
    background-color: white;
    color: black;
}

footer {
 margin-top: 150px; /* 푸터 위 여백 설정 */
    text-align: center;

    padding: 10px;
    background-color: #f2f2f2;
    border-top: 1px solid #ddd;
}

h2 {
    text-align: center;
    margin: 50px 0 30px 0; /* 상단과 하단 여백을 조정 */

}

main {
    display: flex;
    justify-content: center;
}

.btn-custom {
    height: 35px; /* 원하는 높이값(px)으로 조절하세요 */
    line-height: 35px; /* 높이값보다 작은 값으로 설정하세요 */
}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>

</head>
    <%@include file="/WEB-INF/include/Header.jsp" %>
<body>
    <h2>게시글 내용 조회</h2>
  <main>
    
  
    <table id="table">
     <tr>
       <td>글번호</td>
       <td>${ vo.board_id }</td>
       <td>조회수</td>
       <td>${ vo.hit }</td>     
     </tr>
     <tr>
       <td>작성자</td>
       <td>${ vo.user_id }</td>
       <td>작성일</td>
       <td>${ vo.indate }</td>
     </tr>
     <tr>
       <td>제목</td>
       <td colspan="3">${ vo.title }</td>  
     </tr>
     <tr>
       <td>내용</td>
       <td colspan="3">${ vo.content }</td>
     </tr>  
     <tr>
     
       <td colspan="4">
        <a class = "btn btn1" 
           href  = "/Community/WriteForm?user_id=${ vo.user_id }&nowpage=${nowpage}">새 글쓰기</a>&nbsp;&nbsp;
        <a class = "btn btn1" 
           href  = "/Community/UpdateForm?board_id=${ vo.board_id }&user_id=${ vo.user_id }&nowpage=${nowpage}">수정</a>&nbsp;&nbsp;
        <a class = "btn btn1" 
           href  = "/Community/delete?board_id=${ vo.board_id }&user_id=${ vo.user_id}&nowpage=${nowpage}">삭제</a>&nbsp;&nbsp;
        <a class = "btn btn1" 
           href  = "/Community/List?user_id=${ vo.user_id }&nowpage=${nowpage}">목록으로</a>&nbsp;&nbsp;

       </td>
     </tr>
    
    </table>  
  </main>
  
  <script>
    const  goListEl  = document.getElementById('goList');
    goListEl.addEventListener('click', function(e) {
        location.href = '/User_board/List?user_id=1&nowpage=${nowpage}';
    })
  
  </script>
  <%@include file="/WEB-INF/include/Footer.jsp" %>
</body>
</html>
