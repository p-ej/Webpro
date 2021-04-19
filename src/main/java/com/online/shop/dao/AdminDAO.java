package com.online.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.online.shop.vo.CateVO;
import com.online.shop.vo.MemberVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;

@Repository
@Mapper
public interface AdminDAO {
	
	// 카테고리
	List<CateVO> category() throws Exception;
	
	// 상품 등록
	void register(ProductVO vo) throws Exception;

	// 상품 목록
	List<ProductViewVO> productList() throws Exception;
	
	// 상품 조회 + 카테조인
	ProductViewVO productDetail(int num)throws Exception;
	
	// 상품 삭제
	void productDelete(int num) throws Exception;

	// 상품 수정
	void productModify(ProductVO vo) throws Exception;
	
	// 회원 목록 출력
	List<MemberVO> memberlist() throws Exception;
	
	// 회원 삭제
	void memberdelete(String uid) throws Exception;
	
}
