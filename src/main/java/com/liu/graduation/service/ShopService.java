package com.liu.graduation.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Cart_info;
import com.liu.graduation.entities.Product;

public interface ShopService {
	
	public int cartAdd (Cart cart);
	public int updateCart (Cart cart);
	public int deleteCart (Cart cart);
	public List<Cart>  findCartByUser(String user) ;
	public Cart findCartByKey(Cart cart);
	public int Cartcheck (Cart cart);
	public Cart_info findCart_infoById(String user) ;

}
