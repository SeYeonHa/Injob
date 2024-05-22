package com.injob.posting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.posting.domain.PSearchVo;

@Mapper
public interface PSearchMapper {

	List<PSearchVo> getSearchList(PSearchVo request);

	int getSearchCount(PSearchVo request);

	

}