package com.injob.mypage.service;

import java.util.List;

import com.injob.mypage.domain.ResumeVo;

public interface MypageService {

	List<ResumeVo> selectResumeList() throws Exception;

	ResumeVo selectResumeList2() throws Exception;
	
}
