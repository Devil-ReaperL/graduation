package com.liu.graduation.entities;

public class UserBeen {
	
	private String phonenum;
	private String password;
	private String name;
	private String address;
	private String questionid;
	
	
	@Override
	public String toString() {
		return "UserBeen [phonenum=" + phonenum + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", questionid=" + questionid + "]";
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuestionid() {
		return questionid;
	}
	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}
	
	
	
	
}
