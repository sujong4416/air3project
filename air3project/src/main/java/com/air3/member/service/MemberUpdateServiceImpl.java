package com.air3.member.service;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.member.vo.MemberVO;

public class MemberUpdateServiceImpl implements ServiceInterface{

	private MemberDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MemberDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberUpdateSeviceImpl.service()......");
		
		return dao.update((MemberVO) obj);
	}

}
