package com.liu.graduation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liu.graduation.dao.AreaDao;
import com.liu.graduation.entities.support.BaseArea;
import com.liu.graduation.service.AreaService;

@Service("areaService")
public class AreaServiceimpl implements AreaService{
	@Resource
	private AreaDao areaDao;
	
	@Override
	public List<BaseArea> findProvince() {
		// TODO Auto-generated method stub
		return areaDao.findProvince();
	}

	@Override
	public List<BaseArea> findCity(String province) {
		// TODO Auto-generated method stub
		return areaDao.findCity(province);
	}

	@Override
	public List<BaseArea> findCounty(String city) {
		// TODO Auto-generated method stub
		return areaDao.findCounty(city);
	}

}
