package com.online.shop.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductViewVO {
	private int SP_NUM;
	private String SP_NAME;
	private String SC_CODE;
	private String SP_PRICE;
	private String SP_STOCK;
	private String SP_DES;
	private String SP_IMG;
	
	private String SC_NAME;
	private String SC_CODEREF;
	
	private String SP_THUMBIMG;
}
