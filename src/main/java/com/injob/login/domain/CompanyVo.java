package com.injob.login.domain;






import java.time.LocalDate;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class CompanyVo {
	
	private Long com_id;
	private String com_name;
	private String com_email;
	private String com_type;
	private String com_ceo;
	private String com_passwd;
	private String com_address;
	private String com_phone;
	private LocalDate com_indate;
	private Long com_salary;
	private LocalDate com_birth;
	private String com_logo;
	private String role;
	public CompanyVo(String com_name, String com_email, String com_type, String com_ceo, String com_passwd,
			String com_address, String com_phone, LocalDate com_indate, Long com_salary, LocalDate com_birth,
			String com_logo, String role) {
		
		this.com_name = com_name;
		this.com_email = com_email;
		this.com_type = com_type;
		this.com_ceo = com_ceo;
		this.com_passwd = com_passwd;
		this.com_address = com_address;
		this.com_phone = com_phone;
		this.com_indate = com_indate;
		this.com_salary = com_salary;
		this.com_birth = com_birth;
		this.com_logo = com_logo;
		this.role = role;
	}
	
	
	
	
	
	
	
	
	
	
}
