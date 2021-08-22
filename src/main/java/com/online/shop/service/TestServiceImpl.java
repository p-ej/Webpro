package com.online.shop.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TestServiceImpl implements TestService {

	@Override
	public String TestPrint() throws Exception {
		return "'test'";
	}
 
}
