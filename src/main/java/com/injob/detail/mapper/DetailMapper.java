package com.injob.detail.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;

@Mapper
public interface DetailMapper {


	List<DetailVo>   getDetailList(DetailVo detailVo);
	List<PostCompVo> getPostCompList(PostCompVo postCompVo);
	List<PostCompVo> getDetailList();

}
