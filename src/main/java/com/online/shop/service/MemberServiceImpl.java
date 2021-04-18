package com.online.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.dao.MemberDAO;
import com.online.shop.vo.MemberVO;
@Service
public class MemberServiceImpl implements MemberService{
@Autowired
MemberDAO memDAO;
	@Override
	public void join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		memDAO.join(vo);
		
		
	}
	@Override
	public MemberVO login(MemberVO mvo) throws Exception {
		return memDAO.login(mvo);
	}
	@Override
	public int idCheck(MemberVO mvo) throws Exception {
		return memDAO.idChk(mvo);
	}
	@Override
	public MemberVO memberInfo(MemberVO mvo) throws Exception {
		return memDAO.memberInfo(mvo);
	}
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		memDAO.memberModify(vo);
		
	}

//	@Override
//	public MemberVO login(MemberVO vo) throws Exception {
//         String name= memDAO.id(vo);
//        
//      if(Integer.parseInt(name)==0) {
//    	 return false;
//      }
//      return true;
//	}

}
