package com.injob.detail.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class ClockAutoUpdate {
	
	@Autowired
	TimerMaker timerMaker;
	
	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;
	
	@Scheduled(fixedDelay=1000)
	public void TimeMaker() {
		
		// 채용공고 마감일 문자
		
		simpMessagingTemplate.convertAndSend("/topic/remainingTime", timerMaker.makeTimer() );
	}
}
