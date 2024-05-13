package com.injob.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

@RestController
public class LoginAPIContoller {

	@Autowired
	private LoginMapper loginMapper;
	
	@PostMapping("/login/contrast")
	public ResponseEntity<String> checkEmail(@RequestBody Map<String, String> requestBody) {
		String email = (String)requestBody.get("email");
		System.out.println(email);
		System.out.println(email);
		UserVo userVo =  loginMapper.login(email);
		System.out.println(userVo);
		System.out.println("확인중");
		if (userVo != null) {
		    // 유저가 발견되었을 때는 200 OK와 함께 유저 정보를 반환
		    Map<String, Object> response = new HashMap<>();
		    response.put("user", userVo);
		    return ResponseEntity.ok("User가 존재합니다");
		} else {
		    // 유저를 발견하지 못했을 때도 200 OK를 반환하고, 클라이언트에서 유저가 없는 것을 처리할 수 있도록 합니다.
		    return ResponseEntity.ok("User not found");
		}
	}
}
