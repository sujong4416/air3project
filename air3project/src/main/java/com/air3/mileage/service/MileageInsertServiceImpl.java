package com.air3.mileage.service;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.mileage.dao.MileageDAO;
import com.air3.mileage.vo.MileageVO;

public class MileageInsertServiceImpl implements ServiceInterface{

	private MileageDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MileageDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageInsertServiceImpl.service().........");
		
		// 멤버테이블 잔액 update
		dao.memberBalance((MileageVO) obj);
		
		// save 테이블 insert
		return dao.save((MileageVO) obj);
	}

}
