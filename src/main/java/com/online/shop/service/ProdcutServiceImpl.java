package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.online.shop.dao.ProductDAO;
import com.online.shop.vo.CartVO;
import com.online.shop.vo.ProductViewVO;

@Service
@Transactional
public class ProdcutServiceImpl implements ProductService {

	@Autowired
	ProductDAO dao;

	// 상품 출력
	@Override
	public List<ProductViewVO> list(int cate, int lev) throws Exception {
		
		int ref = 0;
		
		if(lev == 1) { // 1차
			ref = cate;
			return dao.list1(cate, ref);
		}
		return dao.list2(cate);
	}


	@Override
	public ProductViewVO productdetail(int num) throws Exception {
		return dao.productdetail(num);
	}

	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

}
