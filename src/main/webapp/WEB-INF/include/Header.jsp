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
			            <li><a href="/Mypage/Resume?user_id=${ user.user_id }">마이페이지</a></li>
			            <li><a href="/Board">게시판</a></li>
			        </ul>
			    </c:when>
			    <c:otherwise>
			        <!-- 회사 사용자일겨우 -->
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
			            <a class="logout" href="/Mypage/Overall">${user.user_name}</a>
			            <div class="lyMyArea">
				            <div class="myInner">
				                <div class="myLists">
				                    <ul>
				                        <li><a href="https://www.jobkorea.co.kr/User/Mypage" onclick="GA_Event('공통_PC', 'gnb', '개인회원 홈');"><span class="tx">개인회원 홈</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/ResumeMng" onclick="GA_Event('공통_PC', 'gnb', '이력서 관리');"><span class="tx">이력서 관리</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/ApplyMng" onclick="GA_Event('공통_PC', 'gnb', '입사지원 현황');"><span class="tx">입사지원 현황</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/AI?SourceType=11" onclick="GA_Event('공통_PC', 'gnb', 'AI추천');"><span class="tx">AI추천</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/PositionOffer" onclick="GA_Event('공통_PC', 'gnb', '포지션 제안');"><span class="tx">포지션 제안</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/Scrap" onclick="GA_Event('공통_PC', 'gnb', '스크랩 공고');"><span class="tx">스크랩 공고</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/Text_User/User_Pwd.asp" onclick="GA_Event('공통_PC', 'gnb', '개인정보 수정');"><span class="tx">개인정보 수정</span></a></li>
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
			            <a class="logout" href="/Mypage/Overall">${company.com_name}</a>
			            <div class="lyMyArea">
				            <div class="myInner">
				                <div class="myLists">
				                    <ul>
				                        <li><a href="https://www.jobkorea.co.kr/User/Mypage" onclick="GA_Event('공통_PC', 'gnb', '개인회원 홈');"><span class="tx">개인회원 홈</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/ResumeMng" onclick="GA_Event('공통_PC', 'gnb', '이력서 관리');"><span class="tx">이력서 관리</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/ApplyMng" onclick="GA_Event('공통_PC', 'gnb', '입사지원 현황');"><span class="tx">입사지원 현황</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/AI?SourceType=11" onclick="GA_Event('공통_PC', 'gnb', 'AI추천');"><span class="tx">AI추천</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/PositionOffer" onclick="GA_Event('공통_PC', 'gnb', '포지션 제안');"><span class="tx">포지션 제안</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/User/Scrap" onclick="GA_Event('공통_PC', 'gnb', '스크랩 공고');"><span class="tx">스크랩 공고</span></a></li>
				                        <li><a href="https://www.jobkorea.co.kr/Text_User/User_Pwd.asp" onclick="GA_Event('공통_PC', 'gnb', '개인정보 수정');"><span class="tx">개인정보 수정</span></a></li>
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
      </header>
