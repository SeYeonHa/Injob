package com.injob.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

@RestController
public class LoginAPIContoller {

	@Autowired
	private LoginMapper loginMapper;
	
	@PostMapping("/login/contrast")
	public ResponseEntity<String> checkEmail(@RequestBody Map<String, String> requestBody) {
		 String email = requestBody.get("email");
		    System.out.println("이메일: " + email);

		    UserVo user = loginMapper.login(email);
		    CompanyVo company = loginMapper.comlogin(email);

		    if (user != null || company != null) {
		        // 사용자 또는 회사가 발견되었을 때는 200 OK와 함께 메시지 반환
		        System.out.println("User found");
		        return ResponseEntity.ok("User found");
		    } else {
		        // 사용자와 회사를 모두 발견하지 못했을 때도 200 OK를 반환하고, 클라이언트에서 이메일 중복이 없는 것을 처리할 수 있도록 합니다.
		        System.out.println("User not found");
		        return ResponseEntity.ok("not found");
		    }
	}
	
}
