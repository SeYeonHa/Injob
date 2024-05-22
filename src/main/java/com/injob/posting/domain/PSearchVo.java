package com.injob.posting.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PSearchVo {
	
	private String hope_department;
	private String com_address;
	private String career;
	private String po_grade;
	private String po_profile;
	private Long po_id;
	private Long com_id;
	
	private String department;
	private String local;
	private String grade;
	
	
    private String po_start_date;
	private LocalDateTime po_end_date;
	private String po_title;
	private String po_content;
    private String stack;
	private Long user_id;
	private Long ub_boolean;
	private Long ub_id;
	   
	private String stringDay;
	   

	// Getters and setters
	    public LocalDateTime getPo_end_date() {
	        return po_end_date;
	    }

	    public void setPo_end_date(LocalDateTime po_end_date) {
	        this.po_end_date = po_end_date;
	    }

	    public String getStringDay() {
	        return stringDay;
	    }

	    public void setStringDay(String stringDay) {
	        this.stringDay = stringDay;
	    }
}