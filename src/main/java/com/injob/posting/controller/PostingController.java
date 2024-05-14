package com.injob.posting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.posting.domain.JoinVo;
import com.injob.posting.domain.PostingVo;
import com.injob.posting.mapper.PostingMapper;

@Controller
@RequestMapping("/Posting")
public class PostingController {
	
	@Autowired
	private PostingMapper postingMapper;
	@Autowired
	private LoginMapper loginMapper;
	
	// http://localhost:9090
	@RequestMapping("/PMain")
	public  ModelAndView   pmain(PostingVo postingVo, JoinVo joinVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
		
		List<JoinVo> postingList = postingMapper.getPostingList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("postingList",postingList);
		mv.setViewName("posting/pmain");
		
		return mv;
	}
	
}
