package com.injob.detail.scheduler;

import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.function.Supplier;

@Component
public class TimerMaker {
	
	// private static final String END_DATE_STRING = "2024-12-31 23:59:59"; // 예시로 고정된 마감 날짜
	
	public RemainingTimeMessage makeTimer(String endDateString) {
        LocalDateTime now 	  = LocalDateTime.now();
        LocalDateTime endDate = LocalDateTime.parse(endDateString, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Duration duration     = Duration.between(now, endDate);
        long secondsRemaining = duration.getSeconds();

        long days 	 = secondsRemaining / (60 * 60 * 24);
        long hours 	 = (secondsRemaining % (60 * 60 * 24)) / (60 * 60);
        long minutes = (secondsRemaining % (60 * 60)) / 60;
        long seconds = secondsRemaining % 60;

        return new RemainingTimeMessage(days, hours, minutes, seconds);
    }

	
	
	
	/*
	 * 기존 sdf 포맷팅 방식
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm.ss");
    
    Supplier<Date> dateSupplier = () -> new Date();
    
    public RemainingTimeMessage makeTimer() {
    	return new RemainingTimeMessage( );
    }
    */
}
