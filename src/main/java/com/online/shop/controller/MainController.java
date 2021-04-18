package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// 메인 화면
	@RequestMapping(value="/main")
	public String index() {
		return "main/main";
	}
	
	// 관리자 화면
	@RequestMapping(value="/admin")
	public String adminmain() {
		return "admin/adminpage";
	}
	

}
