package com.liu.graduation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liu.graduation.dao.UserMapper;
import com.liu.graduation.service.UserServiceTest;


@Service("userServiceTest")
public class UserServiceTestimpl implements UserServiceTest{
	
	@Resource
	private UserMapper usermapper;




	@Override
	public int test() {
		
		return usermapper.total();
	}

}
