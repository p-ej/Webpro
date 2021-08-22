package com.online.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.online.shop.service.ProductService;
import com.online.shop.vo.CartVO;
import com.online.shop.vo.MemberVO;
import com.online.shop.vo.OrderDetailVO;
import com.online.shop.vo.OrderListVO;
import com.online.shop.vo.OrderVO;
import com.online.shop.vo.ProductViewVO;
import com.online.shop.vo.ReplyListVO;
import com.online.shop.vo.ReplyVO;

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
	public ModelAndView productdetail(@RequestParam("num") int num,Model model) throws Exception {
		ProductViewVO view = service.productdetail(num);
		
//		model.addAttribute("productDetail",view);
		
//		List<ReplyListVO> reply = service.replyList(num);
//		model.addAttribute("reply",reply);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productDetail",view);
//		mav.addObject("reply",reply);
		mav.setViewName("product/productdetail");
//		System.out.println(reply.get(0).getS_NAME());
		return mav;
//		"product/productdetail";
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

	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) throws Exception {

		String userId = (String)session.getAttribute("mid");
		if(userId == null) {
			userId = "a";
		}
		List<CartVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);

		return "product/cartList";
	} 

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
			@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {

		String member = (String)session.getAttribute("mid");

		int result = 0;
		int cartNum = 0;


		if(member != null) {
			cart.setS_ID(member);

			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
				cart.setS_CNUM(cartNum);
				service.deleteCart(cart);
			}   
			result = 1;
		}  
		return result;  
	}
	
	// 상품 소감 작성
//	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
//	public String registReply(ReplyVO reply, HttpSession session) throws Exception{
//		
//		String userId = (String) session.getAttribute("mid");
//		reply.setS_ID(userId);
//		System.out.println(reply.getS_repCon());
//		service.registReply(reply);
//		
//		return "redirect:/productdetail?num="+reply.getSP_NUM();
//	}
	
	// 상품 소감 작성
	@ResponseBody
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception{
		
		String userId = (String) session.getAttribute("mid");
		reply.setS_ID(userId);
		
		service.registReply(reply);
		
	}
	
	// 상품 소감 목록
	@RequestMapping(value = "/replyList", method=RequestMethod.GET)
	public @ResponseBody List<ReplyListVO> getReplyList(@RequestParam("num") int num) throws Exception{
		
		System.out.println(num);
		List<ReplyListVO> reply = service.replyList(num);
		System.out.println("data size : "+reply.size());
		return reply;
	}
	
	// 상품 소감 삭제
	@RequestMapping(value = "/deleteReply", method=RequestMethod.POST)
	public @ResponseBody int getDelete(@ModelAttribute ReplyVO reply, HttpSession session) throws Exception {
		int result = 0;
		
		String sessionId = (String) session.getAttribute("mid");
		String userId = service.idCheck(reply.getS_reqNum());

		if(sessionId.equals(userId)) {
			reply.setS_ID(sessionId);
			service.deleteReply(reply);
			
			result = 1;
		}
		
		System.out.println(result);
		return result;
	}
	
	// 상품 소감 수정
	@RequestMapping(value = "/modifyReply", method=RequestMethod.POST)
	public @ResponseBody int modifyReply(@ModelAttribute ReplyVO reply, HttpSession session) throws Exception {
		int result = 0;
		String sessionId = (String)session.getAttribute("mid");
		String userId = service.idCheck(reply.getS_reqNum());
		
		if(sessionId.equals(userId)) {
			reply.setS_ID(sessionId);
			service.modifyReply(reply);
			result = 1;
		}
		
		return result;
	}
	
	// 주문
	@RequestMapping(value = "/orderWrite", method=RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception{
		
		String sessionId = (String) session.getAttribute("mid");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum="";
		
		for (int i=1;i<=6;i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		System.out.println(orderId);
		order.setOrderId(orderId);
		order.setS_ID(sessionId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		service.cartAllDelete(sessionId);
		return "redirect:/cartList";
	}
	
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
	 
	 String sessionId = (String)session.getAttribute("mid");
	 
	 if(sessionId == null) {
		 return "member/login";
	 }
	 order.setS_ID(sessionId);
	 List<OrderVO> orderList = service.orderList(order);
	 
	 model.addAttribute("orderList", orderList);
	 
	 return "product/orderList";
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public String getOrderDetailList(HttpSession session,
	      @RequestParam("num") String orderId,
	      OrderVO order, Model model) throws Exception {
	 
	 String sessionId = (String) session.getAttribute("mid");
	 
	 order.setS_ID(sessionId);
	 order.setOrderId(orderId);
	 
	 List<OrderListVO> orderView = service.orderView(order);
	 
	 model.addAttribute("orderView", orderView);
	 
	 return "product/orderView";
	}
}
