package com.injob.detail.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;
import com.injob.detail.scheduler.RemainingTimeMessage;
import com.injob.detail.scheduler.TimerMaker;

@Controller
@EnableScheduling
public class DetailController {

    @Autowired
    private DetailMapper detailMapper;

    @Autowired
    private SimpMessagingTemplate template;
    
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

        ModelAndView mv = new ModelAndView();
        mv.addObject("posting", detailList);
        mv.setViewName("/detail/detail");

        return mv;
    }
    
    /**
     * Message Mapping for "/app/remainingTime" endpoint.
     * 
     * N.B. "/app" comes from WebSocketConfig calling setApplicationDestinationPrefixes("/app")
     * 
     * @return Timer JSONified and broadcasted on @SendTo topic ("/topic/remainingTime")
     */
        
     @MessageMapping("/remainingTime")
     @SendTo("/topic/remainingTime")
     public RemainingTimeMessage remainingTime() {
    	 //rTimeMsg 객체 생성 후 반환
    	 // TimeMaker 클래스 매소드 사용 안함
    	 return timerMaker.makeTimer();
     }
    
}
