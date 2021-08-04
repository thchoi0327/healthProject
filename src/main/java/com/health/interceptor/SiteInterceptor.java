package com.health.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.health.siteUtil.SiteUtil;

public class SiteInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (SiteUtil.isSiteOpen()) {
			return true;
		}
		response.sendRedirect("/siteClose");
		return false;
	}

}
