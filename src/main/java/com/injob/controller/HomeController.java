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

@Controller
public class HomeController {
    
    @Autowired
    private LoginMapper loginMapper;
    
    @Autowired
    private LoginDetailService loginDetailService;
    
    // http://localhost:9090
    @GetMapping("/")
    public String home(Model model) {
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof LoginService) {
                UserVo user = ((LoginService) principal).getUser();

                model.addAttribute("user", user);
                model.addAttribute("company", null); // 기업 정보는 null로 설정
            } else if (principal instanceof LoginCompanyService) {
                CompanyVo company = ((LoginCompanyService) principal).getCompany();
    
                model.addAttribute("company", company);
                model.addAttribute("user", null); // 사용자 정보는 null로 설정
                //ㅊㄴㅁㄴㅁ
            } else {
                System.out.println("유저 정보가 없음");
            }
        }
        return "home";
    }
    
}