package com.online.shop.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderListVO {
	private String orderId;
	private String S_ID;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	private String delivery;

	private int orderDetailNum;
	private int SP_NUM;
	private int SP_STOCK;

	private String SP_NAME;
	private String SP_THUMBIMG;
	private String SP_PRICE;
}
