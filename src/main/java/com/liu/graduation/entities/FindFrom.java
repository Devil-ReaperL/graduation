package com.liu.graduation.entities;

public class FindFrom {
	private String key;
	private String attr;
	private int page=1;
	private String sort;
	private String order;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "FindFrom [key=" + key + ", attr=" + attr + ", page=" + page + ", sort=" + sort + ", order=" + order
				+ "]";
	}
	
	

}
