package org.sc.scjy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public static final String LOGIN_URL="/scjy/jsp/user/user_login.jsp";
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		if(request.getRequestURI().indexOf("login")>=0){
			return true;
		}
		Integer userId=(Integer) request.getSession().getAttribute("userId");
		System.out.println(userId);
		if(userId==null){
//			request.getSession().setAttribute("msg", "请先登录");
			response.sendRedirect(LOGIN_URL);
			return true;
		}else{
			return true;
		}
	}

}
