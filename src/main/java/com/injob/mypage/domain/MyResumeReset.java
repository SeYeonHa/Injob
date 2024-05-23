package com.injob.mypage.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyResumeReset {

	// resumeVo
	private String user_name;
	private Long   re_id;
	private String re_profile;
	private String stack;
	private String school_names;

	
	private String[] schoolNameArray;
	private String[] schoolStackArray;
	
	
	
	
	
}
