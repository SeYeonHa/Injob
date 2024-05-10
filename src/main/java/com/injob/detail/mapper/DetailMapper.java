package com.injob.detail.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.detail.domain.DetailVo;

@Mapper
public interface DetailMapper {


	List<DetailVo> getDetailList(DetailVo detailVo);

}
