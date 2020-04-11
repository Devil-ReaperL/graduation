package com.liu.graduation.entities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Order_logistics {
	
	private String order_id;
	private String product_id;
	private String courier_id;
	private String address_id;
	private Date delivery_time;
	private String segment;
	private Date Receive_time;
	
	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}
	public static SimpleDateFormat getSimpleDateFormat() {
		return simpleDateFormat;
	}
	public static void setSimpleDateFormat(SimpleDateFormat simpleDateFormat) {
		Order_logistics.simpleDateFormat = simpleDateFormat;
	}
	public void setDelivery_time(Date delivery_time) {
		this.delivery_time = delivery_time;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getCourier_id() {
		return courier_id;
	}
	public void setCourier_id(String courier_id) {
		this.courier_id = courier_id;
	}
	public String getDelivery_time() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(delivery_time!=null)
		return sdf.format(delivery_time);
		else
			return null;
	}
	public void setDelivery_time(String delivery_time) {
		try {
			this.delivery_time = simpleDateFormat.parse(delivery_time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getSegment() {
		return segment;
	}
	public void setSegment(String segment) {
		this.segment = segment;
	}
	public Date getReceive_time() {
		return Receive_time;
	}
	public void setReceive_time(Date receive_time) {
		Receive_time = receive_time;
	}
	@Override
	public String toString() {
		return "Order_logistics [order_id=" + order_id + ", product_id=" + product_id + ", courier_id=" + courier_id
				+ ", address_id=" + address_id + ", delivery_time=" + delivery_time + ", segment=" + segment
				+ ", Receive_time=" + Receive_time + "]";
	}
	
	

}
