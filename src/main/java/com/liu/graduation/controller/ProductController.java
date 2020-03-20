package com.liu.graduation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.graduation.entities.Product;
import com.liu.graduation.service.ProductService;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Resource(name="productService")
	ProductService productService;
	
	@ResponseBody
	@RequestMapping("/addproduct")
	public String  testfile(@Valid Product product,HttpServletResponse response) throws IOException
	{
		System.out.println(product.toString());
		//productService.addproduct(product.getFiles());
		
		return "true";
	}

}
