package com.injob.mypage.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.mapper.MypageMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class Mypage2APIController {
	@Autowired
	private MypageMapper mypageMapper;

	@GetMapping("/Mypage/CookDatas/Load")
	public ResponseEntity<List<AiRecommend>> CookLoad(HttpServletRequest request){
		 List<Long> recentlyViewedPosting = new ArrayList<>();
		 
		 Cookie[] cookies = request.getCookies();
		 if (cookies != null) {
			 for (Cookie cookie : cookies) {
				if("recentlyViewedposting".equals(cookie.getName())) {
					System.out.println("실행되나?");
					System.out.println("실행되나?");
					String[] values = cookie.getValue().split(":");
					for (String value : values) {
						recentlyViewedPosting.add(Long.parseLong(value.trim()));
					}
					break;	
				}
			}		 
		 }//cookies != null
		 System.out.println("------------------");
		 System.out.println("------------------");
		 System.out.println(recentlyViewedPosting);
		 System.out.println(recentlyViewedPosting);
		 
		 List<AiRecommend> mypagePostingCookie = mypageMapper.getPostingCookie(recentlyViewedPosting);
		 for (AiRecommend aiRecommend : mypagePostingCookie) {
			System.out.println(aiRecommend);
		}
		
		return new ResponseEntity<>(mypagePostingCookie, HttpStatus.OK);
	}
	    	    
	    	   
	
	
}
