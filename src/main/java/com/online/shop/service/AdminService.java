package com.online.shop.service;

import java.util.List;

import com.online.shop.vo.CateVO;
import com.online.shop.vo.MemberVO;
import com.online.shop.vo.OrderListVO;
import com.online.shop.vo.OrderVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;
import com.online.shop.vo.ReplyListVO;

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
	
	// 회원 목록 출력
	List<MemberVO> memberlist() throws Exception;
	
	// 회원 삭제
	void memberdelete(String uid) throws Exception;
	
	// 주문 목록
	List<OrderVO> adminorderList() throws Exception;

	// 특정 주문 목록
	List<OrderListVO> adminorderView(OrderVO order) throws Exception;
	
	// 배송 상태
	void delivery(OrderVO order) throws Exception;
	
	// 상품 수량 조절
	void changeStock(ProductVO goods) throws Exception;
	
	// 모든 소감
	List<ReplyListVO> allReply() throws Exception;
	
	// 소감 삭제
	void deleteReply(int reqNum) throws Exception;
}
