package com.system.interfaces;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}