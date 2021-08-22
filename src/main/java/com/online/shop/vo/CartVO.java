package com.online.shop.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CartVO {
	private int S_CNUM;
	private String S_ID;
	private int SP_NUM;
	private int SP_STOCK;
	private Date addDate;
	
	private int num;
	private String SP_NAME;
	private int SP_PRICE;
	private String SP_THUMBIMG;
}
