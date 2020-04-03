package com.liu.graduation.entities;

import java.util.Date;

public class Cart {

    private String phonenum;
    private String product_id;
    private String product_name;
    private int num;
    private String stock;
    private float price;
    private float Unit;
    private String picture;
    private String status;
    private Date addtime;
	private Date endtime;
    
    
	public float getUnit() {
		return Unit;
	}


	public void setUnit(float unit) {
		Unit = unit;
	}


	public String getPhonenum() {
		return phonenum;
	}


	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}


	public String getProduct_id() {
		return product_id;
	}


	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getStock() {
		return stock;
	}


	public void setStock(String stock) {
		this.stock = stock;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public Date getAddtime() {
		return addtime;
	}


	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}


	public Date getEndtime() {
		return endtime;
	}


	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}


	@Override
	public String toString() {
		return "Cart [phonenum=" + phonenum + ", product_id=" + product_id + ", product_name=" + product_name + ", num="
				+ num + ", stock=" + stock + ", price=" + price + ", Unit=" + Unit + ", picture=" + picture
				+ ", status=" + status + ", addtime=" + addtime + ", endtime=" + endtime + "]";
	}
	

	
   
	
	
}
