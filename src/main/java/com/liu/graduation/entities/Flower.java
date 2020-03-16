package com.liu.graduation.entities;

public class Flower {
	private String flowerid;
	private String name;
	private String price;
	private String picture;
	private int stock;
	private int attri;
	
	public Flower(String flowerid, String name, String price, String picture, int stock, int attri) {
		super();
		this.flowerid = flowerid;
		this.name = name;
		this.price = price;
		this.picture = picture;
		this.stock = stock;
		this.attri = attri;
	}

	
	public String getflowerid() {
		return flowerid;
	}

	
	public void setflowerid(String flowerid) {
		this.flowerid = flowerid;
	}

	public int getAttri() {
		return attri;
	}
	
	public void setAttri(int attri) {
		this.attri = attri;
	}
	
	public int getStock() {
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	

	public Flower() {
		super();
	}
	/**
	 * @return the number
	 */
	
	/**
	 * @param number the number to set
	 */
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	 * @return the picture
	 */
	public String getPicture() {
		return picture;
	}
	/**
	 * @param picture the picture to set
	 */
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
