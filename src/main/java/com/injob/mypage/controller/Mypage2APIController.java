package com.injob.mypage.controller;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import com.injob.cookie.service.GetcookieService;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.PowerRecommend;
import com.injob.mypage.domain.SelectedItemVo;
import com.injob.mypage.mapper.MypageMapper;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	    	    
	@PostMapping("/Mypage/Rank")
	public ResponseEntity<List<PowerRecommend>> RankLoad(@RequestBody SelectedItemVo request, HttpSession session) {
	    Long userId = (Long) session.getAttribute("userId");
	    List<PowerRecommend> powerList = mypageMapper.getPowerMapper(userId);

	    for (PowerRecommend item : powerList) {
	        int score = 0;

	        // 1순위 조건 처리
	        switch (request.getPriority1()) {
	            case "comType":
	                if (item.getCom_type().equals(request.getComType())) {
	                    score += 15;
	                }
	                break;
	            case "salary":
	                if (Integer.parseInt(item.getCom_salary()) >= Integer.parseInt(request.getSalary())) {
	                    score += 15;
	                }
	                break;
	            case "location":
	                if (item.getCom_address().contains(request.getLocation())) {
	                    score += 15;
	                }
	                break;
	        }

	        // 2순위 조건 처리
	        switch (request.getPriority2()) {
	            case "comType":
	                if (item.getCom_type().equals(request.getComType())) {
	                    score += 10;
	                }
	                break;
	            case "salary":
	                if (Integer.parseInt(item.getCom_salary()) >= Integer.parseInt(request.getSalary())) {
	                    score += 10;
	                }
	                break;
	            case "location":
	                if (item.getCom_address().contains(request.getLocation())) {
	                    score += 10;
	                }
	                break;
	        }

	        // 3순위 조건 처리
	        switch (request.getPriority3()) {
	            case "comType":
	                if (item.getCom_type().equals(request.getComType())) {
	                    score += 5;
	                }
	                break;
	            case "salary":
	                if (Integer.parseInt(item.getCom_salary()) >= Integer.parseInt(request.getSalary())) {
	                    score += 5;
	                }
	                break;
	            case "location":
	                if (item.getCom_address().contains(request.getLocation())) {
	                    score += 5;
	                }
	                break;
	        }
             score +=70;
	        item.setScore(score);
	    }

	    for (PowerRecommend powerRecommend : powerList) {
	        System.out.println(powerRecommend);
	    }

	    return ResponseEntity.ok(powerList);
	}
	
	
}
