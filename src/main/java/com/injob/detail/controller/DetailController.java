package com.injob.detail.controller;


import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.injob.bookmark.service.GetbookmarkService;
import com.injob.cookie.service.GetcookieService;
import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;
import com.injob.detail.scheduler.RemainingTimeMessage;
import com.injob.detail.scheduler.TimerMaker;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.mapper.MypageMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DetailController {

	@Autowired
	private DetailMapper detailMapper;
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private MypageMapper mypageMapper;
	
	@Autowired
    private SimpMessagingTemplate template;
	
	//------------------------------------
		@Autowired
		private GetbookmarkService getbookmarkService;
		
		@Autowired
		private GetcookieService getcookieService;
		
		
		//-------------------------------------
	
	@Autowired
	TimerMaker timerMaker;

	/**
     * Handles the detail page request.
     * 
     * @param postCompVo The post component value object.
     * @return ModelAndView object for the detail page.
     */
	
	@GetMapping("/Detail/Detail")
	public ModelAndView getDetail(PostCompVo postCompVo) {
		PostCompVo detailList = detailMapper.getDetailList2(postCompVo);
		
		// 마감 날짜와 현재 시간 간 차이 계산
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime endDate = LocalDateTime.parse(detailList.getPo_end_date(),
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Duration duration = Duration.between(now, endDate);
        long secondsRemaining = duration.getSeconds();

        // 남은 시간 format
        long days 	 = secondsRemaining / (60 * 60 * 24);
        long hours	 = (secondsRemaining % (60 * 60 * 24)) / (60 * 60);
        long minutes = (secondsRemaining % (60 * 60)) / 60;
        long seconds = secondsRemaining % 60;

        // JSON 형식의 데이터 생성
        RemainingTimeMessage message = new RemainingTimeMessage(days, hours, minutes, seconds);

        // WebSocket을 통해 클라이언트에게 JSON 형식의 데이터 전송
        this.template.convertAndSend("/topic/remainingTime", message);
		
        
        // ============== 로그인 ================================================================ 
		System.out.println("-------------------");
		System.out.println(postCompVo.getCom_id());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
		// =========================================================================================

		
			 
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("posting", detailList);
		mv.setViewName("detail/detail");

		return mv;
	}
	
	
	
	
	/**
     * Message Mapping for "/app/remainingTime" endpoint.
     * 
     * N.B. "/app" comes from WebSocketConfig calling setApplicationDestinationPrefixes("/app")
     * 
     * @return Timer JSONified and broadcasted on @SendTo topic ("/topic/remainingTime")
     */
        
     @MessageMapping("/remainingTime/{po_id}")
     @SendTo("/topic/remainingTime/{po_id}")
     public RemainingTimeMessage remainingTime(@DestinationVariable String po_id) {
    	 PostCompVo postCompVo = detailMapper.getDetailById(po_id);
    	 //rTimeMsg 객체 생성 후 반환
    	 // TimeMaker 클래스 메소드 사용 안함
    	 return timerMaker.makeTimer(postCompVo.getPo_end_date() );
     }
     
     
     
     @GetMapping("/Detail/ComInfo")
 	public ModelAndView getDetail1(PostCompVo postCompVo, HttpSession session, HttpServletRequest request) {
 		PostCompVo detailList = detailMapper.getDetailList3(postCompVo.getCom_id());

 		//--------------------------------------------------------------------------
 				//ㅇㄴㄹㅇㄴㄹ
 				Long userId = (Long) session.getAttribute("userId");
 				
 				UserVo userVo = loginMapper.idLogin(userId);
 				List<AiRecommend> aiList = mypageMapper.getAiList(userId);
 				
 				//사이드 북마크 추천 
 			    List<AiRecommend> bookList = getbookmarkService.getBookmark(userId);
 			    	    
 			    
 			  //사이드 쿠키
 			     List<Long> recentlyViewedPosting = new ArrayList<>();
 				 
 				 recentlyViewedPosting = getcookieService.getRecentCookie(request);
 				  List<AiRecommend> recentCookies = null; // 변수를 여기서 미리 선언해둠
 				 if(recentlyViewedPosting == null) {
 					 System.out.println("쿠키가없어요~");
 					 System.out.println("쿠키가없어요22~");
 				 }else {
 					  recentCookies = mypageMapper.getPostingCookie(recentlyViewedPosting);
 				}
 		          //--------------------------------------------------------------------------

 		
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("com_id", detailList);
 		mv.addObject("posting", detailList);
 		
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
 		mv.setViewName("detail/cominfo");
 		
 		return mv;
 	}

	
}