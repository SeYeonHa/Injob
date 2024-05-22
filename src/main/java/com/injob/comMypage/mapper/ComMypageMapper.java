package com.injob.comMypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.comMypage.domain.PostVo;
import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface ComMypageMapper {

	List<PostVo> selectPostList(Long com_id);

	List<PostVo> selectPostList2(PostVo postVo);

	List<PostVo> selectHistory(Long com_id);

	void deletePost(PostVo postVo);

	void updatePost(PostVo postVo);

	PostVo selectCompany(Long com_id);

	PostVo selectResult(PostVo postVo);

	void updatePassResult(PostVo result);
	
	void updateFailResult(PostVo result);

	List<PostVo> getResult(Long com_id);

	void insertPost(PostVo postVo);

}
