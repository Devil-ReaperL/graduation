package com.liu.graduation.entities;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class Product {
    private String id;
    private String name;
    private String price;
    private String stock;
    private String summernote ;
    private String attr ;
	private MultipartFile[] files;
	private String src;
	
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", stock=" + stock + ", summernote="
				+ summernote + ", attr=" + attr + ", files=" + Arrays.toString(files) + ", src=" + src + "]";
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
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
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public void setSrc(String src,String s) {
		this.src = this.src+src+s;
	}
}
