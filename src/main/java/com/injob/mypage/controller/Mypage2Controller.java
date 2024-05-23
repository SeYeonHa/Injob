package com.injob.mypage.controller;

import java.io.Console;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.StringJoiner;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.injob.bookmark.mapper.BookmarkMapper;
import com.injob.bookmark.service.GetbookmarkService;

import com.injob.cookie.service.GetcookieService;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.login.service.LoginService;
import com.injob.login.service.UserService;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.MyResumeReset;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.KoreanDayOfWeekConverter;

import ch.qos.logback.core.net.SyslogOutputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class Mypage2Controller {

	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserService userService;
	
	@Autowired
	private GetbookmarkService getbookmarkService;
	@Autowired 
	private GetcookieService getcookieService;

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
	@GetMapping("/User/Scrap") // 이거 나중에 합치고 /Mypage 압에 넣고 하기  jsp도 너무 따로따로임
	public ModelAndView getScrap(HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		Long userId = (Long) session.getAttribute("userId");
		UserVo userVo = loginMapper.idLogin(userId);
		
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
	    	    
	    	    //남은날짜 
	    	    LocalDate today = LocalDate.now();
		        Period period = Period.between(today, dayReset.getPo_end_date());
		    	int daysRemaining = period.getDays();
		    	dayReset.setDaysRemaining(daysRemaining);
		}
		
		//사이드 북마크 추천 
	    List<AiRecommend> bookList = getbookmarkService.getBookmark(userId);
	    	    
	    
	  //사이드 쿠키
	     List<Long> recentlyViewedPosting = new ArrayList<>();
		 
		 recentlyViewedPosting = getcookieService.getRecentCookie(request);
		  List<AiRecommend> recentCookies = null; // 변수를 여기서 미리 선언해둠
		 if(recentlyViewedPosting == null) {
			 System.out.println("쿠키가없어요~");
			 System.out.println("쿠키가없어요~");
		 }else {
			  recentCookies = mypageMapper.getPostingCookie(recentlyViewedPosting);
			  System.out.println("쿠키생성됨~");
			  System.out.println("쿠키생성됨~");
			  System.out.println("쿠키생성됨~");
			  System.out.println("쿠키생성됨~");
		}
		//사이드 쿠키
		 
		 List<MyResumeReset> resumeList = mypageMapper.getResume(userId);
		 int bookCount = mypageMapper.countBook(userId);
         
		 System.out.println(resumeList);
		 
		 for (MyResumeReset resume : resumeList) {
			if(resume.getSchool_names() != null) {
				resume.setSchoolNameArray(resume.getSchool_names().split(","));
			}else {
				resume.setSchoolNameArray(new String[0]);
			}
		
		    if (resume.getStack() != null) {
                resume.setSchoolStackArray(resume.getStack().split(","));
            } else {
                resume.setSchoolStackArray(new String[0]);
            }
		}
		 ObjectMapper objectMapper = new ObjectMapper();
		 String resumeListJson = objectMapper.writeValueAsString(resumeList);
		    
	    
	   
		ModelAndView mv = new ModelAndView();
		mv.addObject("bookCount",bookCount);
		mv.addObject("resumeList",resumeList);
		mv.addObject("resumeListJson", resumeListJson);
		mv.addObject("aiList", aiList);
		mv.addObject("user", userVo);
		mv.addObject("user_id", userId);
		mv.addObject("recentCookies", recentCookies);
		mv.addObject("bookList", bookList);
		
		mv.setViewName("mypage/scrap");
		
		return mv;
	}
	
	@GetMapping("/SaveCookie")
	public String saveCookie(@RequestParam("po_id") Long poId, HttpServletRequest request, HttpServletResponse response) {
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
	    System.out.println("어레이리스트에 저장된 comid값들");
	    System.out.println(recentlyViewedPosting);
	    System.out.println("어레이리스트에 저장된 comid값들");
	    System.out.println(recentlyViewedPosting);


	    // 최근 본 상품 목록에 comId가 이미 있는지 확인하고 추가
	    if (!recentlyViewedPosting.contains(poId)) {
	    	recentlyViewedPosting.add(poId);
	    }
	  
	    
	    StringJoiner joiner = new StringJoiner(":");
	    for (Long item : recentlyViewedPosting) {
	        joiner.add(String.valueOf(item));
	    }
	    String commaSeparatedString = joiner.toString();
	    
	    System.out.println("StringJoiner");
	    System.out.println(commaSeparatedString);
	    
	
	    
	    // 쉼표로 구분된 문자열로 변환하여 쿠키에 저장
	    Cookie cookie = new Cookie("recentlyViewedposting", commaSeparatedString);
	    
	    
	    System.out.println("자지막으로 저장되는 쿠키값");
	    System.out.println(cookie);
	 

	    // 쿠키의 유효 시간 설정 (예: 1주일)
	    cookie.setMaxAge(5 * 60); // 초 단위로 설정

	    // 쿠키의 경로 설정
	    cookie.setPath("/");

	    // 쿠키를 HTTP 응답 헤더에 추가
	    response.addCookie(cookie);

	    System.out.println("쿠키에 저장된 값: " + cookie.getValue());

	    // 다시 "/Detail/Detail"로 리디렉션
	    return "redirect:/Detail/Detail?po_id=" + poId;
	}
	
	@GetMapping("/Text_User/User_Info")
	public ModelAndView UserInfoUpdate(HttpSession session) {
		
		Long userId =  (Long) session.getAttribute("userId");
		UserVo userVo = loginMapper.idLogin(userId);
		System.out.println("세션연결");
		System.out.println(userVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/userInfoUpdate");
		mv.addObject("user_id", userVo);
		mv.addObject("user", userVo);
		return mv;
		
	}
	@PostMapping("/Text_User/User_Write")
	public String UserInfoWrite(UserVo userVo, HttpSession session) {
		System.out.println("세션연결");
		System.out.println(userVo);
		UserVo user = userVo;
		user.setUser_id((Long)session.getAttribute("userId"));
		System.out.println("변환된vo");
		System.out.println(user);
		userService.update(user);
		
		
        return "redirect:/logout";
	}
	
	
}
