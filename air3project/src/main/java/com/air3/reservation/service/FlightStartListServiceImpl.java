package com.air3.reservation.service;


import com.air3.main.ServiceInterface;
import com.air3.reservation.dao.ReservationDAO;
import com.air3.reservation.vo.ReservationVO;



public class FlightStartListServiceImpl implements ServiceInterface{
private ReservationDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (ReservationDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
	System.out.println("ReservationListService");
		return dao.FSlist((ReservationVO)obj);
	}

}
