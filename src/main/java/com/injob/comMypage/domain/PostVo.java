package com.injob.comMypage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVo {
	private Long com_id;
	private Long po_id;
	private String po_grade;
	private String hope_department;
	private String po_start_date;
	private String po_end_date;
	private String po_profile;
	private String po_title;
	private String po_content;
	private String career;
	
	// usersVo
	private String user_name;
	private String user_passwd;
	private String user_email;
	private String user_address;
	private String user_phone;
	private String user_social_num;
	private String user_gender;
	
	// comVo
	private String com_name;
	private String com_email;
	private String com_type;
	private String com_ceo;
	private String com_passwd;
	private String com_address;
	private String com_phone;
	private String com_indate;
	private String com_salary;
	private String com_birth;
	private String com_logo;
	
	// resumeVo
	private Long   user_id;
	private Long   re_id;
	private String re_profile;
	private String re_title;
	private String re_intti;
	private String re_intcon;
	private String license;
	private String indate;
	
	// apply
	private String ap_id;
	private String result;
	
	private String stringDay;
	
	
	public String getStringDay() {
		return stringDay;
	}
	public void setStringDay(String formattedDayOfMonth) {
		 this.stringDay = formattedDayOfMonth;
	}

}
