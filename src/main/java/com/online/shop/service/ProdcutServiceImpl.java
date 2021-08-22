package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.online.shop.dao.ProductDAO;
import com.online.shop.vo.CartVO;
import com.online.shop.vo.OrderDetailVO;
import com.online.shop.vo.OrderListVO;
import com.online.shop.vo.OrderVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;
import com.online.shop.vo.ReplyListVO;
import com.online.shop.vo.ReplyVO;

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

	// 상품 상세정보
	@Override
	public ProductViewVO productdetail(int num) throws Exception {
		return dao.productdetail(num);
	}

	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	// 장바구니 목록
	@Override
	public List<CartVO> cartList(String id) throws Exception {
		return dao.cartList(id);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	// 상품 소감
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	// 상품 소감 목록
	@Override
	public List<ReplyListVO> replyList(int num) throws Exception {
		return dao.replyList(num);
	}

	// 소감 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
		
	}

	// 본인 체크 여부
	@Override
	public String idCheck(int num) throws Exception {
		return dao.idCheck(num);
	}

	// 상품 소감 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String id) throws Exception {
		dao.cartAllDelete(id);
	}

	// 특정 유저 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	// 특정 유저 주문 상세 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}


}
