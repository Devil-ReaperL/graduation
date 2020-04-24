package com.liu.graduation.entities;

public class UserBeen {
	
	private String phonenum;
	private String password;
	private String name;
	private String answer;
	private String question;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	@Override
	public String toString() {
		return "UserBeen [phonenum=" + phonenum + ", password=" + password + ", name=" + name + ", answer=" + answer
				+ ", question=" + question + "]";
	}
	
	
			
	
}
