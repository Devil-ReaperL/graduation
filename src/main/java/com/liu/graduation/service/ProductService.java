package com.liu.graduation.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


public interface ProductService {
	public boolean addproduct(MultipartFile[] files);

}
