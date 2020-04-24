package com.liu.graduation.dao;

import java.util.List;

import com.liu.graduation.entities.UserBeen;

public interface UserDao {
	
	public List<UserBeen> findUserByinfo(UserBeen user);
	public int insertUser(UserBeen user);
	public int updateUser(UserBeen user);

}
