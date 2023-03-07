package com.air3.member.service;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.member.vo.LoginVO;

public class MemberDeleteServiceImpl implements ServiceInterface{

	private MemberDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MemberDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDeleteServiceImpl.service()..........");
		return dao.delete((LoginVO) obj);
	}

}
