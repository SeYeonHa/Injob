package com.injob.login.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.injob.login.domain.CompanyVo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginCompanyService implements CustomUserDetails {

	private CompanyVo company;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<>();
		roles.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				
				return company.getRole();
			}
		});
		return roles;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return company.getCom_passwd();
	}

	@Override
	public String getUsername() {
		
		return company.getCom_email();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
	
}
