package com.injob.mypage.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.injob.cookie.service.GetcookieService;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.mapper.MypageMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class Mypage2APIController {
	@Autowired
	private MypageMapper mypageMapper;
	
	@Autowired 
	private GetcookieService getcookieService;

	@GetMapping("/Mypage/CookDatas/Load")
	public ResponseEntity<List<AiRecommend>> CookLoad(HttpServletRequest request){
		 List<Long> recentlyViewedPosting = new ArrayList<>();
		 
		 recentlyViewedPosting = getcookieService.getRecentCookie(request);
		 
		 List<AiRecommend> mypagePostingCookie = mypageMapper.getPostingCookie(recentlyViewedPosting);
		 for (AiRecommend aiRecommend : mypagePostingCookie) {
			System.out.println(aiRecommend);
		}
		
		return new ResponseEntity<>(mypagePostingCookie, HttpStatus.OK);
	}
	    	    
	    	   
	
	
}
