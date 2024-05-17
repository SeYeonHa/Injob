package com.injob.mypage.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.KoreanDayOfWeekConverter;

import ch.qos.logback.core.net.SyslogOutputStream;

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
		
	}
}
