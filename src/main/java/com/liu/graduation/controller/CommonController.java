package com.liu.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/common")
@Controller
public class CommonController {
	
	@RequestMapping("/service")
	public String serviceInto()
	{
		return "service";
	}
}
