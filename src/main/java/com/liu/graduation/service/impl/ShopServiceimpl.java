package com.liu.graduation.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;

import com.liu.graduation.dao.AdminDao;
import com.liu.graduation.dao.AreaDao;
import com.liu.graduation.dao.OrderDao;
import com.liu.graduation.dao.ProductDao;
import com.liu.graduation.dao.ShopDao;
import com.liu.graduation.entities.Address;
import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Cart_info;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Order_info;
import com.liu.graduation.entities.Order_logistics;
import com.liu.graduation.entities.Order_product;
import com.liu.graduation.entities.Product;
import com.liu.graduation.entities.support.SnowFlakeIdGenerator;
import com.liu.graduation.service.ShopService;

@Service("shopService")
public class ShopServiceimpl implements ShopService{
	
	static Logger logger = LogManager.getLogger(ShopServiceimpl.class.getName());

	@Resource
	private ShopDao shopDao;
	
	@Resource
	private OrderDao orderDao;
	
	@Resource
	private AreaDao areaDao;
	@Resource
	private ProductDao productDao;
	
	@Override
	public int cartAdd(Cart cart) {
			
		return shopDao.insertCart(cart);
	}

	@Override
	public List<Cart> findCartByUser(String user) {
		// TODO Auto-generated method stub
		return shopDao.findCartByUser(user);
	}

	@Override
	public int updateCart(Cart cart) {
		// TODO Auto-generated method stub
		return shopDao.updataCart(cart);
	}

	@Override
	public int deleteCart(Cart cart) {
		// TODO Auto-generated method stub
		return shopDao.deleteCart(cart);
	}

	@Override
	public Cart findCartByKey(Cart cart) {
		// TODO Auto-generated method stub
		return shopDao.findCartByKey(cart);
	}

	@Override
	public int Cartcheck(Cart cart) {
		// TODO Auto-generated method stub
		return shopDao.cartcheck(cart);
	}

	@Override
	public Cart_info findCart_infoById(String user) {
		// TODO Auto-generated method stub
		return shopDao.findCart_infoById(user);
	}

	@Override
	public List<Cart> findCartByChecked(String user) {
		// TODO Auto-generated method stub
		return shopDao.findCartByChecked(user);
	}

	@Override
	public String creatOrder(Order_info info,Model model) {
		Order order=new Order();
		Order_logistics logistics=new Order_logistics();
		Order_product product=new Order_product();
		Address address=new Address();
		
		Cart_info cart_info=shopDao.findCart_infoById(info.getUser());
		
		try {
			//生成随机订单号
			order.setId(SnowFlakeIdGenerator.getNextId());
			
			//地址信息     创建并插入address中
			address.setId(SnowFlakeIdGenerator.getNextId());
			address.setUserid(info.getUser());
			address.setPhonenum(info.getPhonenum());
			address.setProvince(areaDao.findName(info.getProvince()));
			address.setCity(areaDao.findName(info.getCity()));
			address.setCounty(areaDao.findName(info.getCounty()));
			address.setDetails(info.getDetails());
			
			
			
			//商品信息     创建并插入order中
			product.setOrder_id(order.getId());
			product.setUser(info.getUser());
			
			
			//物流信息     创建创建并插入order中
			logistics.setOrder_id(order.getId());
			logistics.setDelivery_time(info.getArrive());
			logistics.setSegment(info.getSegment());
			logistics.setAddress_id(address.getId());
		
			
			//订单信息 
			order.setPhonenum(info.getUser());
			order.setTotal(cart_info.getChecked());
			order.setMessage(info.getMessage());
			order.setAddress_id(address.getId());
			order.setCount_price(Float.parseFloat(cart_info.getSum()));
			order.setAddtime(new Date());
			
			orderDao.insertOrder(order);
			orderDao.insertAddress(address);
			orderDao.insertOrder_logistics(logistics);
			orderDao.insertOrder_product(product);						
			shopDao.updataCartByOrder(info.getUser());
			
			
			
		} catch (Exception e) {
			logger.debug("创建order出错    原因:"+e.getMessage());
		}
		return "redirect:/shop/payment/"+order.getId();
	}

	@Override
	public void findOrderById(String id,Model model) {
		Order order=orderDao.findOrderByid(id);
		
		model.addAttribute("order", order);
		
		
	}

	@Override
	public int updateOrder(String id,String status,String way) {
		productDao.updateProductStock(id);
		return orderDao.updateOrder(id,status, way);
	}

	@Override
	public void findAllOrderByStatus(String user,String status, Model model) {
		List<Order> orders=orderDao.findOrderByUser(user);
		model.addAttribute("orders", orders);
		
	}

	@Override
	public List<Order> findOrder(String user, String status) {
		// TODO Auto-generated method stub
		return orderDao.findOrder(user, status);
	}

	@Override
	public List<Order_product> remarkProductList(String user, String remark) {
		
		return orderDao.remarkProductList(user, remark);
	}
	
			
	
}
