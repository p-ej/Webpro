package com.online.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.online.shop.service.TestService;

@Controller
public class TestController {
	
	private final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	
	private final TestService service;

	public TestController(TestService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/test")
	public void test1() throws Exception {
		logger.info("'print : '"+service.TestPrint());
	}
	
}
