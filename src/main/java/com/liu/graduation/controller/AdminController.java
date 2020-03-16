package com.liu.graduation.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liu.graduation.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping("/into")
	public String adminInto()
	{
		return "suplogin";
	}
	@RequestMapping("/login")
	public String loginadmin(@RequestParam("rootId") String name,@RequestParam("password") String password,ModelMap model)
	{
		System.out.println(name+"\t"+password);
		if(adminService.queryAdmin(name, password)==0)
		{
			
			return "suplogin";
		}
			
		else
			return "Administrator1";
	}
	
	@RequestMapping("/findlist")
	public String findProductList()
	{
		return "AdministratorResult";
	}
	
	@RequestMapping("/add")
	public String addProduct()
	{
		return "Product/addProduct";
	}
	
	@RequestMapping("/modify")
	public String modifyProduct()
	{
		return "AdministratorUpdate";
	}
	
	@RequestMapping("/remove")
	public String removeProduct()
	{
		return "AdministratorDelete";
	}
	@RequestMapping("/test/{way}")
	public String test(@PathVariable("way") String way)
	{
		return way;
	}
}
