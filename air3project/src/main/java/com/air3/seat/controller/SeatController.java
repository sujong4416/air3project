package com.air3.seat.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.craftInf.VO.CraftInfVO;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.reservation.vo.ReservationVO;



public class SeatController {
	
	
	private ServiceInterface craftInfViewService;
	private ServiceInterface seatListSevice;
	private ServiceInterface reservationFSViewservice;
	
	public void setCraftInfViewService(ServiceInterface craftInfViewService) {
		this.craftInfViewService = craftInfViewService;
	}
	public void setSeatListService(ServiceInterface seatListSevice) {
		this.seatListSevice = seatListSevice;
	}
	
	public void setReservationFSViewService(ServiceInterface reservationFSViewservice) {
		this.reservationFSViewservice = reservationFSViewservice;
	}
//		@SuppressWarnings("unchecked")
	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest request) throws Exception {
		System.out.println("ReservationController.execute().request" + request);
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println("ReservationController.execute().method" + method);
		// 로그인때문에 세션에 저장
		HttpSession session = request.getSession();
		String jsp = null;

		switch (uri) {
		// 항공편을 리스트로 보기.
					
			// 예매 출발 항공편을 상세 보기.
		case "/seat/seat.do":

			
			
			String cnoStr = request.getParameter("cNo");
			long cno = Long.parseLong(cnoStr);
			// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
			CraftInfVO viewVO 
			= (CraftInfVO) Execute.run(craftInfViewService, cno);
			// 내용 줄바꿈 처리
			request.setAttribute("craft", viewVO); // ${vo }로 찾아서 사용한다.
			// ----------------------------------------------------------------
			
			String flightNoStr = request.getParameter("Flno");
			int flno = Integer.parseInt(flightNoStr);
			ReservationVO FSview = (ReservationVO) Execute.run(reservationFSViewservice, flno);
			request.setAttribute("FS", FSview);
			
			
			
			ReservationVO seatVO = new ReservationVO();
			seatVO.setFlightNo(flno);
			List<String> seatlist = (List<String>) Execute.run(seatListSevice, seatVO);
			request.setAttribute("seat", seatlist);
			
//			request.setAttribute("seat", "A2");
			
			jsp = "seat/seat";
						
			break;
			
			
		
			
		
		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
		}
		return jsp;
	}
}

	

	

	
	
	

