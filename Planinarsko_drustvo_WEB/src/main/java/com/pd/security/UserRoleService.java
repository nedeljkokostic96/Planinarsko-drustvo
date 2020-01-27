package com.pd.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.pd.repository.OsobaRepository;

import model.Osoba;

@Service("customUserDetailsService")
public class UserRoleService implements UserDetailsService {
	
	@Autowired
	private OsobaRepository osobaRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Osoba osoba = osobaRepository.findOsobaByJMBG(username);
		UserRole ur = new UserRole();
		ur.setPassword(osoba.getPassword());
		ur.setUsername(osoba.getJmbg());
		ur.setRole(osoba.getUlogaBean());
		return ur;
	}

}
