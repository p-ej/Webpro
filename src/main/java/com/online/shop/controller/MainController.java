package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/main")
	public String index() {
		return "main/main";
	}
	
	@RequestMapping(value="/productlist")
	public String home() {
		return "product/productlist";
	}
	
	@RequestMapping(value="/productdetail")
	public String product() {
		return "product/productdetail";
	}
	
	@RequestMapping(value="/loginView")
	public String loginform() {
		return "member/login";
	}
	
	@RequestMapping(value="/joinView")
	public String joinform() {
		return "member/join";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "redirect:/main";
	}
}
