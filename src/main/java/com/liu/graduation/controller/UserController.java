package com.liu.graduation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.entities.support.AliyunSmsUtils;
import com.liu.graduation.service.ProductService;
import com.liu.graduation.service.UserService;
import com.liu.graduation.service.impl.ProductServiceimpl;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class UserController {
	
	static Logger logger = LogManager.getLogger(UserController.class.getName());
	
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
				model.addAttribute("error", "用户名或密码错误");
				return "login";
			}
		}
		else {
			return "login";
		}
		
	}
	@RequestMapping("/retrieve")
	public String retrieveUser()
	{
		return "retrieve";
	}
	
	@ResponseBody
	@RequestMapping("/register/user")
	public boolean register(@Valid UserBeen userBeen,Model model)
	{
		if (userService.insertUser(userBeen)>0) {
			UserBeen user=new UserBeen();
			user.setPhonenum(userBeen.getPhonenum());
			model.addAttribute("user", user);
			System.out.println(userBeen);
			return true;
		}
		
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/register/user/verif")
	public String userVerif(@RequestParam("phone") String phone,Model model)
	{	
		if (phone!=null) {
			try {
				String vcode=AliyunSmsUtils.vcode();
				logger.info("手机号："+phone+"\t 发送的验证码为："+vcode);
				SendSmsResponse response =AliyunSmsUtils.sendSms(phone,vcode);
				if (response.getCode() != null && response.getCode().equals("OK")) {
					return vcode;
				}
			} catch (ClientException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "";	
		} else {
			return "";
		}
			
	
	}
	
	@RequestMapping("/index")
	public String home(Model model,HttpServletRequest request)
	{
		productService.home(model);
		return "home";
	}
}
