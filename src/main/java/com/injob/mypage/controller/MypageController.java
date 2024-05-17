package com.injob.mypage.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.MypageService;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private LoginMapper loginMapper;

	@RequestMapping("/Resume")
	public ModelAndView getReseume(ResumeVo resumeVo) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("여기냐");
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			System.out.println("여기냐냐아");
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

			 System.out.println("여기냐냐아아아");
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);
		System.out.println("여기냐냐아아아~~");
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("mypage/resume");

		return mv;
	}

	@RequestMapping("/ResumeView")
	public ModelAndView getResumeView(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("user",userVo);
		mv.addObject("list", list);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeView");
		return mv;
	}

	@RequestMapping("/ResumeWrite")
	public ModelAndView getResumeWrite(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		ResumeVo rv = mypageMapper.selectResumeList3(resumeVo);

		System.out.println(rv);

		mv.addObject("user",userVo);
		mv.addObject("rv", rv);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeWrite");
		return mv;
	}

	@RequestMapping("/ResumeSubmit")
	public ModelAndView getResumeSubmit(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();
		user_id = resumeVo.getUser_id();

		mypageMapper.insertResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");

		return mv;

	}

	@RequestMapping("/ResumeUpdate")
	public ModelAndView getResumeUpdate(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("user",userVo);
		mv.addObject("list", list);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeUpdate");
		return mv;

	}

	@RequestMapping("/ResumeUpdateSubmit")
	public ModelAndView getResumeUpdateSubmit(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.updateResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");
		return mv;

	}

	@RequestMapping("/ResumeDelete")
	public ModelAndView getResumeDelete(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.deleteResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");
		return mv;

	}

	@RequestMapping("/Apply")
	public ModelAndView getApply(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("mypage/apply");

		return mv;
	}

	@RequestMapping("/ApplyResume")
	public ModelAndView getApplyResume(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.insertApply(resumeVo);
		
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:ApplyHistory");

		return mv;
	}

	@RequestMapping("/ApplyHistory")
	public ModelAndView getApplyHistory(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Historylist = mypageMapper.selectHistory(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Historylist", Historylist);
		mv.setViewName("mypage/applyHistory");
		return mv;
	}

}
