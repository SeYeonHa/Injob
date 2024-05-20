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
	// private long remainingTime;
	

}
