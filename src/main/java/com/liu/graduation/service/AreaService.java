package com.liu.graduation.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liu.graduation.entities.support.BaseArea;

public interface AreaService {
	
	// 查询省
	public List<BaseArea> findProvince();
		 
	// 查询市
	public List<BaseArea> findCity(String province);
		 
	// 查询县区
	public List<BaseArea> findCounty(String city);

}
