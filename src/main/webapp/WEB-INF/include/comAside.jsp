<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

       
      <aside class="container-123">
				<section class="secLnb">
					<div class="lnbGroup">
						<h2 class="lnbTit">
							<a href="/ComMypage/Post?com_id=${com_id}">기업회원 홈</a>
						</h2>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">공고 관리</h2>
						<ul>
							<li><a href="/ComMypage/PostWrite">공고
									등록</a></li>
							<li><a href="/ComMypage/Post">공고 현황</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">지원현황 관리</h2>
						<ul>
							<li><a href="/ComMypage/ApplyHistory?nowpage=1 ">입사지원 현황</a></li>
							<li><a href="/user/consulting">헤드헌팅 채용상담</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">스크랩/관심이력서</h2>
						<ul>
							<li><a href="/User/Scrap">스크랩 이력서</a></li>
							<li><a href="/User/FavorCo">관심이력서/헤드헌터</a></li>
							<li><a href="/User/Alarm">MY 알림</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">회원정보 관리</h2>
						<ul>
							<li><a href="/Text_User/User_Info_Mng.asp">회원정보 수정</a></li>
							<li><a href="/Text_User/User_PWD_Mng.asp">비밀번호 변경</a></li>
							<li><a href="/Text_User/User_Mailing_Mng.asp">메일·문자 설정</a></li>
						</ul>
					</div>
				</section>
			</aside>
