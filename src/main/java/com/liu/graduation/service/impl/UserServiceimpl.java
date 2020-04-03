package com.liu.graduation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liu.graduation.dao.UserDao;
import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.service.UserService;

@Service("userService")
public class UserServiceimpl implements  UserService{

	@Resource
	private UserDao userDao;
	
	@Override
	public List<UserBeen> VerifiUser(UserBeen user) {
		// TODO Auto-generated method stub
		return userDao.findUserByinfo(user);
	}

}
