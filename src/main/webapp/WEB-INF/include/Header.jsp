<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <header>
        <div class="headerWrapper">
          <div id="gnb">
            <h1 id="logo">
              <a href="/"><img src="/img/logo.png" /></a>
            </h1>
            <c:choose>
			    <c:when test="${sessionScope.userLogin != null }">
			        <!-- 개인 사용자일 경우 -->
			        <ul class="navbar" id="on_user_login">
			            <li><a href="/Company/List?nowpage=1">채용목록</a></li>
			            <li><a href="/Resume/List">이력서</a></li>
			            <li><a href="/User/View?nowpage=1">마이페이지</a></li>
			            <li><a href="/Board">커뮤니티</a></li>
			        </ul>
			    </c:when>
			    <c:when test="${sessionScope.companyLogin != null }">
			        <!-- 기업 사용자일 경우 -->
			        <ul class="navbar" id="on_company_login">
			            <li><a href="/Company/List?nowpage=1">채용목록</a></li>
			            <li><a href="/Company/MyPage?nowpage=1">마이페이지</a></li>
			            <li><a href="/Board">커뮤니티</a></li>
			        </ul>
			    </c:when>
			    <c:otherwise>
			        <!-- 로그인하지 않은 경우 -->
			        <ul class="navbar" id="nologin">
			            <li><a href="#">공채정보</a></li>
			            <li><a href="#">취업톡톡</a></li>
			            <li><a href="#">마이페이지</a></li>
			            <li><a href="#">게시판</a></li>
			        </ul>
			    </c:otherwise>
			</c:choose>
          </div>
           
          <div class="login-link">
			    <c:choose>
			        
			        <c:when test="${sessionScope.userLogin != null}">
			            <a href="/logout">로그아웃</a>
			        </c:when>
		
			        <c:when test="${sessionScope.companyLogin != null}">
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
