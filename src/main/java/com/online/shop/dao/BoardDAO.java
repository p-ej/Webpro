package com.online.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.online.shop.vo.BoardVO;
import com.online.shop.vo.pageVO;

@Repository
@Mapper
public interface BoardDAO {
	
	// 게시글 목록 출력
	List<BoardVO> listpage(pageVO pg) throws Exception;
	
	// 게시글 총 개수
	int listcount() throws Exception;
	
	// 글 등록
	void insert(BoardVO bvo) throws Exception;
	
	// 게시글 조회
	BoardVO detail(int num) throws Exception;
	
	// 조회수 업데이트
	void upHit(int num) throws Exception;

	// 게시글 수정
//	BoardVO update(BoardVO boardVO) throws Exception;
	void update(BoardVO boardVO) throws Exception;	

	// 게시글 삭제
	void delete(int num) throws Exception;
	
	// 글 답변 폼
	BoardVO replydetail(int num) throws Exception;
	
	// 글 답변 등록
	void reply(BoardVO boardVO) throws Exception;
	
	// 답변 등록 시 카운트 증가 
	void replyShape(BoardVO boardVO) throws Exception;

}
