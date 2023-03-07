package com.air3.reservation.service;

import com.air3.main.ServiceInterface;
import com.air3.reservation.dao.PayReservationDAO;
import com.air3.reservation.vo.ReservationVO;

public class ReservationDeleteService implements ServiceInterface{

	private PayReservationDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (PayReservationDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.reservationDelete((ReservationVO) obj);
	}

}
