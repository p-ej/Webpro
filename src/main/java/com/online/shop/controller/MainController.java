package com.online.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 메인 화면
	@RequestMapping(value="/main")
	public String index() {
		logger.info("firstname : ");
		return "main/main";
	}
	
	// 관리자 화면
	@RequestMapping(value="/admin")
	public String adminmain() {
		return "admin/adminpage";
	}
	

}
