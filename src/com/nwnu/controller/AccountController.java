package com.nwnu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nwnu.pojo.Account;
import com.nwnu.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/findAccountById")
	public ModelAndView findAccountById(Integer id, HttpServletRequest request, HttpServletResponse response){
		//����ModelAndView����
		ModelAndView mav=new ModelAndView();		
		
		Account account=accountService.findAccountById(id);
		//��ģ�����������,�����
		mav.addObject("account",account);
		//������һ����ͼ
		mav.setViewName("user");		
		
		return mav;
	}
	
	@RequestMapping("/findAccountById2")
	public String findAccountById2(Integer id, Model model){				
		Account account=accountService.findAccountById(id);
		model.addAttribute("account",account);		
		return "user";
	}
	
	@RequestMapping("/findAccountById3")
	public String findAccountById3(Integer id, HttpServletRequest request){				
		Account account=accountService.findAccountById(id);
		request.setAttribute("account",account);		
		return "user";
	}
}
