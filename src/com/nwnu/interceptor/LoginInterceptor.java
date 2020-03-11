package com.nwnu.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.nwnu.pojo.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		//��ȡ����URL
		String url=req.getRequestURI();
		//��login�⣬�������п���
		if(url.indexOf("login")>=0) {
			return true;
		}
		//��ȡSession
		HttpSession session=req.getSession();
		User user=(User) session.getAttribute("USER_SESSION");
		if(user!=null) {
			return true;
		}
		req.setAttribute("msg", "����û�е�¼�����¼");
		req.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(req, res);
		return false;
	}
	
	
	
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

	

}
