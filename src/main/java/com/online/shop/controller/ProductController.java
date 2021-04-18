package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

	// Service 호출 자리
	
	/////////////// 사용자 상품 화면
	
	// 카테고리 클릭 후 상품 목록 
	@RequestMapping(value="/productlist", method=RequestMethod.GET)
	public String productlist(@RequestParam("cate") String cate) {
		
		return "product/productlist";
	}
	
	// 상품 상세 정보
	@RequestMapping(value="/productdetail")
	public String productdetail() {
		return "product/productdetail";
	}
}
