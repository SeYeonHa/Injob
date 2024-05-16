package com.injob.posting.domain;

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
	   private String po_end_date;
	   private String po_profile;
	   private String po_title;
	   private String po_content;
	   private String career;
	   private String stack;
	   private String com_address;
	   

}