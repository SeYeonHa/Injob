package com.injob.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.mypage.domain.AiRecommend;





@Mapper
public interface LoginMapper {

	UserVo login(String username) ;

	void saveSignup(UserVo dto);

	CompanyVo comlogin(String email);

	void saveComSignup(CompanyVo dto);

	UserVo idLogin(Long userId);
	CompanyVo idComLogin(Long com_id);

	void updateSignup(UserVo dto);

	

	
	
}