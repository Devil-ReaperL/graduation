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
import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Order_info;
import com.liu.graduation.entities.Order_product;
import com.liu.graduation.entities.Remark;
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
    		return shopService.creatOrder(info,model);
    		
    	}else {
			model.addAttribute("message", "请先登录");
			return "redirect:/login/index";
		}
		
	}
	
	@RequestMapping("/order/show/id/{id}")
	public String order_info(@PathVariable("id") String id,Model model)
	{
		shopService.findOrderById(id, model);
		return "orderinfo";
	}
	@ResponseBody
	@RequestMapping("/order/cancel/{id}")
	public boolean orderCancel(@PathVariable("id") String id)
	{
		if (shopService.updateOrder(id, "0", "")>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value="/findorder")
	public List<Order> findorder(@RequestParam(value="user") String user,@RequestParam(value="status",required=false) String status)
	{
		
		return shopService.findOrder(user, status);
		
	}
	@ResponseBody
	@RequestMapping(value="/remarkinfo")
	public List<Order_product> remarkProduct(@RequestParam(value="user") String user,@RequestParam(value="remark",required=false) String remark)
	{
		List<Order_product> list=shopService.remarkProductList(user,remark);
		for (Order_product order_product : list) {
			System.out.println(order_product);
		}
		return list;
		
	}
	
	@RequestMapping(value="/remark/id/{orderid}/{id}")
	public String remarkinto(@PathVariable("orderid") String orderid,@PathVariable("id") String id,Model model)
	{
		model.addAttribute("product", productService.findProductInfoByid(id));
		shopService.findOrderById(orderid, model);
		return "remark";
		
	}
	@ResponseBody
	@RequestMapping(value="/remark")
	public boolean remarkproduct(@Valid Remark remark,@RequestParam(value="files",required=false) MultipartFile[] files,
			@RequestParam("orderid")String orderid,HttpServletRequest request,Model model)
	{
		HttpSession  session=request.getSession();
    	UserBeen user=(UserBeen) session.getAttribute("user");
    	if (user!=null) {
    		remark.setPhonenum(user.getPhonenum());
    		if (userService.insertRemark(remark, files, orderid)==1) {
    			return true;
			} else {
				return false;
			}   		
		} 
    	return false;
		
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
    		shopService.updateOrder(id, "10",way);
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
