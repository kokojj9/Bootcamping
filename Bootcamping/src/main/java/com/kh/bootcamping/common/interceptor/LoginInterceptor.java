package com.kh.bootcamping.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "서비스를 이용하려면 로그인이 필요합니다");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	
	
	
	
	
	
	
}
