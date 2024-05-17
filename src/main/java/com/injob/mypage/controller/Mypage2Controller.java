package com.injob.mypage.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.KoreanDayOfWeekConverter;

import ch.qos.logback.core.net.SyslogOutputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class Mypage2Controller {

	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private LoginMapper loginMapper;

	//http://localhost:9090/Mypage/Overall
	@GetMapping("/Mypage/Overall")
	public ModelAndView getReseume(ResumeVo resumeVo) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    
	    System.out.println(username);
	  
	    
	    UserVo userVo = loginMapper.login(username);
	    Long userId = userVo.getUser_id();
	    
	    List<AiRecommend> aiList = mypageMapper.getAiList(userId);
	    
	    for (AiRecommend dayReset : aiList) {
	    	System.out.println("-----------------");
	    	System.out.println(dayReset.getPo_end_date()); //2024-06-05 LocalDate로 받으면 00:00:00빠짐
	    	System.out.println(dayReset.getPo_end_date().getDayOfMonth());//5 날짜만 가지고 올수있음
	    	

	    	 // DateTimeFormatter를 사용하여 원하는 형식으로 날짜를 포맷합니다.
	    	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
	    	    //위에 포멧형식으로 내 날짜 바꾸기
	    	    String formattedDate = dayReset.getPo_end_date().format(formatter);
	    	    dayReset.setStringDay(formattedDate); //06-05
		    	   
	    	    System.out.println(dayReset.getStringDay());//06.05 (수)
				/*
				 *  int dayOfMonth = dayReset.getPo_end_date().getDayOfMonth();//WEDNESDAY 요일을 가지고 올 수 있음 단 영어로찍힘 추가 작업필요
	    	     *  System.out.println("Day of Month: " + dayOfMonth);
				 *  해당 날짜의 요일 정보 DayOfWeek dayOfWeek =
				 * dayReset.getPo_end_date().getDayOfWeek(); System.out.println("Day of Week: "
				 * + dayOfWeek); String koreanDayString =
				 * KoreanDayOfWeekConverter.toKorean(dayOfWeek);
				 * dayReset.setKoreanDay(koreanDayString);//수
				 * System.out.println(dayReset.getKoreanDay()); System.out.println("한글 요일 : " +
				 * koreanDayString);
				 */
	    	    
	    	   
	    	   
		}
	   
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("aiList", aiList);
		
		mv.setViewName("mypage/overall");
		
		return mv;
		//User/Scrap
		
		
	}
	@GetMapping("/User/Scrap")
	public ModelAndView getScrap() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    
	    System.out.println(username);
	  
	    
	    UserVo userVo = loginMapper.login(username);
	    Long userId = userVo.getUser_id();
	    
	    List<AiRecommend> aiList = mypageMapper.getAiList(userId);
	    
	    for (AiRecommend dayReset : aiList) {
	    	System.out.println("-----------------");
	    	System.out.println(dayReset.getPo_end_date()); //2024-06-05 LocalDate로 받으면 00:00:00빠짐
	    	System.out.println(dayReset.getPo_end_date().getDayOfMonth());//5 날짜만 가지고 올수있음
	    	

	    	 // DateTimeFormatter를 사용하여 원하는 형식으로 날짜를 포맷합니다.
	    	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
	    	    //위에 포멧형식으로 내 날짜 바꾸기
	    	    String formattedDate = dayReset.getPo_end_date().format(formatter);
	    	    dayReset.setStringDay(formattedDate); //06-05
		    	   
	    	    System.out.println(dayReset.getStringDay());//06.05 (수)
	    	    
	    	   
	    	   
		}
	   
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("aiList", aiList);
		mv.addObject("user", userVo);
		
		mv.setViewName("mypage/scrap");
		
		return mv;
	}
	
	@GetMapping("/SaveCookie")
	public String saveCookie(@RequestParam("com_id") int comId, HttpSession session, HttpServletResponse response) {
		System.out.println(comId);
		System.out.println(comId);
		System.out.println(comId);
		System.out.println(comId);
		System.out.println("저장되고 있냐~");
	    // 최근 본 상품 정보를 쿠키에 추가
		List<Integer> recentlyViewedProducts = (List<Integer>) session.getAttribute("recentlyViewedProducts");
	    if (recentlyViewedProducts == null) {
	        recentlyViewedProducts = new ArrayList<>();
	    }
	    // 최근 본 상품 목록에 comId가 이미 있는지 확인
	    if (!recentlyViewedProducts.contains(comId)) {
	        recentlyViewedProducts.add(comId);
	    }
	  
	    
	    //쉼표 구분
	    Cookie cookie = new Cookie("recentlyViewedposting", StringUtils.collectionToCommaDelimitedString(recentlyViewedProducts));
	    
	 // 쿠키의 유효 시간 설정 (예: 1주일)
	    cookie.setMaxAge(30 * 60); // 초 단위로 설정
	    
	    // 쿠키의 경로 설정
	    cookie.setPath("/");
	    
	    // 쿠키를 HTTP 응답 헤더에 추가합니다.
	    response.addCookie(cookie);

	    // 다시 "/Detail/Detail"로 리디렉션
	    return "redirect:/Detail/Detail?com_id=" + comId;
	}
	
}
