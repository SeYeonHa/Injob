package com.injob.detail.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

@Controller
public class DetailController {

	@Autowired
	private DetailMapper detailMapper;
	@Autowired
	private LoginMapper loginMapper;

	@GetMapping("/Detail/Detail")
	public ModelAndView getDetail( PostCompVo postCompVo) {
		
		System.out.println("-------------------");
		System.out.println(postCompVo.getCom_id());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		PostCompVo detailList = detailMapper.getDetailList2(postCompVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("posting", detailList);
		mv.setViewName("detail/detail");

		return mv;
	}

	
}
