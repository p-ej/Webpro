package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.online.shop.dao.AdminDAO;
import com.online.shop.vo.CateVO;
import com.online.shop.vo.MemberVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;


@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO dao;
	
	
	@Override
	public List<CateVO> category() throws Exception {
		return dao.category();
	}

	@Override
	public void register(ProductVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public List<ProductViewVO> productList() throws Exception {
		return dao.productList();
	}

	@Override
	public ProductViewVO productDetail(int num) throws Exception {
		return dao.productDetail(num);
	}

	@Override
	public void productDelete(int num) throws Exception {
		dao.productDelete(num);
	}

	@Override
	public void productModify(ProductVO vo) throws Exception {
		dao.productModify(vo);
	}
	
	@Override
	public List<MemberVO> memberlist() throws Exception {
		return dao.memberlist();
	}

	@Override
	public void memberdelete(String uid) throws Exception {
		dao.memberdelete(uid);
	}
	
	
	
	
}
