package com.liu.graduation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.service.ProductService;
import com.liu.graduation.service.UserService;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="productService")
	ProductService productService;
	
	@RequestMapping("/register")
	private String register() {
		
		return "register";
	}
	
	@RequestMapping("/user_login")
	public String login(@Valid UserBeen userBeen,Model model)
	{
		
		if (userBeen.getPhonenum() != null && userBeen.getPassword() != null) {
			List<UserBeen> userBeens=userService.VerifiUser(userBeen);
			if (userBeens.size()==1) {
				model.addAttribute("user", userBeens.get(0));
				
				
				return "redirect:/login/index";
			}
			else {
				model.addAttribute("message", "用户名或密码错误");
				return "login";
			}
		}
		else {
			return "login";
		}
		
	}
	
	@RequestMapping("/index")
	public String home(Model model,HttpServletRequest request)
	{
		productService.home(model);
		return "home";
	}
}
