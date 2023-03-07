package com.air3.seat.service;

import com.air3.main.ServiceInterface;
import com.air3.reservation.vo.ReservationVO;
import com.air3.seat.dao.SeatDAO;

public class SeatListServiceImpl implements ServiceInterface{
private SeatDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (SeatDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
	System.out.println("ReservationListService");
		return dao.Seatlist((ReservationVO)obj);
	}

}

	

