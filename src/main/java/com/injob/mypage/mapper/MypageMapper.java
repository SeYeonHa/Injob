package com.injob.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;

@Mapper
public interface MypageMapper {

	List<ResumeVo> selectResumeList(Long user_id);

	List<ResumeVo> selectResumeList2(ResumeVo resumeVo);

	ResumeVo selectResumeList3(ResumeVo resumeVo);

	void insertResume(ResumeVo resumeVo);

	void updateResume(ResumeVo resumeVo);

	void deleteResume(ResumeVo resumeVo);

	void insertApply(ResumeVo resumeVo);

	List<ResumeVo> selectHistory(ResumeVo resumeVo);

	List<AiRecommend> getAiList(Long userId);

	List<AiRecommend> getPostingCookie(List<Long> recentlyViewedPosting);

}
