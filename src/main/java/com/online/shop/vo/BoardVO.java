package com.online.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class BoardVO {
 
	// Table SBOARD
	private int SB_NUM;
	private String SB_NAME;
	private String SB_TITLE;
	private String SB_CONTENT;
	private String SB_DATE;
	private int SB_HIT;
	private int SB_GROUP;
	private int SB_STEP;
	private int SB_INDENT;
	
	public BoardVO(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		this.SB_DATE = dateFormat.format(Calendar.getInstance().getTime());
		this.SB_HIT = 0;
	}
}
