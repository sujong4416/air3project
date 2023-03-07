package com.air3.reservation.dao;

import java.util.List;

import com.air3.flightInf.VO.FlightInfVO;
import com.air3.member.vo.MemberVO;
import com.air3.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

public interface PayReservationDAO {
	// 비행기 조건 리스트
	public List<FlightInfVO> list(FlightInfVO vo) throws Exception;

	// 결제정보 받기
	public Integer PaymentWrite(ReservationVO vo) throws Exception;
	//기내식 예약
	public int rMeal(ReservationVO vo) throws Exception;
	
	// id 조건으로 검색된 리스트
	public List<ReservationVO> revList(PageObject pageObject, ReservationVO listVO) throws Exception;

	public long getTotalRow(PageObject pageObject) throws Exception;
	// id 조건으로 조이는 뷰
	public ReservationVO reservationView(String viewVO) throws Exception;

	// 기내식 바꾸기
	public Integer reservationUpdate(ReservationVO vo) throws Exception;

	// 회원 예약삭제
	public Integer reservationDelete(ReservationVO vo) throws Exception;

	// 좌석 예약
	public int revSeat(ReservationVO vo) throws Exception;

	// revno 가져오기
	public String revNoSelect(ReservationVO vo) throws Exception;
}
