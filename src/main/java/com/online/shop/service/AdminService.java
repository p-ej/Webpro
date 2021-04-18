package com.online.shop.service;

import java.util.List;

import com.online.shop.vo.CateVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;

public interface AdminService {
	
	// 카테고리
	List<CateVO> category() throws Exception;
	
	// 상품 등록
	void register(ProductVO vo) throws Exception;
	
	// 상품 목록
	List<ProductViewVO> productList() throws Exception;
	
	// 상품 조회 + 카테조인
	ProductViewVO productDetail(int num)throws Exception;
	
	// 상품 삭제
	void productDelete(int num)throws Exception;
	
	// 상품 수정
	void productModify(ProductVO vo) throws Exception;
	
}
