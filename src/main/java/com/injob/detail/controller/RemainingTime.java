package com.injob.detail.controller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RemainingTime {
	private int days;
    private int hours;
    private int minutes;
    private int seconds;
}