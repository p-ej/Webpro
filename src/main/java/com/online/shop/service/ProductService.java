package com.online.shop.service;

import java.util.List;

import com.online.shop.vo.CartVO;
import com.online.shop.vo.ProductViewVO;

public interface ProductService {

	
	// 사용자 상품 출력 1차
	List<ProductViewVO> list(int cate, int lev) throws Exception;
	
	// 사용자 상품 조회
	ProductViewVO productdetail(int num) throws Exception;

	// 카트 담기
	void addCart(CartVO cart) throws Exception;
	
	// 카트 리스트
	List<CartVO> cartList(String id) throws Exception;
	
	// 카트 삭제
	void deleteCart(CartVO cart) throws Exception;
}
