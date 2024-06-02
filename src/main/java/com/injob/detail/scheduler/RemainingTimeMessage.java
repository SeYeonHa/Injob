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
	private String message;
	
	public RemainingTimeMessage(long days, long hours, long minutes, long seconds) {
        this.days = days;
        this.hours = hours;
        this.minutes = minutes;
        this.seconds = seconds;
        this.message = null;
    }

    public RemainingTimeMessage(String message) {
        this.days = -1;
        this.hours = -1;
        this.minutes = -1;
        this.seconds = -1;
        this.message = message;
    }

}
