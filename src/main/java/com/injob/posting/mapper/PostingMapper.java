package com.injob.posting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.posting.domain.PostingVo;

@Mapper
public interface PostingMapper {

	List<PostingVo> getPostingList(PostingVo postingvo);




}
