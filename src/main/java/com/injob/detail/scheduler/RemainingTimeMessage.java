package com.injob.detail.scheduler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RemainingTimeMessage {
	private long days;
	private long hours;
	private long minutes;
	private long seconds;
	private long remainingTime;
	

    public RemainingTimeMessage(long days, long hours, long minutes, long seconds) {
           this.days = days;
           this.hours = hours;
           this.minutes = minutes;
           this.seconds = seconds;
           this.remainingTime = days * 24 * 60 * 60 + hours * 60 * 60 + minutes * 60 + seconds;
    	}


	public RemainingTimeMessage(String string) {
		}
	}
