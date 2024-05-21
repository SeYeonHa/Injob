package com.injob.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface MypageMapper {

	List<ResumeVo> selectResumeList(Long userId);

	List<ResumeVo> selectResumeList2(ResumeVo resumeVo);

	ResumeVo selectResumeList3(Long userId);

	void insertResume(ResumeVo resumeVo);

	void updateResume(ResumeVo resumeVo);

	void deleteResume(ResumeVo resumeVo);

	void insertApply(ResumeVo resumeVo);

	List<ResumeVo> selectHistory(Long userId);

	List<AiRecommend> getAiList(Long userId);

	List<AiRecommend> getPostingCookie(List<Long> recentlyViewedPosting);

	List<ResumeVo> selectResumeList4(ResumeVo resumeVo);

}
