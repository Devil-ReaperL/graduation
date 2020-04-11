package com.liu.graduation.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Cart_info;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Order_info;
import com.liu.graduation.entities.Product;

public interface ShopService {
	
	public int cartAdd (Cart cart);
	public int updateCart (Cart cart);
	public int deleteCart (Cart cart);
	public List<Cart>  findCartByUser(String user) ;
	public Cart findCartByKey(Cart cart);
	public int Cartcheck (Cart cart);
	public Cart_info findCart_infoById(String user) ;
	List<Cart> findCartByChecked(String user);
	public String creatOrder(Order_info info,Model model);
	public void findOrderById(String id,Model model);
	public void findAllOrderByStatus(String user,String status,Model model);
	public int updateOrder(String id,String way);
	public List<Order> findOrder(String user,String status);

}
