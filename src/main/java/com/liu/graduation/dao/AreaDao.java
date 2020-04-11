package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.support.BaseArea;

public interface AreaDao {
	// 查询省
	public List<BaseArea> findProvince();
	 
	// 查询市
	public List<BaseArea> findCity(@Param("province")String province);
	 
	// 查询县区
	public List<BaseArea> findCounty(@Param("city")String city);
	
	// 查询县区
	public String findName(@Param("id") String id);
	
}
