<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="headerWrapper">
          <div id="gnb">
            <h1 id="logo">
              <a href="/"><img src="/img/logo.png" /></a>
            </h1>
            <%-- 사용자 정보가 있는 경우에만 출력 --%>

            <c:choose>
			   <c:when test="${not empty user}">
			        <!-- 개인 사용자일 경우 -->
			        <ul class="navbar" id="on_user_login">
			            <li><a href="/Posting/PMain">공채정보</a></li>
			            <li><a href="/Resume/List">취업톡톡</a></li>
			            <li><a href="/Mypage/Resume?user_id=${ user.user_id }&nowpage=1">마이페이지</a></li>
			            <li><a href="/Board">게시판</a></li>
			        </ul>
			    </c:when>
			    <c:otherwise>
			        <!-- 로그인하지 않은 경우 -->
			        <ul class="navbar" id="nologin">
			            <li><a href="/Posting/PMain">공채정보(로그인 안함)</a></li>
			            <li><a href="#">취업톡톡</a></li>
			            <li><a href="/Mypage/Resume">마이페이지22</a></li>
			            <li><a href="#">게시판</a></li>
			        </ul>
			    </c:otherwise>
			</c:choose>
          </div>
           
          <div class="login-link">
			    <c:choose>
			        
			       <c:when test="${not empty user}">
			            <a href="/logout">로그아웃</a>
			        </c:when>
		       
			        <c:otherwise>
			            <a class="dfd" href="/Loginform">로그인</a>
			             <span class="separator">|</span>
			            <a href = "#">회원가입</a>
			        </c:otherwise>
			    </c:choose>
		  </div>
			
        </div>
      </header>
