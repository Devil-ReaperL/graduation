package com.liu.graduation.entities;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Order_product {
	
	private String order_id;
	private String user;
	private String product_id;
	private String product_name;
	private String product_src;
	private int num;
	private float price;
	private String remark;
	private Date addtime;
	
	
	
	@Override
	public String toString() {
		return "Order_product [order_id=" + order_id + ", user=" + user + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_src=" + product_src + ", num=" + num + ", price="
				+ price + ", remark=" + remark + ", addtime=" + addtime + "]";
	}
	public String getAddtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(addtime!=null)
		return sdf.format(addtime);
		else
			return null;
	}
	public void setAddtime(Date addtime)  {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(addtime!=null) {
				this.addtime=sdf.parse(sdf.format(addtime));				
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_src() {
		return product_src;
	}
	public void setProduct_src(String product_src) {
		this.product_src = product_src;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPrice() {
		DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		return decimalFormat.format(price);
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}
