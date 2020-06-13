package com.liu.graduation.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.graduation.entities.Product;

@RequestMapping("/common")
@Controller
public class CommonController {
	
	@RequestMapping("/service")
	public String serviceInto()
	{
		return "service";
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public String delete()
	{
	
				return "true";
	}
	@ResponseBody
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return "true";
	}
}
