package com.air3.mileage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.mileage.vo.MileageVO;
import com.air3.order.vo.OrderVO;
import com.air3.reservation.vo.ReservationVO;

public class MileageController {

	private ServiceInterface mileageInsertService;
	private ServiceInterface mileageUseInsertService;
	private ServiceInterface mileageUpdateService;
	private ServiceInterface mileageDetailInsertService;
	private ServiceInterface mileageSearchRevNoService;
	private ServiceInterface mileageSearchOrdNoService;
	private ServiceInterface reservationViewService;
	private ServiceInterface orderViewService;
	private ServiceInterface mileageViewService;
	private ServiceInterface mileageViewDetailService;
	private ServiceInterface mileageViewDetailUseService;
	
	public void setMileageInsertService(ServiceInterface mileageInsertService) {
		this.mileageInsertService = mileageInsertService;
	}
	public void setMileageUseInsertService(ServiceInterface mileageUseInsertService) {
		this.mileageUseInsertService = mileageUseInsertService;
	}
	public void setMileageUpdateService(ServiceInterface mileageUpdateService) {
		this.mileageUpdateService = mileageUpdateService;
	}
	public void setMileageDetailInsertService(ServiceInterface mileageDetailInsertService) {
		this.mileageDetailInsertService = mileageDetailInsertService;
	}
	public void setMileageSearchRevNoService(ServiceInterface mileageSearchRevNoService) {
		this.mileageSearchRevNoService = mileageSearchRevNoService;
	}
	public void setReservationViewService(ServiceInterface reservationViewService) {
		this.reservationViewService = reservationViewService;
	}
	public void setOrderViewService(ServiceInterface orderViewService) {
		this.orderViewService = orderViewService;
	}
	public void setMileageSearchOrdNoService(ServiceInterface mileageSearchOrdNoService) {
		this.mileageSearchOrdNoService = mileageSearchOrdNoService;
	}
	public void setMileageViewService(ServiceInterface mileageViewService) {
		this.mileageViewService = mileageViewService;
	}
	public void setMileageViewDetailService(ServiceInterface mileageViewDetailService) {
		this.mileageViewDetailService = mileageViewDetailService;
	}
	public void setMileageViewDetailUseService(ServiceInterface mileageViewDetailUseService) {
		this.mileageViewDetailUseService = mileageViewDetailUseService;
	}
	public String execute(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageController.execute()..................");
		
		int result = 0;
		
		// 이동할 페이지
		String jsp = null;
		
		// 요청 확인
		String uri = request.getRequestURI();
		
		// 세션 저장
		HttpSession session = request.getSession();
		
		switch (uri) {
		case "/mileage/info.do": // 마일리지 적립신청 페이지 ---------------------------------
			
			// 로그인된 아이디,이름 가져오기
			LoginVO vo = new LoginVO();
			String id = ((LoginVO)session.getAttribute("login")).getId();
			vo.setId(id);
			vo.setName(((LoginVO)session.getAttribute("login")).getName());
			vo.setEname(((LoginVO)session.getAttribute("login")).getEname());
			// 아이디 이름 저장
			request.setAttribute("view", vo);
			// 마일리지 적립신청 페이지로 이동
			jsp = "/mileage/info";
			
			break;
		
		case "/mileage/saveReservation.do": // 예매 마일리지 적립 ---------------------------------
			
			MileageVO saveRevVO = new MileageVO();
			
			// 필요정보 - 아이디, 적립금액, 주문번호 혹은 예매번호
			// 아이디
			saveRevVO.setId(((LoginVO)session.getAttribute("login")).getId());
			// 적립금액
			int total = Integer.parseInt(request.getParameter("revTotal"));
			saveRevVO.setSmoney((int) (total*0.01));
			saveRevVO.setBalance((int) (total*0.01));
			// 예매번호
			saveRevVO.setRevNo(Integer.parseInt(request.getParameter("checkRevNo")));
			
			// 마일리지 적립 실행
			result = (int) Execute.run(mileageInsertService, saveRevVO);

			if(result == 1) {
				session.setAttribute("msg", "마일리지 적립이 정상적으로 완료되었습니다.");
				
			} else {
				session.setAttribute("msg", "마일리지 적립에 실패했습니다.");
				
			} // end of if else
			
			LoginVO loginVO = (LoginVO) session.getAttribute("login");
			// 마일리지 적립금액 세션에서 더한후 저장
			int useM = loginVO.getMileage()+((int) (total*0.01));
			loginVO.setMileage(useM);
			// 세션에 다시 저장
			session.setAttribute("login", loginVO);
			
			// 적립신청 페이지로 이동
			jsp = "redirect:/mileage/info.do";
			
			break;
		
			
		case "/mileage/searchRevNo.do": // 예매번호 검색 - 팝업창 ---------------------------------
			
			if(request.getMethod().equals("GET")) { // 예매번호 검색 폼
				
				// 아이디로 예매번호 가져오기
				id = ((LoginVO)session.getAttribute("login")).getId();
				// 예매번호 가져오기 실행
				request.setAttribute("list", Execute.run(mileageSearchRevNoService, id));
				// 예매번호 검색 페이지 이동
				jsp = "/mileage/searchRevNo";
				
			} else { // 예매번호로 예매내용 검색
				
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				// 예매번호
				String revNo = request.getParameter("revNo");
				// 예매번호로 예매 정보 가져오기
				ReservationVO viewVO = (ReservationVO) Execute.run(reservationViewService, revNo);
				
				// 예매번호 저장
				request.setAttribute("list", Execute.run(mileageSearchRevNoService, id));
				// 예매 정보 저장
				request.setAttribute("vo", viewVO);
				
				// 예매번호 검색 페이지 이동
				jsp = "/mileage/searchRevNo";
				
			} // end of if else
			
			break;
			
		case "/mileage/saveOrder.do": // 주문 마일리지 적립 ---------------------------------
			
			MileageVO saveOrdVO = new MileageVO();
			
			// 필요정보 - 아이디, 적립금액, 주문번호 혹은 예매번호
			// 아이디
			saveOrdVO.setId(((LoginVO)session.getAttribute("login")).getId());
			// 총 주문 금액 -> 적립금액
			total = Integer.parseInt(request.getParameter("ordTotal"));
			saveOrdVO.setSmoney((int) (total*0.01));
			saveOrdVO.setBalance((int) (total*0.01));
			// 주문번호
			saveOrdVO.setOrderNo(Integer.parseInt(request.getParameter("checkOrdNo")));
			
			// 주문 마일리지 적립 실행
			result = (int) Execute.run(mileageInsertService, saveOrdVO);
			
			if(result == 1) {
				session.setAttribute("msg", "마일리지 적립이 정상적으로 완료되었습니다.");
				
			} else {
				session.setAttribute("msg", "마일리지 적립에 실패했습니다.");
				
			} // end of if else
			
			
			loginVO = (LoginVO) session.getAttribute("login");
			// 마일리지 적립금액 세션에서 더한후 저장
			useM = loginVO.getMileage()+((int) (total*0.01));
			loginVO.setMileage(useM);
			// 세션에 다시 저장
			session.setAttribute("login", loginVO);
			
			
			// 마일리지 적립신청 페이지로 이동
			jsp = "redirect:/mileage/info.do";
			
			break;
			
		case "/mileage/searchOrdNo.do": // 주문번호 검색 - 팝업창 ---------------------------------
			
			if(request.getMethod().equals("GET")) { // 주문번호 검색 폼
				
				// 아이디로 주문번호 가져오기
				id = ((LoginVO)session.getAttribute("login")).getId();
				// 아이디로 주문번호 가져와서 저장
				request.setAttribute("list", Execute.run(mileageSearchOrdNoService, id));
				// 주문번호 검색 폼으로 이동
				jsp = "/mileage/searchOrdNo";
				
			} else { // 주문번호 검색
				
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				// 주문번호
				String ordNo = request.getParameter("ordNo");
				// 주문번호로 주문정보 가져오기
				OrderVO viewVO 
				= (OrderVO) Execute.run(orderViewService, Long.parseLong(ordNo));
				
				// 주문번호 저장
				request.setAttribute("list", Execute.run(mileageSearchOrdNoService, id));
				// 주문정보 저장
				request.setAttribute("vo", viewVO);
				
				// 주문번호 검색 폼으로 이동
				jsp = "/mileage/searchOrdNo";
				
			} // end of if else
			
			break;
			
		case "/mileage/view.do": // 마일리지 현황 ---------------------------------
			
			// 아이디로 적립, 잔여, 사용 마일리지 가져오기
			// 아이디
			id = ((LoginVO)session.getAttribute("login")).getId();

			// 실행, 저장
			request.setAttribute("view", Execute.run(mileageViewService, id));
			
			// 마일리지 현황 페이지로 이동
			jsp = "/mileage/view";
			
			break;
			
		case "/mileage/viewDetail.do": // 마일리지 상세조회 ---------------------------------
			
			if(request.getMethod().equals("GET")) { 
				
				// 마일리지 적립 조회 - 아이디, 조회기간, 조회유형
				MileageVO viewVO = new MileageVO();
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				viewVO.setId(id);
				
				viewVO.setCheckPeriod(1);
				
				viewVO.setCheckType(1);
				
				request.setAttribute("save", Execute.run(mileageViewDetailService, viewVO));
				
			} else {
				
				// 마일리지 적립 조회 - 아이디, 조회기간, 조회유형
				MileageVO viewVO = new MileageVO();
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				viewVO.setId(id);
				
				// 조회기간 - 1:1개월, 6:6개월, 12:12개월
				String period = request.getParameter("radios1");
				if(!period.equals("99")) { // 조회기간 선택
					viewVO.setCheckPeriod(Integer.parseInt(period));
				} else if(request.getParameter("startDate") == null) { // 기본 조회기간 1개월
					viewVO.setCheckPeriod(1);
				} else { // 조회기간 직접 입력				
					viewVO.setStartDate(request.getParameter("startDate"));
					viewVO.setEndDate(request.getParameter("endDate"));
					viewVO.setCheckPeriod(99);
				} // end of if else
				
				// 조회유형 - 1:전체, 2:이젠항공, 3:쇼핑몰
				String type = request.getParameter("radios2");
				if(type != null)
					viewVO.setCheckType(Integer.parseInt(type));
				else // 기본 조회유형 전체
					viewVO.setCheckType(1);
				
				request.setAttribute("save", Execute.run(mileageViewDetailService, viewVO));
				request.setAttribute("saveCheck", viewVO);
				
			}
			
			jsp = "/mileage/viewDetail";
			break;
		
			
		case "/mileage/viewDetailUse.do": // 마일리지 상세조회 ---------------------------------
			
			if(request.getMethod().equals("GET")) { 
				
				// 마일리지 적립 조회 - 아이디, 조회기간, 조회유형
				MileageVO viewVO = new MileageVO();
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				viewVO.setId(id);
				
				viewVO.setCheckPeriod(1);
				
				viewVO.setCheckType(1);
				
				request.setAttribute("use", Execute.run(mileageViewDetailUseService, viewVO));
				
			} else {
				
				// 마일리지 적립 조회 - 아이디, 조회기간, 조회유형
				MileageVO viewVO = new MileageVO();
				// 아이디
				id = ((LoginVO)session.getAttribute("login")).getId();
				viewVO.setId(id);
				
				// 조회기간 - 1:1개월, 6:6개월, 12:12개월
				String period = request.getParameter("radios1");
				if(!period.equals("99")) { // 조회기간 선택
					viewVO.setCheckPeriod(Integer.parseInt(period));
				} else if(request.getParameter("startDate") == null) { // 기본 조회기간 1개월
					viewVO.setCheckPeriod(1);
				} else { // 조회기간 직접 입력				
					viewVO.setStartDate(request.getParameter("startDate"));
					viewVO.setEndDate(request.getParameter("endDate"));
					viewVO.setCheckPeriod(99);
				} // end of if else
				
				// 조회유형 - 1:전체, 2:이젠항공, 3:쇼핑몰
				String type = request.getParameter("radios2");
				if(type != null)
					viewVO.setCheckType(Integer.parseInt(type));
				else // 기본 조회유형 전체
					viewVO.setCheckType(1);
				
				request.setAttribute("use", Execute.run(mileageViewDetailUseService, viewVO));
				request.setAttribute("useCheck", viewVO);
				
			}
			
			jsp = "/mileage/viewDetailUse";
			break;
			
		default:
			jsp = "redirect:/error/404.do";
			request.getSession().setAttribute("uri", uri);
		} // end of switch
		
		return jsp;
	} // end of execute()
	
} // end of mileageController class
