package com.injob.detail.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.injob.detail.domain.PostCompVo;

@Mapper
public interface DetailMapper {
    PostCompVo getDetailList2(PostCompVo postcompVo);

}

