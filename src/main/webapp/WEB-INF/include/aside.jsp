<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

       
      <aside class="container-123">
				<section class="secLnb">
					<div class="lnbGroup">
						<h2 class="lnbTit">
							<a href="/Mypage/Resume?nowpage=1">개인회원 홈</a>
						</h2>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">이력서 관리</h2>
						<ul>
<<<<<<< HEAD
							<li><a href="/Mypage/ResumeWrite?user_id=${user.user_id}">이력서
=======
							<li><a href="/Mypage/ResumeWrite">이력서
>>>>>>> 1a7e4c9f78492294775e59d472cb2b0c952599c2
									등록</a></li>
							<li><a href="/Mypage/Resume?nowpage=1">이력서 현황</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">입사지원 관리</h2>
						<ul>
							<li><a href="/Mypage/ApplyHistory?nowpage=1">입사지원 현황</a></li>
							<li><a href="/user/consulting">헤드헌팅 채용상담</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">스크랩/관심기업</h2>
						<ul>
							<li><a href="/User/Scrap">스크랩 공고</a></li>
							<li><a href="/User/FavorCo">관심기업/헤드헌터</a></li>
							<li><a href="/User/Alarm">MY 알림</a></li>
						</ul>
					</div>
					<div class="lnbGroup">
						<h2 class="lnbTit">회원정보 관리</h2>
						<ul>
							<li><a href="/Text_User/User_Info">회원정보 수정</a></li>
							<li><a href="/Text_User/User_PWD_Mng.asp">비밀번호 변경</a></li>
							<li><a href="/Text_User/User_Mailing_Mng.asp">메일·문자 설정</a></li>
						</ul>
					</div>
				</section>
			</aside>
