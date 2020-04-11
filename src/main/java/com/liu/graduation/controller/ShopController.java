package com.liu.graduation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Order_info;
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
    	if (user!=null) {
	    	model.addAttribute("listDept", areaService.findProvince());
	    	model.addAttribute("carts", shopService.findCartByChecked(user.getPhonenum()));
	    	model.addAttribute("cart_info", shopService.findCart_infoById(user.getPhonenum()));
	    	return "order";	
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
    	
	}
	@RequestMapping(value="/order")
	public String creatorder(@Valid Order_info info,HttpServletRequest request,Model model,HttpServletResponse response)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		info.setUser(user.getPhonenum());

			response.setHeader("Cache-Control","no-cache"); 
			response.setHeader("Pragma","no-cache"); 
			response.setDateHeader("Expires",0); 
    		return shopService.creatOrder(info,model);
    		
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/findorder")
	public List<Order> findorder(@RequestParam(value="user") String user,@RequestParam(value="status",required=false) String status)
	{
		System.out.println(user+"*"+status);
		
		return shopService.findOrder(user, status);
		
	}
	
	@RequestMapping(value="/payment/{id}")
	public String intopayment(@PathVariable("id") String id,HttpServletRequest request,Model model)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		System.out.println(id);
    		shopService.findOrderById(id, model);
    		return "payment";	
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
		
	}
	@RequestMapping(value="/payment/{id}/{way}")
	public String payment(@PathVariable("id") String id,@PathVariable("way") String way,HttpServletRequest request,Model model)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		shopService.updateOrder(id, way);
    		shopService.findOrderById(id, model);
    		return "redirect:/shop/management";	
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
		
	}
	@RequestMapping(value="/management")
	public String intoManagemrnt(HttpServletRequest request,Model model)
	{
		
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		
    		shopService.findAllOrderByStatus(user.getPhonenum(), "", model);;
    		return "management";
    			
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
		
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
	public List<BaseArea> provinceCity(@RequestParam(value="province") String province) {
		
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
