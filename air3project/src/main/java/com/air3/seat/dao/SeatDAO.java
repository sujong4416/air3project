package com.air3.seat.dao;

import java.util.List;

import com.air3.reservation.vo.ReservationVO;

public interface SeatDAO {
	
	public List<String> Seatlist(ReservationVO vo) throws Exception;
	
}
