package com.liu.graduation.entities;

import org.springframework.web.multipart.MultipartFile;

public class ProductTest {

	private String summernote ;
	 private MultipartFile[] files;
	private String name;
	public String getSummernote() {
		return summernote;
	}
	public void setSummernote(String summernote) {
		this.summernote = summernote;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
