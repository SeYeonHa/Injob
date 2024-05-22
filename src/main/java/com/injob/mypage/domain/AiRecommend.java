package com.injob.mypage.domain;

import java.time.DayOfWeek;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AiRecommend {

	// resumeVo
	private Long   po_id;
	private String   po_title;
	private String   po_content;
	private String   po_grade;
	private String   career;
	private String po_profile;
	private LocalDate po_end_date;
	private String   com_name;
	private String   com_type;
	private String   com_address;
	public Long com_id;
	private Long  user_id;
	private Long  ub_boolean;
	
	
	private int total_count;
	private String stringDay;
	private int daysRemaining;

    // Getters and setters for daysRemaining
    public int getDaysRemaining() {
        return daysRemaining;
    }

    public void setDaysRemaining(int daysRemaining) {
        this.daysRemaining = daysRemaining;
    }
	
	public String getStringDay() {
		return stringDay;
	}
	public void setStringDay(String formattedDayOfMonth) {
		 this.stringDay = formattedDayOfMonth;
	}
	
	/*
	 * private String koreanDay;
	 * public String getKoreanDay() { return koreanDay; }
	 * public void setDayOfWeek(String dayOfWeek) { this.koreanDay = dayOfWeek; }
	 */
	
}
