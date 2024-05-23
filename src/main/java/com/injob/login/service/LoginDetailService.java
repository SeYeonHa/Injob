package com.injob.login.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;


@Service
public class LoginDetailService implements UserDetailsService {
	
	
	@Autowired
	private LoginMapper loginMapper;
	
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserVo user = loginMapper.login(username);
		

		
		if(user != null) {
			LoginService loginDetail = new LoginService();
			loginDetail.setUser(user);
			
			return loginDetail;
			
		}else {
			System.out.println("로그인디테일서비스 기업");
			CompanyVo company = loginMapper.comlogin(username); // 새로운 메서드를 작성해서 회사 정보 가져오기
			System.out.println("로그인디테일서비스 기업 :  companyvo" + company);
			if (company != null) {
				LoginCompanyService loginCompanyDetail = new LoginCompanyService();
				loginCompanyDetail.setCompany(company);
				System.out.println(loginCompanyDetail);
				System.out.println(loginCompanyDetail);
				return loginCompanyDetail;
			}else {
			throw new UsernameNotFoundException("유저없음");
		}
		
	 }

  }
}
