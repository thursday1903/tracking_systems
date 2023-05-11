package com.system.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.filter.GenericFilterBean;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

public class SessionValidationFilter extends GenericFilterBean {

	  private static final String AUTHORIZATION_HEADER = "Authorization";
	  private static final String AUTHORIZATION_BEARER = "Bearer";

	  @Override
	  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
	    throws IOException, ServletException {
	    HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
	    // We will provide our own validation logic from scratch
	    // If you are using Spring OAuth or something similar 
	    // you can instead use the already authenticated token, something like:
	    // Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    // if (authentication != null && authentication.getPrincipal() instanceof Jwt) {
	    //    Jwt jwt = (Jwt) authentication.getPrincipal();
	    //    String sessionId = jwt.getClaimAsString("sessionid");
	    //    ...
	    
	    // Resolve token from request
	    String jwt = getTokenFromRequest(httpServletRequest);
	    if (jwt == null) {
	       // your choice... mine
	       filterChain.doFilter(servletRequest, servletResponse);
	       return;
	    }

	    // If the token is not valid, raise error
	    if (!this.validateToken(jwt)) {
	      throw new BadCredentialsException("Session expired");
	    }

	    // Continue filter chain
	    filterChain.doFilter(servletRequest, servletResponse);
	  }

	  // Resolve token from Authorization header
	  private String getTokenFromRequest(HttpServletRequest request){
	    String bearerToken = request.getHeader(AUTHORIZATION_HEADER);
	    if (bearerToken !=null && bearerToken.startsWith(AUTHORIZATION_BEARER)) {
	      return bearerToken.substring(7, bearerToken.length());
	    }
	    return null;
	  }

	  // Validate the JWT token
	  // We can use the jjwt library, for instance, to process the JWT token claims
	  private boolean validateToken(String token) {
	    try {
	      Claims claims = Jwts.parser()
	        // .setSigningKey(...)
	        .parseClaimsJws(token)
	        .getBody()
	      ;

	      String sessionId = (String)claims.get("sessionid"); 
	      // Process as appropriate to determine whether the session is valid or not
	      //...

	      return true;
	    } catch (Exception e) {
	      // consider logging the error. Handle as appropriate
	    }
	    

	    return false;
	  }
	}
