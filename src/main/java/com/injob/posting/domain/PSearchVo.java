package com.injob.posting.domain;

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
	
	private String department;
	private String local;
	private String grade;
}
