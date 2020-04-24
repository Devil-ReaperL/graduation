package com.liu.graduation.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.entities.Remark;
import com.liu.graduation.entities.UserBeen;

public interface UserService {
	public  List<UserBeen> VerifiUser(UserBeen user);
	public int insertUser(UserBeen user);
	public int updateUser(UserBeen user);
	public int insertRemark(Remark remark , MultipartFile[] files ,String orderid);
}
