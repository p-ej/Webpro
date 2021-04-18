package com.online.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.online.shop.service.MemberService;
import com.online.shop.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService Service;
	
	////////////// 로그인, 회원가입 부분
	// 로그인 화면
	@RequestMapping(value="/loginView")
	public String loginform() {
		return "member/login";
	}
	
	// 로그인 체크 (ajax)
	@RequestMapping(value="/loginpro", method=RequestMethod.POST)
	public @ResponseBody String loginpro(@RequestParam("mid") String mid,@RequestParam("mpw") String mpw, HttpServletRequest request, MemberVO vo) throws Exception {
		// ajax 데이터 받는 부분
		MemberVO mem = new MemberVO();
		mem.setS_id(mid); // 데이터 저장 ㅇㅋ?
		mem.setS_pw(mpw);
		
		MemberVO result = Service.login(mem); //이거 반환타입을  다시 VO로 바꿔야ㅕ함
		System.out.println(result);
		
//		if(Service.login(vo)==false) {
//			return "false";
//		}
		if(result != null){
			if(mem.getS_pw().equals(result.getS_pw())) {
				HttpSession session = request.getSession();
				session.setAttribute("mid", mem.getS_id());
				return "true";
			}
		}
		return "false";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
	}
	
	// 회원가입 폼
	@RequestMapping(value="/joinView")
	public String joinform() {
		return "member/join";
	}
	
	// 회원가입 완료
	@RequestMapping("/join")
	public String join(MemberVO vo) throws Exception{
		Service.join(vo);
		return "redirect:/loginView";
	}
		
	// 회원 정보 출력
	@RequestMapping("/memberInfo")
	public String memberInfo(MemberVO mem,Model model) throws Exception {
		model.addAttribute("member",Service.memberInfo(mem));
		return "member/memberInfo";
	}
	
	// 회원 수정
	@RequestMapping("/memberModify")
	public String memberModify(MemberVO mem) throws Exception{
		Service.memberModify(mem);
		return "redirect:/main";
	}
	
	// 아이디 중복체크 (수정요망)
//	@RequestMapping("/idCheck")
//	public @ResponseBody String idCheck(@RequestParam("mid") String mid,HttpServletRequest req,MemberVO vo) throws Exception{
//		MemberVO mem= new MemberVO();
//		mem.setS_id(mid);
//		int result= Service.idCheck(mem);
//		if(result == 1) {
//			return "false";
//			
//		}
//		return "true";
//	}
}