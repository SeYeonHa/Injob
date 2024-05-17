package com.injob.comMypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.comMypage.domain.PostVo;
import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface ComMypageMapper {

	List<PostVo> selectPostList(PostVo postVo);

	List<ResumeVo> selectPostList2(PostVo postVo);

	List<PostVo> selectHistory(PostVo postVo);

	void deletePost(PostVo postVo);

	void updatePost(PostVo postVo);

	PostVo selectPostList3(PostVo postVo);

	PostVo selectResult(PostVo postVo);

	void updatePassResult(PostVo result);
	
	void updateFailResult(PostVo result);

}