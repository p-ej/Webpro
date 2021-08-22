package com.online.shop.service;

import java.util.List;


import com.online.shop.vo.CartVO;
import com.online.shop.vo.OrderDetailVO;
import com.online.shop.vo.OrderListVO;
import com.online.shop.vo.OrderVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;
import com.online.shop.vo.ReplyListVO;
import com.online.shop.vo.ReplyVO;

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
	
	// 상품 소감 작성
	void registReply(ReplyVO reply) throws Exception;
	
	// 상품 소감 리스트
	List<ReplyListVO> replyList(int num) throws Exception;
	
	// 상품 소감 삭제
	void deleteReply(ReplyVO reply) throws Exception;
	
	// 아이디 체크
	String idCheck(int num) throws Exception;
	
	// 상품 소감 수정
	void modifyReply(ReplyVO reply) throws Exception;
	
	// 주문 정보
	void orderInfo(OrderVO order) throws Exception;
	
	// 주문 상세 정보
	void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	// 카트 비우기
	void cartAllDelete(String id) throws Exception;
	
	// 주문 목록
	List<OrderVO> orderList(OrderVO order) throws Exception;
	
	// 특정 주문 목록
	List<OrderListVO> orderView(OrderVO order) throws Exception;
	

}
