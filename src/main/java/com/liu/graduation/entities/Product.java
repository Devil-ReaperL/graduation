package com.liu.graduation.entities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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
	private Date addtime;
	private Date endtime;
	private List<String> srcs;
	
	
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", stock=" + stock + ", summernote="
				+ summernote + ", attr=" + attr + ", files=" + Arrays.toString(files) + ", src=" + src + ", addtime="
				+ addtime + ", endtime=" + endtime + "]";
	}
	public Product()  {
		super();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			if(addtime==null)
			this.addtime=sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			System.out.println(2);
			e.printStackTrace();
		}
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
		try {
			if(addtime!=null) {
				this.addtime=sdf.parse(sdf.format(addtime));
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
		this.endtime = endtime;
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
		this.stock = ""+Integer.parseInt(""+stock);
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
	public List<String> getSrcs() {
		return srcs;
	}
	public void setSrcs(String srcs) {
		this.srcs = new ArrayList<String>();
		String[] s=srcs.split(";");
		for (String object : s) {
			this.srcs .add(object);
		}
	}
	
}
