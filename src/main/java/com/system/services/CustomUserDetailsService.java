package com.system.services;


import com.system.modals.customize.CustomUserDetails;
import com.system.modals.modal.TblAdminUsers;
import com.system.repositories.primarydb.TblAdminUserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.session.HttpSessionEventPublisher;

public class CustomUserDetailsService implements UserDetailsService {
	 
    @Autowired
    private TblAdminUserRepository tblAdminUserRepository;
     
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TblAdminUsers user = tblAdminUserRepository.getByAdminUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        
        return new CustomUserDetails(user);
    }
 
    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }
}
