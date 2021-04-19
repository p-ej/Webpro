package com.online.shop.service;

import com.online.shop.vo.MemberVO;

public interface MemberService {
	
	public void join(MemberVO vo) throws Exception;
	
	// 로그인 체크
	MemberVO login(MemberVO mvo) throws Exception;
	
	// 중복확인
    int idCheck(MemberVO mvo)throws Exception;
    
    // 회원정보
    MemberVO memberInfo(String id) throws Exception;
    
    // 회원수정
    public void memberModify(MemberVO vo)throws Exception;

    
}
