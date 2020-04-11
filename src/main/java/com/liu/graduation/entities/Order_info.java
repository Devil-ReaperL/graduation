package com.liu.graduation.entities;

public class Order_info {
	
	private String user;
	private String phonenum;
	private String arrive;
	private String segment;
	private String province;
	private String city;
	private String county;
	private String details;
	private String message;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public String getSegment() {
		return segment;
	}
	public void setSegment(String segment) {
		this.segment = segment;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Order_info [user=" + user + ", phonenum=" + phonenum + ", arrive=" + arrive + ", segment=" + segment
				+ ", province=" + province + ", city=" + city + ", county=" + county + ", details=" + details
				+ ", message=" + message + "]";
	}
	
	
}
