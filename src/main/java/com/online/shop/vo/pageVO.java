package com.online.shop.vo;

public class pageVO {

	int startrow;
	int endrow;
	String search_option;
	String keyword;
	
	public pageVO() {
		this.startrow = 0;
		this.endrow = 0;
		this.search_option = "";
		this.keyword="";
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
