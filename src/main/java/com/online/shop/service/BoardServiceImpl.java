package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.online.shop.dao.BoardDAO;
import com.online.shop.vo.BoardVO;
import com.online.shop.vo.pageVO;


@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;

	// 게시글 출력
	@Override
	public List<BoardVO> listpage(pageVO pg) throws Exception {
		return dao.listpage(pg);
	}

	// 게시글 갯수
	@Override
	public int listcount() throws Exception {
		return dao.listcount();
	}

	// 게시글 등록
	@Override
	public void insert(BoardVO bvo) throws Exception {
		dao.insert(bvo);
		
	}

	// 게시글 조회
	@Override
	public BoardVO detail(int num) throws Exception {
		return dao.detail(num);
	}

	// 조회수 증가
	@Override
	public void upHit(int num) throws Exception {
		dao.upHit(num);
	}

	// 게시글 수정
//	@Override
//	public BoardVO update(BoardVO boardVO) throws Exception {
//		return dao.update(boardVO);
//	}
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}

	// 게시글 삭제
	@Override
	public void delete(int num) throws Exception {
		dao.delete(num);
	}

	@Override
	public BoardVO replydetail(int num) throws Exception {
		return dao.replydetail(num);
	}

	@Override
	public void reply(BoardVO boardVO) throws Exception {
		dao.reply(boardVO);
	}

	@Override
	public void replyShape(BoardVO boardVO) throws Exception {
		dao.replyShape(boardVO);
	}


	
}
