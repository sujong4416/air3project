package com.air3.reservation.service;


import com.air3.main.ServiceInterface;
import com.air3.reservation.dao.ReservationDAO;

public class ReservationFSViewServiceImpl implements ServiceInterface{

	// dao 선언
	private ReservationDAO dao;
	// setter
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (ReservationDAO)obj;
	}
	
	@Override
	
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ReservationViewServiceImpl.service()");
	
		
	
		return dao.view((Integer)obj);
	}


}
