<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

       
 
			<div id ="right_postion">
				<div id ="side_area">
				  <div id="sideScrap">
				     <strong class="titTotal"><a href ="#" class="link">스크랩 공고</a></strong>
				     <ul class ="scrapList">
				        <c:forEach var="bookmark" items="${bookList}" varStatus="status">
					        <c:if test="${status.index < 5}">
					            <li class="on">
					                <a href="/Detail/Detail?po_id=${item.po_id}" class="item">
					                    <span class="info">
					                        <c:choose>
					                            <c:when test="${bookmark.daysRemaining <= 10}">
					                                <em class="day today">곧 마감</em>
					                            </c:when>
					                            <c:otherwise>
					                                <em class="day">D-${bookmark.daysRemaining}</em>
					                            </c:otherwise>
					                        </c:choose>
					                    </span>
					                    <span class="co">${bookmark.com_name}</span>
					                </a>
					            </li>
					        </c:if>
					    </c:forEach>
				     </ul>
				  </div><!-- sideScrap -->
				  <div id="sideCookie">
				     <strong class="titTotal"><a href ="#" class="link">최근 본 공고</a></strong>
				     <ul class ="scrapList">
				        <c:forEach var="item" items="${recentCookies}" varStatus="status">
					        <c:if test="${status.index < 5}">
					            <li class="on">
					                <a href="/Detail/Detail?po_id=${item.po_id}" class="item">
					                    <span class="info">
					                                <em class="day">${item.po_title}</em>
					                    </span>
					                    <span class="co">${item.com_name}</span>
					                </a>
					            </li>
					        </c:if>
					    </c:forEach>
				     </ul>
				  </div><!-- sideScrap -->
				</div>
			</div>
		
	
