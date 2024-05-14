package com.injob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.login.service.LoginService;

@Controller
public class HomeController {
	
	@Autowired
	private LoginMapper loginMapper;
	
	// http://localhost:9090
	@GetMapping("/")
	public  String   home(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication != null && authentication.isAuthenticated()) {
			// 사용자가 인증되어 있는 경우 UserDetails 객체를 통해 세부 정보 가져오기
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			System.out.println("----------" + username);
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			
			// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
			model.addAttribute("user", userVo);
		}
		
		return "home";
	}
	
}
