package com.injob.detail.scheduler;

import org.springframework.stereotype.Component;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Timer;
import java.util.function.Supplier;

@Component
public class TimerMaker {
	
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm.ss");
    
    Supplier<Date> dateSupplier = () -> new Date();
    
    public RemainingTimeMessage makeTimer() {
    	return new RemainingTimeMessage("days, hours, minutes, seconds");
    }
}

