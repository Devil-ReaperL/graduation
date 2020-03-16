package com.liu.graduation.dao;

import com.liu.graduation.entities.SupUserBeen;
import com.liu.graduation.entities.UserBeen;

public interface IUserDao {

	UserBeen loginVal(String phonenum, String password);

	int insertUser(UserBeen user);

	SupUserBeen supLoginVal(String rootId, String password);

	UserBeen userProving(String phonenum);

	UserBeen lostPassword(String phonenum);

	UserBeen rePassword(String phonenum, String answer);

}
