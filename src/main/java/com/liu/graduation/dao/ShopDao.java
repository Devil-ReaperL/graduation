package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Cart_info;

public interface ShopDao {
	
	public int insertCart(Cart cart);
	public int updataCart(Cart cart);
	public int updataCartByOrder(@Param("user") String user);
	public int deleteCart(Cart cart);
	public List<Cart> findCartByUser(@Param("user")String user);
	public List<Cart> findCartByChecked(@Param("user")String user);
	public Cart findCartByKey(Cart cart);
	public int cartcheck(Cart cart);
	public Cart_info findCart_infoById(@Param("user")String user) ;
	

}
