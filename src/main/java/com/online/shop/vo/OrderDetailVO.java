package com.online.shop.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailVO {
	private int orderDetailNum;
	private String orderId;
	private int SP_NUM;
	private int SP_STOCK;
}
