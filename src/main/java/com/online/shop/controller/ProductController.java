package com.online.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.online.shop.service.ProductService;
import com.online.shop.vo.CartVO;
import com.online.shop.vo.MemberVO;
import com.online.shop.vo.ProductViewVO;

@Controller
public class ProductController {

	// Service 호출 자리
	@Autowired
	ProductService service;
	/////////////// 사용자 상품 화면

	// 카테고리 클릭 후 상품 목록 
	@RequestMapping(value="/productlist", method=RequestMethod.GET)
	public String productlist(@RequestParam("cate") int cate,
			@RequestParam("lev") int lev, Model model) throws Exception {

		List<ProductViewVO> list = null;
		list = service.list(cate,lev);

		model.addAttribute("list",list);
		return "product/productlist";
	}

	// 상품 상세 정보
	@RequestMapping(value="/productdetail", method=RequestMethod.GET)
	public String productdetail(@RequestParam("num") int num,Model model) throws Exception {
		ProductViewVO view = service.productdetail(num);
		model.addAttribute("productDetail",view);
		return "product/productdetail";
	}

	// 카드 담기
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public @ResponseBody int addCart(CartVO cart, HttpSession session) throws Exception {
		int result = 0;
		 String member = (String)session.getAttribute("mid");
		System.out.println(member);
		if(member != null) {
			
			cart.setS_ID(member);
			service.addCart(cart);
			result = 1;
		}
		return result;
	}
}
