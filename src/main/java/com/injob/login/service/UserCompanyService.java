package com.injob.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserCompanyService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public void save( CompanyVo dto) { //도메인 유저
    	String bCryPasswd = bCryptPasswordEncoder.encode(dto.getCom_passwd());
    	dto.setCom_passwd(bCryPasswd);
    			
    	loginMapper.saveComSignup(dto);
    
        //  dto 안에 있는 data 를 저장하고 
        //  저장된 id return
    }
}
