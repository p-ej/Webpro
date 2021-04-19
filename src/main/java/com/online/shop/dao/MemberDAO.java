package com.online.shop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.online.shop.vo.MemberVO;
@Repository
@Mapper
public interface MemberDAO {
	public void join(MemberVO membervo) throws Exception;

	// 로그인 체크
	MemberVO login(MemberVO mvo) throws Exception;

    int idChk(MemberVO mvo)throws Exception;
    
    // 회원 정보
    MemberVO memberInfo(String id)throws Exception;
    
    // 사용자 회원수정
    public void memberModify(MemberVO mvo) throws Exception;
    
}
