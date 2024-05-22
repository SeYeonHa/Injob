<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link rel="icon" type="image/png" href="/img/logo02.png" />
<link rel="stylesheet" href="/css/test.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/start.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>

    table {
        border-collapse: collapse;
        width: 70%;
        color: #333;
        font-family: Arial, sans-serif;
        font-size: 14px;
        text-align: left;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #54C399;
        color: white;
    }

    table input[type="text"],
    table textarea {
        width: calc(100% - 20px);
        padding: 10px;
        box-sizing: border-box;
    }

    table input[type="submit"],
    table input[type="button"] {
        width: 100px;
        margin-top: 10px;
        padding: 10px;
        background-color: #54C399;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    table input[type="submit"]:hover,
    table input[type="button"]:hover {
        background-color: #4DAF88;
    }

    h2 {
        text-align: center;
        margin-top: 50px;
        margin-bottom: 30px;
    }


  footer {
   margin-top: 150px; /* 푸터 위 여백 설정 */
    text-align: center;
    padding: 10px;
    background-color: #f2f2f2;
    border-top: 1px solid #ddd;
}

</style>
</head>
<body>
<main>
    <%@include file="/WEB-INF/include/Header.jsp" %>

    <h2>게시글 등록</h2>
    <form action="/Community/Write" method="POST">

        <input type="hidden" name="user_id" value="${userId}" />

        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td style="text-align : left; margin : 10px;">${user_id}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="글 쓰기" />
                    <input type="button" value="목록" id="goList" />
                </td>
            </tr>
        </table>
    </form>

    <script>
        const goListEl = document.getElementById('goList');
        goListEl.addEventListener('click', function() {
            location.href = '/Community/List?user_id=1&nowpage=${nowpage}';
        });
    </script>
    <%@include file="/WEB-INF/include/Footer.jsp" %>
</main>
</body>
</html>
