package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	////////////// 관리자 컨트롤러
	
	@RequestMapping(value = "/productadd")
	public String productaddView() {
		return "admin/productadd";
	}
}
