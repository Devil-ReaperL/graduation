package com.liu.graduation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liu.graduation.dao.AdminDao;
import com.liu.graduation.dao.ShopDao;
import com.liu.graduation.entities.Cart;
import com.liu.graduation.entities.Product;
import com.liu.graduation.service.ShopService;

@Service("shopService")
public class ShopServiceimpl implements ShopService{

	@Resource
	private ShopDao shopDao;
	
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
		return 0;
	}

	@Override
	public int deleteCart(Cart cart) {
		// TODO Auto-generated method stub
		return shopDao.deleteCart(cart);
	}

}
