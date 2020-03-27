package com.liu.graduation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String addfile(@Valid Product product,Model model) throws IOException
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
	public String update(@PathVariable("id") String id,Model model)
	{
		
			model.addAttribute("attrs", productService.findAttrList());
			model.addAttribute("product", productService.updateProduct(id));
			
			return "Product/updateProduct";
	}
	
	
	@RequestMapping("/updateProduct")
	@ResponseBody
	public String updateProduct(@Valid Product product,Model model)
	{
			
		System.out.println(product);
		
		productService.updateProduct(product);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping("/deleteImg/{id}")
	public String delete(@PathVariable("id") String id,@RequestParam(value="key")String key)
	{
		if (key!=null && id!=null) {
			key=key.replace("\\image\\", "")+";";
			if (productService.deleteImg(id, key)==1) {
				return "true";
			}
		}
				
		return "true";
	}
	@ResponseBody
	@RequestMapping("/findProduct/{page}")
	public Map<String, Object> findProduct(@RequestParam(value="find")String key,@PathVariable("page") String p)
	{
		int page=1;
		if (key==null) {
			key="";
		}
		if (p!=null) {
			 page=Integer.parseInt(p);
		}
	
		return productService.findProductList(key, page);
	}
}
