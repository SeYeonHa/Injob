package com.injob.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface MypageMapper {

	List<ResumeVo> selectResumeList(ResumeVo resumeVo);

	List<ResumeVo> selectResumeList2(ResumeVo resumeVo);

	ResumeVo selectResumeList3(ResumeVo resumeVo);

	void insertResume(ResumeVo resumeVo);

	void updateResume(ResumeVo resumeVo);

	void deleteResume(ResumeVo resumeVo);

	void insertApply(ResumeVo resumeVo);

	List<ResumeVo> selectHistory(ResumeVo resumeVo);

}