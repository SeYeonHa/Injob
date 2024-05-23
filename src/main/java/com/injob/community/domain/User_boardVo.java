package com.injob.community.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User_boardVo {	
	private Long user_id;
	private String title;
	private String content;
	private Long hit;
	private String indate;
	private Long board_id;
	private Long board_boolean;
	private Long board_like;
}




