package com.online.shop.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

public class ReplyListVO {
	
	private int SP_NUM;
	private String S_ID;
	private int S_reqNum;
	private String S_repCon;
	private Date S_repDate;
	private String S_NAME;
	
	public int getSP_NUM() {
		return SP_NUM;
	}
	public void setSP_NUM(int sP_NUM) {
		SP_NUM = sP_NUM;
	}
	public String getS_ID() {
		return S_ID;
	}
	public void setS_ID(String s_ID) {
		S_ID = s_ID;
	}
	public int getS_reqNum() {
		return S_reqNum;
	}
	public void setS_reqNum(int s_reqNum) {
		S_reqNum = s_reqNum;
	}
	public String getS_repCon() {
		return S_repCon;
	}
	public void setS_repCon(String s_repCon) {
		S_repCon = s_repCon;
	}
	public Date getS_repDate() {
		return S_repDate;
	}
	public void setS_repDate(Date s_repDate) {
		S_repDate = s_repDate;
	}
	public String getS_NAME() {
		return S_NAME;
	}
	public void setS_NAME(String s_NAME) {
		S_NAME = s_NAME;
	}
	
	
	
}
