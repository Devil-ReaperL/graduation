package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.liu.graduation.entities.Product;

@Repository
public interface ProductDao{
	public int insertProduct(Product product);
	public Product selectProductById(@Param("id") String id);
	public List<Product> queryProductByPage(RowBounds rowBounds);
	public int countProductByInfo(Product product);
	public int deleteProduct(Product product);
	public int deleteImg(@Param("id") String id,@Param("src") String src);
	public int updateProduct(Product product);
	public List<Product> queryProductBykey(@Param("key")String key,RowBounds rowBounds);
	public int countProductBykey(@Param("key")String key);
}
