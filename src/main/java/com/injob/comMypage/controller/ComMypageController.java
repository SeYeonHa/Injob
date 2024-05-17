package com.injob.comMypage.controller;

import java.time.format.DateTimeFormatter;
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
import java.time.LocalDate;

import com.injob.comMypage.domain.PostVo;
import com.injob.comMypage.mapper.ComMypageMapper;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.mypage.service.MypageService;

@Controller
@RequestMapping("/ComMypage")
public class ComMypageController {

	@Autowired
	private ComMypageMapper comMypageMapper;
	@Autowired
	private LoginMapper loginMapper;

	@RequestMapping("/Post")
	public ModelAndView getPost(PostVo postVo) {

		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
		*/
			 
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();

		List<PostVo> Postlist = comMypageMapper.selectPostList(postVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.addObject("Postlist", Postlist);
		System.out.println(Postlist);
		mv.setViewName("comMypage/post");

		return mv;
	}

	@RequestMapping("/PostView")
	public ModelAndView getPostView(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
		*/
		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = comMypageMapper.selectPostList2(postVo);

		//mv.addObject("user",userVo);
		mv.addObject("list", list);
		//mv.addObject("user_id", user_id);
		mv.setViewName("comMypage/postView");
		return mv;
	}

	@RequestMapping("/PostWrite")
	public ModelAndView getPostWrite(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();

		PostVo pv = comMypageMapper.selectPostList3(postVo);


		//mv.addObject("user",userVo);
		mv.addObject("pv", pv);
		//mv.addObject("user_id", user_id);
		mv.setViewName("comMypage/postWrite");
		return mv;
	}

	@RequestMapping("/PostSubmit")
	public ModelAndView getPostSubmit(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long com_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();
		//com_id = postVo.getUser_id();

		//comMypageMapper.insertPost(postVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");

		return mv;

	}

	@RequestMapping("/PostUpdate")
	public ModelAndView getPostUpdate(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();

		List<PostVo> list = comMypageMapper.selectPostList(postVo);

		//mv.addObject("user",userVo);
		mv.addObject("list", list);
		//mv.addObject("user_id", user_id);
		mv.setViewName("comMypage/postUpdate");
		return mv;

	}

	@RequestMapping("/PostUpdateSubmit")
	public ModelAndView getPostUpdateSubmit(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();

		comMypageMapper.updatePost(postVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Post");
		return mv;

	}

	@RequestMapping("/PostDelete")
	public ModelAndView getPostDelete(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();

		comMypageMapper.deletePost(postVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Post");
		return mv;

	}


	@RequestMapping("/ApplyHistory")
	public ModelAndView getApplyHistory(PostVo postVo) {
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
*/
		ModelAndView mv = new ModelAndView();

		List<PostVo> Historylist = comMypageMapper.selectHistory(postVo);

		for (PostVo dayReset : Historylist) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
			String formattedDate = dayReset.getPo_end_date().formatted(formatter);
		    dayReset.setStringDay(formattedDate);
		}
		
		
		mv.addObject("Historylist", Historylist);
		mv.setViewName("comMypage/applyHistory");
		return mv;
	}

}
