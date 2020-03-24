package com.liu.graduation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liu.graduation.dao.AdminDao;
import com.liu.graduation.service.AdminService;

@Service("adminService")
public class AdminServiceimpl implements AdminService{
	
	@Resource
	private AdminDao adminDao;

	
	
	public int queryAdmin(String name, String password) {
		
		return adminDao.queryAdmin(name, password);
	}

}
