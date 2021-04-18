package com.online.shop.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.online.shop.dao.MemberDAO;
import com.online.shop.vo.MemberVO;

@Service
@Transactional
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
	public MemberVO memberInfo(String id) throws Exception {
		return memDAO.memberInfo(id);
	}
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		memDAO.memberModify(vo);

	}

	@Override
	public int idCheck(MemberVO mvo) throws Exception {
		int result=memDAO.idChk(mvo);
		if(result==1) {
			return 1;
		}
		return 0;
	}

}
