package com.health.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class SessionInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
			HttpSession session = request.getSession();
			if (session.getAttribute("userNick") == null) {
				return false;
			}
		
		
		
		return false;
	}
}
