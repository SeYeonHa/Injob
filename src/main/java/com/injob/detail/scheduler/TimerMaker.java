package com.injob.detail.scheduler;

import org.springframework.stereotype.Component;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Timer;
import java.util.function.Supplier;

@Component
public class TimerMaker {
	
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm.ss");
    
    Supplier<Date> dateSupplier = () -> new Date(0);
    
    public Timer makeTimer() {
    	return new Timer(sdf.format(dateSupplier.get() ) );
    }
}

