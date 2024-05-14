package com.injob.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.injob.login.domain.UserVo;





@Mapper
public interface LoginMapper {

	UserVo login(String username) ;

	void saveSignup(UserVo dto);

	
	
}