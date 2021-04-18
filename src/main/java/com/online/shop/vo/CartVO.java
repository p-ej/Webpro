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
	private int S_CSTOCK;
	private Date addDate;
}
