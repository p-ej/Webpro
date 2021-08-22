package com.online.shop.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.online.shop.service.BoardService;
import com.online.shop.vo.BoardVO;
import com.online.shop.vo.pageVO;

@SpringBootApplication
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	
	// 게시글 출력
	@RequestMapping(value = "/boardlist")
	public String list(HttpServletRequest request,
			@RequestParam(defaultValue="SB_NAME") String search_option,
			@RequestParam(defaultValue="") String keyword,
			Model model) throws Exception {
		List<?> boardlist=new ArrayList<>();
		
		pageVO pg = new pageVO();
		int page = 1; // 페이징 최소 
		int limit=10; // 페이징 최대		
		
		
		if(request.getParameter("page") != null){ // 1.2.3.4.5 문자열 url ?page=2 2 '2'
			page=Integer.parseInt(request.getParameter("page")); // '2' -> 2
		}
		
		pg.setStartrow((page-1)*10+1); //읽기 시작할 row 번호.
		pg.setEndrow(pg.getStartrow()+limit-1); //읽을 마지막 row 번호.
		pg.setKeyword(keyword);
		pg.setSearch_option(search_option);
		int listcount= service.listcount(); // DAO와 디비 접속 총 리스트 수를 받아옴.
		boardlist = service.listpage(pg); // DAO와 디비 접속 리스트를 받아옴.

		//총 페이지 수.
		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage>startpage+10-1) {endpage=startpage+10-1;}
		
		model.addAttribute("nowpage", page);		  //현재 페이지 수.
		model.addAttribute("maxpage", maxpage); //최대 페이지 수.
		model.addAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수.
		model.addAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수.
		model.addAttribute("listcount",listcount); //글 수.
		model.addAttribute("list", boardlist); // 글 출력 
		
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		return "board/boardlist";
	}
	
	// 글쓰기 폼 
	@RequestMapping(value="/boardwriteView")
	public String boardwirteview(){
		return "board/boardwrite";
	}
	
	// 글 등록
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardwrite(BoardVO vo) throws Exception {
		service.insert(vo);
		return "redirect:/boardlist";
	}
	
	// 게시글 상세조회
	@RequestMapping(value = "/boarddetail", method=RequestMethod.GET)
	public String detail(HttpServletRequest request,Model model) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		service.upHit(num); // 조회수 업데이트
		model.addAttribute("board",service.detail(num));
		
		return "board/boarddetail";
	}
	
	// 글 수정 화면
	@RequestMapping(value = "/boardupdateView")
	public String updateView(HttpServletRequest request,Model model) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("board",service.detail(num));
		return "board/boardupdate";
	}

	// 글 수정
	@RequestMapping(value = "/boardupdate")
	public String update(BoardVO boardVO, Model model) throws Exception {
		service.update(boardVO);
//		model.addAttribute("board",service.update(boardVO)); // 수정은 반환타입이 없음.
		return "redirect:/boarddetail?num="+boardVO.getSB_NUM();
	}

	// 글 삭제
	@RequestMapping(value = "/boarddelete")
	public String delete(@RequestParam("num") int num) throws Exception {
		service.delete(num);
		return "redirect:/boardlist";
	}
	
	// 글 답변 폼
	@RequestMapping(value = "/boardreply")
	public String replyview(@RequestParam("num") int num, Model model) throws Exception {
		model.addAttribute("reply",service.replydetail(num));
		return "board/boardreply";
	}
	
	// 글 답변 등록
	@RequestMapping(value = "/reply")
	public String reply(BoardVO boardVO, Model model) throws Exception {
		service.replyShape(boardVO);
		service.reply(boardVO);
		return "redirect:/boardlist";
	}
}
