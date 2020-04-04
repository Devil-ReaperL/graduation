package com.liu.graduation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.entities.support.BaseArea;
import com.liu.graduation.service.AreaService;
import com.liu.graduation.service.ProductService;
import com.liu.graduation.service.ShopService;
import com.liu.graduation.service.UserService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="productService")
	ProductService productService;
	
	@Resource(name="shopService")
	ShopService shopService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@ResponseBody
	@RequestMapping(value="/cartcheck")
	public String cartcheck(@Valid Cart cart,Model model,HttpServletRequest request)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	cart.setPhonenum(user.getPhonenum());
		shopService.Cartcheck(cart);
    	return "true";
		
	}
	@RequestMapping(value="/into_order")
	public String addorder(Model model,HttpServletRequest request)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	model.addAttribute("listDept", areaService.findProvince());
    	return "order";	
	}
	/***
	 * 省份查询
	 * */
	@RequestMapping("/provinceQuery")
	@ResponseBody
	public List<BaseArea> provinceQuery() {
		List<BaseArea> listDept = areaService.findProvince();
		return listDept;
	}
 
	/**
	 * 城市查询
	 * **/
	@RequestMapping("/provinceCity")
	@ResponseBody
	public List<BaseArea> provinceCity(@RequestParam(value="province")String province) {
		
		List<BaseArea> listCity = areaService.findCity(province);
		return listCity;
	}
 
	/**
	 * 县城查询
	 * */
	@RequestMapping("/provinceCounty")
	@ResponseBody
	public List<BaseArea> provinceCounty(@RequestParam(value="city")String city) {

		List<BaseArea> listCount = areaService.findCounty(city);
		return listCount;
	}


}
