package com.air3.mileage.service;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.mileage.dao.MileageDAO;

public class MileageViewServiceImpl implements ServiceInterface{

	private MileageDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MileageDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.mileageView((String) obj);
	}

}
