package com.injob.login.domain;






import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CompanyVo {
	
	   private Long com_id;
	    private String com_name;
	    private String com_email;
	    private String com_type;
	    private String com_ceo;
	    private String com_passwd;
	    private String com_address;
	    private String com_phone; // 여기가 String 타입이어야 합니다.
	    private LocalDate com_indate;
	    private Long com_salary;
	    private LocalDate com_birth;
	    private String com_logo;
	    private String role;

	
	
}
