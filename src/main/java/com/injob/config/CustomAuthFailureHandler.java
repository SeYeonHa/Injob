package com.injob.config;

import java.io.IOException;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwwwww" +exception);
		System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwwwww" +exception);
		System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwwwww" +exception);

	   String errorMessage = "";
       if (exception instanceof BadCredentialsException) {
		   errorMessage = "아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해 주세요.";
       } else if (exception instanceof InternalAuthenticationServiceException) {
           errorMessage = "내부적으로 발생한 시스템 문제로 인해 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
       } else if (exception instanceof UsernameNotFoundException) {
           errorMessage = "계정이 존재하지 않습니다. 회원가입 진행 후 로그인 해주세요.";
       } else if (exception instanceof AuthenticationCredentialsNotFoundException) {
           errorMessage = "인증 요청이 거부되었습니다. 관리자에게 문의하세요.";
	   } else {
           errorMessage = "알 수 없는 이유로 로그인에 실패하였습니다 관리자에게 문의하세요.";
	   }
      // setDefaultFailureUrl("/auth/login?error=true&exception=" + errorMessage);
       System.out.println("오류발생:" + exception + "\n" + errorMessage); 
	   super.onAuthenticationFailure(request, response, exception);
	   
	   // 예외처리 나중에 반영할 것 : https://dev-coco.tistory.com/126
	}

}
