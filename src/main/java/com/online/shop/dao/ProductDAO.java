package com.online.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.online.shop.vo.CartVO;
import com.online.shop.vo.ProductViewVO;

@Repository
@Mapper
public interface ProductDAO {

	
	// 사용자 상품 출력 1차
	List<ProductViewVO> list1(int cate, int lev) throws Exception;
	
	// 사용자 상품 출력 2차
	List<ProductViewVO> list2(int cate) throws Exception;
	
	// 사용자 상품 조회
	ProductViewVO productdetail(int num) throws Exception;
	
	// 카트 담기
	void addCart(CartVO cart) throws Exception;
	
	// 카트 리스트
	List<CartVO> cartList(String id) throws Exception;
	
	// 카트 삭제
	void deleteCart(CartVO cart) throws Exception;
}
