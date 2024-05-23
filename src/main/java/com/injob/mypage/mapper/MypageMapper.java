package com.injob.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.MyResumeReset;
import com.injob.mypage.domain.PowerRecommend;
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

	void insertSchool(ResumeVo resumeVo);

	void insertSkill(ResumeVo resumeVo);

	List<ResumeVo> selectSchool(ResumeVo resumeVo);

	List<ResumeVo> selectSkill(ResumeVo resumeVo);

	Long selectMaxRe(ResumeVo resumeVo);


	List<MyResumeReset> getResume(Long userId);

	List<PowerRecommend> getPowerMapper(Long userId);


	void updateSchool(ResumeVo resumeVo);

	void updateSkill(ResumeVo resumeVo);

	Long getNewSchoolId(Long re_id);

	Long getNewReStackId(Long re_id);

	void deleteSchool(ResumeVo resumeVo);

	void deleteSkill(ResumeVo resumeVo);

	void deleteApply(ResumeVo resumeVo);

	int countBook(Long userId);

}
