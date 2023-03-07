package com.air3.reservation.dao;

import java.util.List;

import com.air3.flightInf.VO.FlightInfVO;
import com.air3.member.vo.MemberVO;
import com.air3.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

public interface ReservationDAO {

	// 기내식 바꾸기
	public Integer reservationRegistration(ReservationVO vo) throws Exception;

	// 항공기 예매 출발 비행편 리스트
	public List<ReservationVO> FSlist(ReservationVO vo) throws Exception;
	
	// 항공기 예매 출발 비행편 상세보기 
	public ReservationVO view(Integer flno) throws Exception;
}
