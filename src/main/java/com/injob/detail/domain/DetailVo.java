package com.injob.detail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailVo {

	private int com_id;
	private int po_id;
	private String po_grade;
	 
	private String hope_department;
	private String po_start_date;
	private String po_end_date;
	private String po_profile;
	private String po_title;
	private String po_content;
	private String career;
	
	
}
