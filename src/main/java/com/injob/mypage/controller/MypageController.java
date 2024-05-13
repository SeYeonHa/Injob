package com.injob.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.MypageService;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

	@Autowired
	private MypageMapper mypageMapper;

	@RequestMapping("/Resume")
	public ModelAndView getReseume(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);

		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("/mypage/resume");

		return mv;
	}

	@RequestMapping("/ResumeView")
	public ModelAndView getResumeView(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("list", list);
		mv.setViewName("/mypage/resumeView");
		return mv;
	}

	@RequestMapping("/ResumeWrite")
	public ModelAndView getResumeWrite(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		ResumeVo rv = mypageMapper.selectResumeList3(resumeVo);

		System.out.println(rv);

		mv.addObject("rv", rv);
		mv.setViewName("/mypage/resumeWrite");
		return mv;
	}

	@RequestMapping("/ResumeSubmit")
	public ModelAndView getResumeSubmit(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();
		Long user_id = resumeVo.getUser_id();

		mypageMapper.insertResume(resumeVo);

		mv.setViewName("redirect:/Mypage/Resume");

		return mv;

	}

	@RequestMapping("/ResumeUpdate")
	public ModelAndView getResumeUpdate(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("list", list);
		mv.setViewName("/mypage/resumeUpdate");
		return mv;

	}

	@RequestMapping("/ResumeUpdateSubmit")
	public ModelAndView getResumeUpdateSubmit(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		mypageMapper.updateResume(resumeVo);

		mv.setViewName("redirect:/Mypage/Resume");
		return mv;

	}

	@RequestMapping("/ResumeDelete")
	public ModelAndView getResumeDelete(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		mypageMapper.deleteResume(resumeVo);

		mv.setViewName("redirect:/Mypage/Resume");
		return mv;

	}

	@RequestMapping("/Apply")
	public ModelAndView getApply(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);

		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("/mypage/apply");

		return mv;
	}

	@RequestMapping("/ApplyResume")
	public ModelAndView getApplyResume(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		mypageMapper.insertApply(resumeVo);

		mv.setViewName("redirect:/Mypage/ApplyHistory");

		return mv;
	}

	@RequestMapping("/ApplyHistory")
	public ModelAndView getApplyHistory(ResumeVo resumeVo) {

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Historylist = mypageMapper.selectHistory(resumeVo);

		mv.addObject("Historylist", Historylist);
		mv.setViewName("/mypage/applyHistory");
		return mv;
	}

}
