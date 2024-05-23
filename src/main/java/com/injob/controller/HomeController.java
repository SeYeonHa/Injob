package com.injob.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.login.service.CustomUserDetails;
import com.injob.login.service.LoginCompanyService;
import com.injob.login.service.LoginDetailService;
import com.injob.login.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
    
    @Autowired
    private LoginMapper loginMapper;
    
    @Autowired
    private LoginDetailService loginDetailService;
    
    // http://localhost:9090
    @GetMapping("/")
    public String home(Model model, HttpSession session) {
    	 System.out.println("home 컨트롤러까지는");
    	 String role = (String) session.getAttribute("role");
         if ("ROLE_USER".equals(role)) {
             String userEmail = (String) session.getAttribute("username");
             UserVo user = loginMapper.login(userEmail);
             model.addAttribute("user", user);
             model.addAttribute("company", null); // 기업 정보는 null로 설정
             return "redirect:Posting/PMain";
         } else if ("ROLE_COMPANY".equals(role)) {
        	 System.out.println("home 컨트롤러까지는 오나 기업");
             String companyEmail = (String) session.getAttribute("comname");
             CompanyVo company = loginMapper.comlogin(companyEmail);
             model.addAttribute("company", company);
             model.addAttribute("user", null); // 사용자 정보는 null로 설정
             return "redirect:Posting/PMainCompany";
         } else {
             System.out.println("유저 정보가 없음");
         }
        return "redirect:Posting/PMainCompany";
    }
    
}