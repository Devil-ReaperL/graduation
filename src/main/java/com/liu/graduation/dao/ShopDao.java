package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.Cart;

public interface ShopDao {
	
	public int insertCart(Cart cart);
	public int updataCart(Cart cart);
	public int deleteCart(Cart cart);
	public List<Cart> findCartByUser(@Param("user")String user);

}
