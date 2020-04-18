package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.Remark;

public interface RemarkDao {
	public int insertRemark(Remark remark) ;
	public List<Remark> queryRemarkById(@Param("id")String id) ;
}
