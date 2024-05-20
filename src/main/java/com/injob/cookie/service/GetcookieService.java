package com.injob.cookie.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class GetcookieService {

	
	public List<Long> getRecentCookie(HttpServletRequest request){
		List<Long> recentlyViewedPosting = new ArrayList<>();

	    // 쿠키에서 recentlyViewedposting 값을 읽음
	    Cookie[] cookies = request.getCookies();
	    //이미 만들어진 쿠키가 있다면 그 쿠키를(쉼표문자열로 구분되어있는 자료를) 어레이리스트로 반환한다.
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("recentlyViewedposting".equals(cookie.getName())) {
	                String cookieValue = cookie.getValue();
	                if (!cookieValue.isEmpty()) {
	                	//문자열을 , 기준으로 배열로 빼고 
	                	//스트림으로 하나하나의 문자열을 파싱하고(int로)
	                	// 다시 스트림을 Arraylist로 반환한다
	                	recentlyViewedPosting = Arrays.stream(cookieValue.split(":"))
	                                                   .map(Long::parseLong)                                                   
	                                                   .collect(Collectors.toList());
	                }
	                break;
	            }
	        }
	    }
	     System.out.println("------------------");
		 System.out.println("------------------");
		 System.out.println(recentlyViewedPosting);
		 System.out.println(recentlyViewedPosting);
		return recentlyViewedPosting.isEmpty() ? null :recentlyViewedPosting;
		
	}
}
