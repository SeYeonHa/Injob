<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <link rel="icon" type="image/png" href="/img/logo02.png" />
    <link rel="stylesheet" href="/css/test.css" />
    <link rel="stylesheet" href="/css/common.css" />
    <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
    <style>

        table {
            border-collapse: collapse;
            width: 55%; 
            color: #333;
            font-family: Arial, sans-serif;
            font-size: 14px;
            text-align: left;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin: auto;
            margin-top: 20px; /* 상단 여백을 줄입니다. */
            margin-bottom: 20px; /* 하단 여백을 줄입니다. */
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd; /* 셀 테두리 스타일 지정 */
        }
        th {
            background-color: #54C399; /* 테이블 헤더 배경색을 메인 색상으로 설정합니다. */
            color: white;
        }
        th:first-child {
            background-color: #54C399; /* 첫 번째 열의 배경색을 메인 색상으로 설정합니다. */
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* 짝수 행 배경색을 지정합니다. */
        }
        tr:hover {
            background-color: #ddd; /* 호버 시 배경색 변경 */
        }
        #goWrite {
            margin: 20px auto; /* 위아래 여백 20px, 좌우 여백은 자동으로 설정하여 수평 가운데 정렬 */
            display: block; /* 블록 레벨 요소로 설정하여 가로폭을 사용 가능한 최대로 설정 */
            margin-top: 20px; /* 버튼 위 여백을 설정합니다. */
            padding: 10px 20px; /* 버튼 내부 여백을 설정합니다. */
            background-color: #54C399; /* 버튼 배경색을 설정합니다. */
            color: white; /* 버튼 텍스트 색상을 설정합니다. */
            border: none; /* 버튼 테두리를 없앱니다. */
            border-radius: 5px; /* 버튼 모서리를 둥글게 만듭니다. */
            cursor: pointer; /* 클릭 가능 상태를 나타내는 포인터로 커서를 변경합니다. */
        }
        #goWrite:hover {
            background-color: #4DAF88; /* 호버 시 배경색 변경 */
        }
        footer {
            text-align: center;

            margin-top: 150px; /* 푸터 위 여백 설정 */

            padding: 10px; /* 푸터 내부 여백 설정 */
            background-color: #f2f2f2; /* 푸터 배경색 설정 */
            border-top: 1px solid #ddd; /* 푸터 상단에 1px 실선 테두리 추가 */
        }
        h2 {
            text-align: center; /* 제목 가운데 정렬 */
            margin-top: 50px; /* 제목 위 여백 설정 */
            margin-bottom: 30px; /* 제목 아래 여백 설정 */
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/Header.jsp" %>

<section class="img-container"></section>
<div class="main-wrap inner"></div>

<h2>게시물 목록</h2>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="User_boardVo" items="${user_boardList}">
        <tr>
            <td>${User_boardVo.board_id}</td>

            <td><a href="/Community/View?board_id=${User_boardVo.board_id}&nowpage=1&user_id=${User_boardVo.user_id}">
                    ${User_boardVo.title}
                </a></td>
            <td>${User_boardVo.user_id}</td>
            <td>${User_boardVo.indate}</td>
            <td>${User_boardVo.hit}</td>
           
        </tr>
    </c:forEach>
    </tbody>

</table>
<input type="button" id="goWrite" value="새 글 추가">
<script>
    const goWriteEl = document.getElementById('goWrite');
    goWriteEl.addEventListener('click', function (e) {
        location.href = '/Community/WriteForm';
    });

</script>
<%@include file="/WEB-INF/include/Footer.jsp" %>
</body>
</html>
