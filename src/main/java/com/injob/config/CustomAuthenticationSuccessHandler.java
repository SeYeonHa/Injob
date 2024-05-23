package com.injob.config;

import java.io.IOException;


import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.service.LoginCompanyService;
import com.injob.login.service.LoginService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		   System.out.println("이게실행이안되나?");
		   System.out.println("이게실행이안되나?");
		   System.out.println("이게실행이안되나?");
			HttpSession session = request.getSession();
	        Object principal = authentication.getPrincipal();
	        
	        if (principal instanceof LoginService) {
	            UserVo user = ((LoginService) principal).getUser();
	            session.setAttribute("userId", user.getUser_id());
	            session.setAttribute("role", "ROLE_USER");
	            session.setAttribute("username", user.getUser_email());
	        } else if (principal instanceof LoginCompanyService) {
	            CompanyVo company = ((LoginCompanyService) principal).getCompany();
	            session.setAttribute("companyId", company.getCom_id());
	            session.setAttribute("role", "ROLE_COMPANY");
	            session.setAttribute("comname", company.getCom_email());
	        }

	        response.sendRedirect("/");
	}

	
}
