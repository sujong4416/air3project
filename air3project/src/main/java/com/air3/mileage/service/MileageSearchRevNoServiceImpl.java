package com.air3.mileage.service;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.mileage.dao.MileageDAO;
import com.air3.mileage.vo.MileageVO;

public class MileageSearchRevNoServiceImpl implements ServiceInterface{

	private MileageDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MileageDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileagesearchRevNoServiceImpl.service().........");
		
		return dao.searchRevNo((String) obj);
	}

}
