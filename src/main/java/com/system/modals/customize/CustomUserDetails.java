package com.system.modals.customize;

import java.util.Collection;

import com.system.modals.modal.TblAdminUsers;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {
	 
    private TblAdminUsers user;
     
    public CustomUserDetails(TblAdminUsers user) {
        this.user = user;
    }
 
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }
 
    @Override
    public String getPassword() {
        return user.getBcryptPassword();
    }
 
    @Override
    public String getUsername() {
        return user.getAdminUserName();
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return true;
    }
     
    public String getFullName() {
        return user.getAdminUserFullname();
    }
 
}
