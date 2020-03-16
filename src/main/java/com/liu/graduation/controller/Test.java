package com.liu.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liu.graduation.entities.ProductTest;

@RequestMapping("/uploadImg")
@Controller
public class Test {
	@RequestMapping("/test")
	public String  test(@RequestParam("summernote") String summernote,Model  model)
	{
		System.out.println("49"+summernote);
		model.addAttribute("test", summernote);
		return "test";
	}
}
