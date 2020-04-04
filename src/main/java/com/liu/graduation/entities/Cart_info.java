package com.liu.graduation.entities;

import java.text.DecimalFormat;

public class Cart_info {
	private String phonenum;
    private int num;
    private int checked;
    private float sum;
    
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSum() {
		DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		return decimalFormat.format(sum);
	}
	public void setSum(float sum) {
		this.sum = sum;
	}

}
