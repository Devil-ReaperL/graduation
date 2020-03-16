package com.liu.graduation.entities;

public class Remark {
	private String remark_id;
	private String  phonenum;
	private String rank;
	private String time;
	private String text;
	private String remark_src;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getRemark_src() {
        return remark_src;
    }

    public void setRemark_src(String remark_src) {
        this.remark_src = remark_src;
    }



}
