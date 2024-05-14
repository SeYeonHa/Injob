package com.injob.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injob.login.domain.UserVo;
import com.injob.login.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public  String   login() {
		System.out.println("허위");
		
		return "login/login";
	}
	@PostMapping("/login")
	public  String   loginA() {
		System.out.println("허위");
		
		return "/";
	}
	@GetMapping("/logout")
	public String logout() {
		
		
		return "null";
	}
	
	
	//회원가입폼
	@GetMapping("/signup")
	public String writeForm() {
		System.out.println("~~~~~~~~");
		System.out.println("~~~~~~~~");
		System.out.println("~~~~~~~~");
		return "login/writeForm";
	}
	//회원가입 완료/login/write
	@PostMapping("/write")
	public String write(UserVo userVo) {
		System.out.println("--------------");
		System.out.println("--------------");
		System.out.println("--------------");
		System.out.println(userVo);
		System.out.println(userVo);
		System.out.println(userVo);
		System.out.println(userVo);
		userService.save(userVo);
        return "redirect:/login";	

	}
	
}
