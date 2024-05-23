package com.injob.detail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostCompVo {
	
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
	private String com_name;
	private String com_logo;
	private String com_birth;
	private int    com_salary;
	private String com_type;
	private String sales;
	private String employee;
	private String com_ceo;
	
	private String bglogo;
	private String stock;
	private String page;
}
