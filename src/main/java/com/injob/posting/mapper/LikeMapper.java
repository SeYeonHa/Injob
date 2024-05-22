package com.injob.posting.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.injob.posting.domain.LikeVo;

@Mapper
public interface LikeMapper {

   LikeVo selectLike(LikeVo likeVo);

   void addLike(LikeVo likeVo);

   void updateLike(LikeVo like);

   void deleteLike(LikeVo like);

}