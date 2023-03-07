package com.air3.reservation.service;

import com.air3.main.ServiceInterface;
import com.air3.reservation.dao.PayReservationDAO;


public class ReservationViewService implements ServiceInterface{

	private PayReservationDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (PayReservationDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
	   		
	    return dao.reservationView((String) obj);
	}

}
