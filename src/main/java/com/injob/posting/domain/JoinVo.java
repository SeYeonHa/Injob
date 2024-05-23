package com.injob.posting.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class JoinVo {
	   private Long com_id;
	   private Long po_id;
	   private String po_grade;
	   private String hope_department;
	   private String po_start_date;
	   //private String po_end_date;
	   //private LocalDate po_end_date;
	   private LocalDateTime po_end_date;
	   private String po_profile;
	   private String po_title;
	   private String po_content;
	   private String career;
	   private String stack;
	   private String com_address;
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