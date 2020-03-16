package com.liu.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login")
public class UserController {
	
	@RequestMapping("/register")
	private String publ() {
		
		return "register";
	}
	
	@RequestMapping("/user_login")
	public String login(@RequestParam(value="phonenum")String phonenum,@RequestParam(value="password") String password,Model model)
	{
		System.out.println(phonenum+"\t"+password);
		model.addAttribute("user", phonenum);
		return "login";
	}
	
	@RequestMapping("/index")
	public String loginJsp()
	{
		return "login";
	}
}
