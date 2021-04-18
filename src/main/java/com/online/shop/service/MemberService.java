package com.online.shop.service;

import com.online.shop.vo.MemberVO;

public interface MemberService {
	
	public void join(MemberVO vo) throws Exception;
//	public MemberVO login(MemberVO vo)throws Exception;
	
	// 로그인 체크
	MemberVO login(MemberVO mvo) throws Exception;
    int idCheck(MemberVO mvo)throws Exception;
    MemberVO memberInfo(MemberVO mvo) throws Exception;
    public void memberModify(MemberVO vo)throws Exception;
}
