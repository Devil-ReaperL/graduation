package com.liu.graduation.dao;

import java.util.List;
import java.util.Map;

import com.liu.graduation.entities.AttrBeen;
import com.liu.graduation.entities.Product;




public interface IGoodDao {

	int insertGood(Product good);

	int updateGood(String number, String picture);

	int deleteGood(String number);

	Product selectGood(String number);

	int updateGood(Product good);

	List<Product> selectAllGood();

	Map<Integer, List<Product>> selectAll();

	List<AttrBeen> selectall();

	List<Product> selectlike(String name);

}
