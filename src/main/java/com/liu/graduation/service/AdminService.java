package com.liu.graduation.service;

import org.springframework.ui.Model;

public interface AdminService {
	public int  queryAdmin(String name,String password);
	public void findAllOrder(String user,String status,String key,Model model);
	public int orderdeliver(String order,String id) ;
}
