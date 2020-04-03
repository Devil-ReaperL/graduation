package com.liu.graduation.service;

import java.util.List;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Product;

public interface ShopService {
	
	public int cartAdd (Cart cart);
	public int updateCart (Cart cart);
	public int deleteCart (Cart cart);
	public List<Cart>  findCartByUser(String user) ;

}
