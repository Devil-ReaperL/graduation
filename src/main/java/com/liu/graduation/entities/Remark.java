package com.liu.graduation.entities;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Remark {
	private String remark_id;
	private String  phonenum;
	private String product_id;
	private String rank;
	private Date time;
	private String text;
	private String remark_src;
	private String address;
	private List<String> srcs;
	
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getRemark_id() {
		return remark_id;
	}
	public void setRemark_id(String remark_id) {
		this.remark_id = remark_id;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(time!=null)
		return sdf.format(time);
		else
			return null;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getRemark_src() {
		return remark_src;
	}
	public void setRemark_src(String src,String s) {
		this.remark_src = this.remark_src+src+s;
	}
	public void setRemark_src(String remark_src) {
		this.remark_src = remark_src;
		this.srcs = new ArrayList<String>();
		String[] s=remark_src.split(";");
		for (String object : s) {
			
			if (object != null && object != "") {
				this.srcs.add(object);
			}
			
		}
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public List<String> getSrcs() {
		return srcs;
	}
	public void setSrcs(List<String> srcs) {
		this.srcs = srcs;
	}
	
	
	



}
