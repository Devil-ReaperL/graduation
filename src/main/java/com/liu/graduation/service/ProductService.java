package com.liu.graduation.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.entities.AttrBeen;
import com.liu.graduation.entities.Product;


public interface ProductService {
	public boolean addproduct(Product product);
	public List<AttrBeen> findAttrList();
	public String findProductList(Product product,Model model,int currpage);
	public int deleteProduct(Product product);
	public Product findProductByid(String id);
	public int deleteImg(String id,String src);
	public int updateProduct(Product product);
	public Map<String,Object> findProductList(String find,int currpage);
	public void home(Model model);
	public void productinfo(String id,Model model) ;
	
}
