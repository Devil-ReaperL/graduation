package com.liu.graduation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Product;
import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.service.ProductService;
import com.liu.graduation.service.ShopService;
import com.liu.graduation.service.UserService;

@Controller
@RequestMapping("/user")
public class UserShopController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="productService")
	ProductService productService;
	
	@Resource(name="shopService")
	ShopService shopService;
	
	@ResponseBody
	@RequestMapping(value="/cartAdd",produces={"text/html;charset=UTF-8;","application/json;"})
	public String cartAdd(@RequestParam(value="id") String id,@RequestParam(value="num") String num,HttpServletRequest request)
	{
		
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		int count=Integer.parseInt(num);
    		
    		Product product=productService.findProductByid(id);
    		Cart cart=new Cart();
    		cart.setPhonenum( user.getPhonenum());
    		cart.setProduct_id(product.getId());
    		cart.setProduct_name(product.getName());
    		cart.setStock(product.getStock());
    		cart.setUnit(Float.parseFloat(product.getPrice()));
    		cart.setPicture(product.getSrcs().get(0));
    		cart.setNum(count);
    		cart.setAddtime(new Date());
    		cart.setPrice(count*Float.parseFloat(product.getPrice()));
    		cart.setStatus("0");
    		if (shopService.cartAdd(cart)>0) {
    			return "商品添加成功";
			}
    		else {
    			return "商品添加失败";
    		}
    		
    		
		}
    	else {
			return "请先登录！";
		}
    	
    
	}

	@RequestMapping(value="/intocart")
	public String intoCart(Model model,HttpServletRequest request)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		model.addAttribute("carts",shopService.findCartByUser(user.getPhonenum()));
    		return "cart";
		}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
    	
		
	}
	@ResponseBody
	@RequestMapping(value="/cartdelete/{userid}/{productid}")
	public String cartdelet(@PathVariable("userid") String userid,@PathVariable("productid") String productid,HttpServletRequest request)
	{
		System.out.println(productid);
		Cart cart=new Cart();
		cart.setPhonenum( userid);
		cart.setProduct_id(productid);
		cart.setEndtime(new Date());
		if (shopService.deleteCart(cart)>0) {
			return "true";
		}
		
		return "false";
		
	}
	@ResponseBody
	@RequestMapping(value="/cartupdata")
	public Map<String, Object> cartupdata(@Valid Cart cart,Model model,HttpServletRequest request)
	{
		System.out.println(cart);
		Map<String, Object> map=new HashMap<String, Object>();
		return map;
		
	}
}
