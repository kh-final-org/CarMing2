package com.finalPJ.carming.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[interceptor]: preHandle");
		
		//로그인이 필요없는 기능들을 조건에 추가바람
		if(		request.getRequestURI().contains("/loginform.do") ||
				request.getRequestURI().contains("/home.do") ||
				request.getRequestURI().contains("/boardmainform.do") ||
				request.getRequestURI().contains("/boardinsertform.do") ||
				request.getRequestURI().contains("/boardinsertres.do") ||
				request.getRequestURI().contains("/boarddetailform.do") ||
				request.getRequestURI().contains("/profileform.do") ||
				request.getRequestURI().contains("/privateform.do") ||
				
				request.getRequestURI().contains("/insertform.do") ||
				request.getRequestURI().contains("//productinsert.do") ||
				request.getRequestURI().contains("/productdetail.do") ||
				request.getRequestURI().contains("/productlist.do") ||
				request.getRequestURI().contains("/productdelete.do") ||
				
				request.getSession().getAttribute("login")!=null) {
			
			return true;
						
		}
		
		
		if(request.getSession().getAttribute("login") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 이후 사용하실 수 있습니다.'); location.href='loginform.do'; </script>");
			out.flush();
		}
	
		return false;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("[interceptor]: postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("[interceptor]: afterCompletion");
	}
	
}
