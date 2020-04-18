package com.liu.graduation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.liu.graduation.dao.AdminDao;
import com.liu.graduation.dao.OrderDao;
import com.liu.graduation.service.AdminService;

@Service("adminService")
public class AdminServiceimpl implements AdminService{
	
	@Resource
	private AdminDao adminDao;

	@Resource
	private OrderDao orderDao;
	
	public int queryAdmin(String name, String password) {
		
		return adminDao.queryAdmin(name, password);
	}



	@Override
	public void findAllOrder(String user, String status, String key, Model model) {
		model.addAttribute("orders", orderDao.findAllOrder(user, status, key));
		
	}



	@Override
	public int orderdeliver(String order,String id) {
		// TODO Auto-generated method stub
		return orderDao.updateOrder_logistics(order, id);
	}

}
