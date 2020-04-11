package com.liu.graduation.entities;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Order {
	
	private String id;
	private String phonenum;
	private int total;
	private String payment;
	private String message;
	private String logistics;
	private String address_id;
	private String status;
	private float count_price;
	private Date addtime;
	private Date endtime;
	
	private String simple_addtime;
	private String simple_endtime;
	
	private List<Order_product> pList;
	private Address address;
	private Order_logistics order_logistics;
	
	
	
	public String getSimple_addtime() {
		return simple_addtime;
	}
	public void setSimple_addtime(String simple_addtime) {
		this.simple_addtime = simple_addtime;
	}
	public String getSimple_endtime() {
		return simple_endtime;
	}
	public void setSimple_endtime(String simple_endtime) {
		this.simple_endtime = simple_endtime;
	}
	public List<Order_product> getpList() {
		return pList;
	}
	public void setpList(List<Order_product> pList) {
		this.pList = pList;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Order_logistics getOrder_logistics() {
		return order_logistics;
	}
	public void setOrder_logistics(Order_logistics order_logistics) {
		this.order_logistics = order_logistics;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
				this.simple_addtime=s.format(addtime);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getEndtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(endtime!=null)
		return sdf.format(endtime);
		else
			return null;

	}
	public void setEndtime(Date endtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(endtime!=null) {
				this.endtime=sdf.parse(sdf.format(endtime));
				this.simple_endtime=s.format(endtime);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getLogistics() {
		return logistics;
	}
	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		
			this.status = status;

	}
	public String getCount_price() {
		DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		String p=decimalFormat.format(count_price);//format 返回的是字符串
		return p;
	}
	public void setCount_price(float count_price) {
		this.count_price = count_price;
	}
	@Override
	public String toString() {
		System.out.println("***"+pList.size());
		for (Order_product order_product : pList) {
			System.out.println(order_product);
		}
		return "Order [id=" + id + ", phonenum=" + phonenum + ", total=" + total + ", payment=" + payment + ", message="
				+ message + ", logistics=" + logistics + ", address_id=" + address_id + ", status=" + status
				+ ", count_price=" + count_price + ", addtime=" + addtime + ", endtime=" + endtime + ", pList=" + pList
				+ ", address=" + address + ", order_logistics=" + order_logistics + "]";
	}
	
	
	

}
