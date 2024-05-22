package com.injob.paging;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.injob.comMypage.domain.PostVo;
import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface PagingMapper {

	// mypage
	List<ResumeVo> getResumePagingList(
	        @Param("re_id")     Long re_id,
	        @Param("re_title")  String re_title,
	        @Param("license")   String license,
	        @Param("offset")    int offset,
	        @Param("pageSize")  int pageSize,
	        @Param("user_id")   Long userId);

	List<ResumeVo> getApplyHistoryPagingList(
			@Param("com_name")  String com_name,
			@Param("po_title")  String po_title,
			@Param("re_id")     Long re_id,
			@Param("offset")    int offset,
			@Param("pageSize")  int pageSize,
			@Param("result")    String result,
			@Param("user_id")   Long userId);

	int countApplyHistory(Long userId);

	int count(Long userId);
	
	// comMypage
	int countApplyHistory2(Long com_id);

	List<PostVo> getApplyHistoryPagingList2(
			@Param("ap_id")     String ap_id,
			@Param("user_name") String user_name,
			@Param("re_title")  String re_title,
			@Param("po_title")  String po_title,
			@Param("offset")    int offset,
			@Param("pageSize")  int pageSize,
			@Param("result")    String result,
			@Param("com_id")    Long com_id);

	

}
