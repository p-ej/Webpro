package com.online.shop.dao;

import org.apache.ibatis.annotations.Mapper;

import com.online.shop.vo.MemberVO;

@Mapper
public interface MemberDAO {
	public void join(MemberVO membervo) throws Exception;

	// 로그인 체크
	MemberVO login(MemberVO mvo) throws Exception;

	//	public String id(MemberVO membervo)throws Exception;
    int idChk(MemberVO mvo)throws Exception;
    
    MemberVO memberInfo(MemberVO mvo)throws Exception;
    public void memberModify(MemberVO mvo) throws Exception;
    

}
