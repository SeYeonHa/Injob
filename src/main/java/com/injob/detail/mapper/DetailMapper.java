package com.injob.detail.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;

@Mapper
public interface DetailMapper {

	PostCompVo getDetailList2(PostCompVo postCompVo);
	PostCompVo getDetailList2(@Param("po_id") String po_id);
	PostCompVo getDetailById(@Param("po_id") String po_id); // po_id로 특정 공고 정보 호출 메소드
	
	List<PostCompVo> getAllPostings();
	PostCompVo getDetailList3(Long com_id);
	


}
