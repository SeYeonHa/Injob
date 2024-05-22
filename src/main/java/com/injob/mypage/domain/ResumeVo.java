package com.injob.mypage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeVo {

	// resumeVo
	private Long   user_id;
	private Long   re_id;
	private String re_profile;
	private String re_title;
	private String re_intti;
	private String re_intcon;
	private String license;
	private String indate;
	
	// usersVo
	private String user_name;
	private String user_passwd;
	private String user_email;
	private String user_address;
	private String user_phone;
	private String user_social_num;
	private String user_gender;
	
	// apply
	private Long   po_id;
	private String result;
	private Long   ap_id;
	
	// posting
	private Long   com_id;
	private String po_grade;
	private String hope_department;
	private String po_title;
	private String career;
	
	// company
	private String com_name;
	
	// school
	private Long   school_id;
	private String school_name;
	private String school_type;
	
	// resume_stack
	private String stack_name;
	private Long   re_stack_id;
	public String getSkills() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
