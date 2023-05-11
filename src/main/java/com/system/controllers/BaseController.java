package com.system.controllers;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class BaseController {
	
	public void logRequest()
	{
		
	}
	
	public String getCurrentSessionAuthen()
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String currentUserName = authentication.getName();
		    System.out.println("current user:"+ currentUserName);
		    return currentUserName;
		}
		return null;
	}
	
	@ExceptionHandler({ Exception.class })
	public String databaseError() {
		return "error";
	}
}
