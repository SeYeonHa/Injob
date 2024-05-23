package com.injob.detail.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;

@Component
@EnableScheduling
public class ClockAutoUpdate {
	
	@Autowired
	TimerMaker timerMaker;
	
	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	private DetailMapper detailMapper;
	
	@Scheduled(fixedDelay=1000)
	public void updateTime() {
		List<PostCompVo> postings = detailMapper.getAllPostings();
		for(PostCompVo postCompVo : postings) {
			String po_end_date = postCompVo.getPo_end_date();
			if(po_end_date != null) {
				simpMessagingTemplate.convertAndSend("/topic/remainingTime/" +
						postCompVo.getPo_id(), timerMaker.makeTimer(po_end_date));
			}
		}
		
	}
}
