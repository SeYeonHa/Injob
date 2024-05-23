package com.injob.paging;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface MypagePagingMapper {

	int count(ResumeVo resumeVo);

	List<ResumeVo> getResumePagingList(Long re_id, String re_title, String license, int offset, int pageSize);

	

}
