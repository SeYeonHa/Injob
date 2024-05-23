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
			   <c:when test="${not empty company}">
			        
			        
			        <!-- 회사 사용자일겨우 -->
			        <ul class="navbar" id="nologin">
			            <li><a href="/Posting/PMainCompany">공채정보</a></li>
				        <li><a href="/Community/ComList?user_id=1">게시판</a></li>	
				        <li><a href="/ComMypage/Post?com_id=1">기업 마이페이지</a></li>	
			        </ul>
			    </c:when>
			    <c:otherwise>
			        <!-- 개인 사용자일 경우 -->
			        <ul class="navbar" id="on_user_login">
			            <li><a href="/Posting/PMain">공채정보</a></li>
			            <li><a href="/Mypage/Resume?&nowpage=1">마이페이지</a></li>
			            <li><a href="/Community/List">게시판</a></li>
			            
			        </ul>
			    </c:otherwise>
			</c:choose>
          </div>
           
          <div class="login-link">
			    <c:choose>	        
			       <c:when test="${not empty company}">
				        <a class="logout" href="/ComMypage/Post">${company.com_name}</a>
			            <div class="lyMyArea">
				            <div class="myInner">
				                <div class="myLists">
				                    <ul>
				                        <li><a href="/ComMypage/Post"><span class="tx">공고관리</span></a></li>
				                        <li><a href="/ComMypage/ApplyHistory?nowpage=1" ><span class="tx">지원현황 관리</span></a></li>
				                        <li><a href="/ComMypage/ApplyHistory?nowpage=1" ><span class="tx">회원정보관리</span></a></li>				                
				                        
				                    </ul>
				                </div>
				                <div class="lyRow">
				                    <div class="btnRowWrap">
				                        <a href="/logout" class="btnLogOut">로그아웃</a>
				                    </div>
				                </div>
				            </div>
				            <span class="icnArr spGnb"></span>
				        </div>
			        </c:when>
			        <c:otherwise>
			            <a class="logout" href="/Mypage/Resume?user_id=${user.user_id}&nowpage=1">${user.user_name}</a>
			            <div class="lyMyArea">
				            <div class="myInner">
				                <div class="myLists">
				                    <ul>
				                        <li><a href="/Mypage/Resume?user_id=${user.user_id}&nowpage=1"><span class="tx">개인회원 홈</span></a></li>
				                        <li><a href="/Mypage/Resume?user_id=${user.user_id}&nowpage=1" ><span class="tx">이력서 관리</span></a></li>
				                        <li><a href="/Mypage/ApplyHistory?user_id=${user.user_id}&nowpage=1" ><span class="tx">입사지원 현황</span></a></li>
				                        <li><a href="/User/Scrap" ><span class="tx">AI추천</span></a></li>
				                        <li><a href="/User/Scrap" ><span class="tx">스크랩 공고</span></a></li>
				                        <li><a href="/Text_User/User_Info" >개인정보 수정</span></a></li>
				                    </ul>
				                </div>
				                <div class="lyRow">
				                    <div class="btnRowWrap">
				                        <a href="/logout" class="btnLogOut">로그아웃</a>
				                    </div>
				                </div>
				            </div>
				            <span class="icnArr spGnb"></span>
				        </div>
			        </c:otherwise>
			    </c:choose>
		  </div>
			
        </div>
        <script src="<c:url value='/js/main.js'/>"></script>
      </header>
