package com.liu.graduation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String  testfile(@Valid Product product,Model model) throws IOException
	{
		
		if(productService.addproduct(product))
		return "true";
		else {
			
			return "false";
		}
	}
	@ResponseBody
	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable("id") String id)
	{
		
		if(id!="") {
			Product product=new Product();
			product.setEndtime(new Date());
			product.setId(id);
			if(productService.deleteProduct(product)==1)
				return "true";
			;
		}
		
		
		return "false";
	}
	@RequestMapping("/update/{id}")
	public String updateProduct(@PathVariable("id") String id,@Valid Product product,Model model)
	{

		if(product.getName()==null)
		{
			model.addAttribute("attrs", productService.findAttrList());
			model.addAttribute("product", productService.updateProduct(id));
			
			return "Product/updateProduct";
		}
		
		return "false";
	}
}
