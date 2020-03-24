package com.liu.graduation.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.entities.AttrBeen;
import com.liu.graduation.entities.Product;


public interface ProductService {
	public boolean addproduct(Product product);
	public List<AttrBeen> findAttrList();
	public String findProductList(Product product,Model model,int currpage);
	public int deleteProduct(Product product);
	public Product updateProduct(String id);
}
