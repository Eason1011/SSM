package com.nwnu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwnu.pojo.User;
import com.nwnu.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	
	public String login(String code,String password,Model model,HttpSession session) {
		//通过用户账号和密码来查找用户
		User user=userService.findUser(code, password);
		if(user!=null) {
			//将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			model.addAttribute("user", user);
			//跳转到主页面
		    //return "student";   //跳转到主页面
			return "redirect:student";
			
		}else {
			//返回到登录界面
			model.addAttribute("msg", "账号或密码输入错误，请重新输入");
			return "login";
		}
	}
	
	
	@RequestMapping("/customer")
	public String customer(Model model,HttpSession session){
//		User user=(User) session.getAttribute("USER_SESSION");
		model.addAttribute("user",session.getAttribute("USER_SESSION"));
		return "customer";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		User user=(User) session.getAttribute("USER_SESSION");
		//清除Session
		session.invalidate();
		//页面重定向
		return "redirect:login";
	}

	
}
