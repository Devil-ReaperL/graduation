package com.liu.graduation.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liu.graduation.service.UserServiceTest;

@Controller
public class Test {
	@Resource(name="userServiceTest")
	private UserServiceTest  userServiceTest;


	@RequestMapping("test")
	public String Fun()
	{
		System.out.println(userServiceTest.test());
		return "404";
	}
	@RequestMapping("")
	public String Fu1n()
	{
		System.out.println(userServiceTest.test());
		return "login";
	}
}
