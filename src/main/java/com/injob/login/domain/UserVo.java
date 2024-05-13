package com.injob.login.domain;





import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class UserVo {
	
	private Long user_id;
	private String user_name;
	private String user_passwd;
	private String user_email;
	private String user_address;
	private String user_phone;
	private String user_social_num;
	private String indate;
	private String user_gender;
	private String role;
	

	
	public UserVo(String user_name, String user_passwd, String user_email, String user_address, String user_phone,
			String user_social_num, String indate, String user_gender, String role) {
		
		this.user_name = user_name;
		this.user_passwd = user_passwd;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.user_social_num = user_social_num;
		this.indate = indate;
		this.user_gender = user_gender;
		this.role = role;
	}
	
	
	
	
	
}
