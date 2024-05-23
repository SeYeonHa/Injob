package com.injob.paging;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PagingResponse<T> {

	// 현재페이지에 보여줄 오라클 자료 : 10줄
	private List<T> list = new ArrayList<>();
	
	// 아래의 paging.jsp 에서 사용할 변수들
	private Pagination pagination;
	
	public PagingResponse(List<T> list, Pagination pagination) {
		this.list.addAll(list);
		this.pagination = pagination;
	}
	
}
