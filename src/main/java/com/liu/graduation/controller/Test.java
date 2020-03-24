package com.liu.graduation.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liu.graduation.entities.Product;
import com.liu.graduation.entities.ProductTest;
import com.liu.graduation.service.ProductService;

@RequestMapping("/uploadImg")
@Controller
public class Test {
	
	@Resource(name="productService")
	ProductService productService;
	
	@RequestMapping("/test")
	public String  test(@RequestParam("summernote") String summernote,Model  model)
	{
		System.out.println("49"+summernote);
		model.addAttribute("test", summernote);
		return "test";
	}
	@RequestMapping("/file")
	public String  testfile(@Valid Product product)
	{
		System.out.println(product.toString());
		//productService.addproduct(product.getFiles());
		return "test";
	}
}
