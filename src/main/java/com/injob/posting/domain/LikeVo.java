package com.injob.posting.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeVo {
	private Long user_id;
	private Long po_id;
	private Long ub_boolean;
	private Long ub_id;
}