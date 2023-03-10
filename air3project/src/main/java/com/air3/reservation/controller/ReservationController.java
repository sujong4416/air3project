package com.air3.reservation.controller;

import java.net.URLEncoder;
import java.util.List;

//import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.air3.flightInf.VO.FlightInfVO;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.mileage.service.MileageUseInsertServiceImpl;
import com.air3.mileage.vo.MileageVO;
import com.air3.reservation.vo.ReservationVO;
import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.webjjang.util.PageObject;

public class ReservationController {
	private ServiceInterface reservationDeleteService;
	private ServiceInterface reservationInfoService;
	private ServiceInterface reservationPayService;
	private ServiceInterface reservationSelectService;
	private ServiceInterface reservationUpdateService;
	private ServiceInterface reservationViewService;
	private ServiceInterface reservationListService;
	private ServiceInterface flightInfListService;
	private ServiceInterface flightStartListService;
	private ServiceInterface reservationFSViewservice;
	private ServiceInterface memberViewService;

	private ServiceInterface mileageUseInsertService;
	private ServiceInterface mileageUpdateService;

	public void setMileageUseInsertService(ServiceInterface mileageUseInsertService) {
		this.mileageUseInsertService = mileageUseInsertService;
	}

	public void setMileageUpdateService(ServiceInterface mileageUpdateService) {
		this.mileageUpdateService = mileageUpdateService;
	}

	public void setFlightInfListService(ServiceInterface flightInfListService) {
		this.flightInfListService = flightInfListService;
	}

	public void setReservationDeleteService(ServiceInterface reservationDeleteService) {
		this.reservationDeleteService = reservationDeleteService;
	}

	public void setReservationInfoWriteService(ServiceInterface reservationInfoService) {
		this.reservationInfoService = reservationInfoService;
	}

	public void setReservationPayService(ServiceInterface reservationPayService) {
		this.reservationPayService = reservationPayService;
	}

	public void setReservationSelectService(ServiceInterface reservationSelectService) {
		this.reservationSelectService = reservationSelectService;
	}

	public void setReservationUpdateService(ServiceInterface reservationUpdateService) {
		this.reservationUpdateService = reservationUpdateService;
	}

	public void setReservationViewService(ServiceInterface reservationViewService) {
		this.reservationViewService = reservationViewService;
	}

	public void setReservationListService(ServiceInterface reservationListService) {
		this.reservationListService = reservationListService;
	}

	public void setFlightStartListService(ServiceInterface flightStartListService) {
		this.flightStartListService = flightStartListService;
	}

	public void setReservationFSViewService(ServiceInterface reservationFSViewservice) {
		this.reservationFSViewservice = reservationFSViewservice;
	}

	public void setMemberViewService(ServiceInterface memberViewService) {
		this.memberViewService = memberViewService;
	}

	@SuppressWarnings("unchecked")
	public String execute(HttpServletRequest request) throws Exception {
		System.out.println("ReservationController.execute().request" + request);
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println("ReservationController.execute().method" + method);
		// ?????????????????? ????????? ??????
		HttpSession session = request.getSession();
		String jsp = null;

		switch (uri) {
		// ???????????? ???????????? ??????.
		case "/reservation/select.do":
			System.out.println("ReservationController.select");
			// ????????? ??????
			FlightInfVO selectVO = new FlightInfVO();

			selectVO.setStartStation(request.getParameter("startStation"));
			selectVO.setStartDate(request.getParameter("startDate"));
			selectVO.setEndStation(request.getParameter("endStation"));

			List<FlightInfVO> list = (List<FlightInfVO>) Execute.run(flightInfListService, selectVO);
			request.setAttribute("list", list);
			jsp = "reservation/select";
			break;

		// ???????????? ???????????? revNo??????...
		case "/reservation/paymentWrite.do": // ?????? ?????? ???
			System.out.println("controller??? paymentWrite");
			LoginVO login = (LoginVO) session.getAttribute("login");
			if (request.getMethod().equals("GET")) {
				System.out.println("1111111111111111111111111");
				// ?????? ????????????
				String flightNoStr = request.getParameter("Flno");
				Integer flno = Integer.parseInt(flightNoStr);
				login = (LoginVO) session.getAttribute("login");
				System.out.println("2222222222222222222222222222222");
				ReservationVO payment = new ReservationVO();
				// ????????? ?????? - ???????????? ????????????
				LoginVO loginVO = (LoginVO) session.getAttribute("login");
				payment.setId(loginVO.getId());
				payment.setName(loginVO.getName());
				payment.setFlightNo(flno);
				//payment.setSeatInf("a1");

				// ?????????
				payment.setPeopleNo(Integer.parseInt(request.getParameter("people")));
				
				//????????? view??? ?????? ??????
				ReservationVO FSWrite1 = (ReservationVO) Execute.run(reservationFSViewservice, flno);
				request.setAttribute("view", FSWrite1);

				jsp = "reservation/paymentWrite";

			} else { // post

				System.out.println("2222222222222222222222222222222");
				ReservationVO paymentWriteVO = new ReservationVO();
                //?????????, 
				paymentWriteVO.setId(((LoginVO) session.getAttribute("login")).getId());
				paymentWriteVO.setFlightNo(Integer.parseInt(request.getParameter("flightNo")));
				paymentWriteVO.setPeopleNo(1);
				//paymentWriteVO.setMealName(request.getParameter("mealName"));
				paymentWriteVO.setMealNo(Integer.parseInt(request.getParameter("mealNo")));
				paymentWriteVO.setSeatInf(request.getParameter("seatInf"));
				paymentWriteVO.setSave(Integer.parseInt(request.getParameter("iUseMil")));
				paymentWriteVO.setTotal(Integer.parseInt(request.getParameter("total")));

				String revNo = (String) Execute.run(reservationPayService, paymentWriteVO);
				
				// ???????????? ??????
				String mileage = request.getParameter("mileage"); // ???????????? ???????????? ????????????
				if(!mileage.equals("") && !mileage.equals("0")) { // ???????????? ??????????????? 0??? ????????????
					MileageVO mVO = new MileageVO();
					// ???????????? ?????? ??????
					mVO.setUmoney(Integer.parseInt(mileage));
					// ????????? ??????
					mVO.setId(((LoginVO)session.getAttribute("login")).getId());
					
					// ???????????? ?????? ??????
					Execute.run(mileageUseInsertService, new Object[] {mVO, 1});
					
					LoginVO updateLoginVO = (LoginVO) session.getAttribute("login");
					// ???????????? ???????????? ???????????? ????????? ??????
					int useM = updateLoginVO.getMileage()-Integer.parseInt(mileage);
					if (useM <=0 ) updateLoginVO.setMileage(0);
					else updateLoginVO.setMileage(useM);
					// ????????? ?????? ??????
					session.setAttribute("login", updateLoginVO);
					
				} // end of if

				jsp = "redirect:/reservation/view.do?revNo=" + revNo;
			}
			break;

		// ?????? ????????? ?????? ???????????? ??????.
		case "/reservation/list.do":
			System.out.println("ReservationController.revList");
			login = (LoginVO) session.getAttribute("login");
			PageObject pageObject = PageObject.getInstance(request);
			if (login != null) {
				ReservationVO listVO = new ReservationVO();
				// session?????? ????????? ????????????...
				listVO.setId(login.getId());
				listVO.setGradeNo(login.getGradeNo());

				request.setAttribute("revList",
						Execute.run(reservationListService, new Object[] { pageObject, listVO }));

				request.setAttribute("pageObject", pageObject);
				jsp = "reservation/list";
			}
			break;

//?????? ??????????????? ???????????? ??????
		case "/reservation/view.do":
			String revNo = request.getParameter("revNo");
			ReservationVO viewVO = (ReservationVO) Execute.run(reservationViewService, revNo);
			request.setAttribute("viewVO", viewVO);
			jsp = "reservation/view";

			break;

		// ??????????????????, ???????????? ????????????
		case "/reservation/update.do":
			if (request.getMethod().equals("GET")) {
				// System.out.println("1111111111111");
				// revNo?????????
				request.setAttribute("updateVO", Execute.run(reservationViewService, request.getParameter("revNo")));
				System.out.println("12122121");
				jsp = "reservation/update";
			} else {
				// ????????? ???????????? ??????
				System.out.println("222222222222222222222222222222");
				ReservationVO updateVO = new ReservationVO();
				revNo = request.getParameter("revNo");
				updateVO.setRevNo(request.getParameter("revNo"));
				updateVO.setName(request.getParameter("Name"));
				updateVO.setStartStation(request.getParameter("StartStaition"));
				updateVO.setEndStation(request.getParameter("endStaition"));
				updateVO.setStartDate(request.getParameter("startDate"));
				updateVO.setMealNo(Integer.parseInt(request.getParameter("mealNo")));
				updateVO.setSeatInf(request.getParameter("seatInf"));
				// DB??????
				Execute.run(reservationUpdateService, updateVO);

				jsp = "redirect:view.do?&revNo=" + revNo + "&page=" + request.getParameter("page") + "&perPageNum="
						+ request.getParameter("perPageNum") + "&key=" + request.getParameter("key") + "&word="
						+ URLEncoder.encode(request.getParameter("word"), "utf-8");

			}
			break;

		// ????????????. ?????? ???????????? ?????????.
		case "/reservation/delete.do":
			// ???????????? ????????????...
			revNo = request.getParameter("revNo");
			String mileage = request.getParameter("mileage");
			ReservationVO deleteVO = new ReservationVO();
			deleteVO.setRevNo(revNo);
			// ???????????? ?????? ??????
		    // ???????????? ???????????? ????????????
		    if(!mileage.equals("") && !mileage.equals("0")) { // ???????????? ?????? 0??? ????????? ??????
			    MileageVO mVO = new MileageVO();
			    // ????????? ????????????
			    mVO.setId(((LoginVO) session.getAttribute("login")).getId());
			    // ???????????? ??????
			    mVO.setRevNo(Integer.parseInt(revNo));
			    // ???????????? ?????? ?????? ??????
			    Execute.run(mileageUpdateService, mVO);
			    
			    LoginVO loginVO = (LoginVO) session.getAttribute("login");
				// ???????????? ???????????? ?????? ????????????????????? ?????? ??? ??????
				int useM = loginVO.getMileage()+Integer.parseInt(mileage);
				loginVO.setMileage(useM);
				// ????????? ?????? ??????
				session.setAttribute("login", loginVO);
			    
		    } // end of if
		    
			// DB??????
			Execute.run(reservationDeleteService, deleteVO);

			// ???????????? ?????? ??????

			jsp = "redirect:list.do?&perPageNum=" + request.getParameter("perPageNum");

			break;

		// ?????? ?????? ???????????? ???????????? ??????.
		case "/reservation/FSlist.do":
			System.out.println("ReservationController.FSlist");
			System.out.println(request.getParameter("startStation"));
			// ????????? ??????
			ReservationVO FSVO = new ReservationVO();

			String startDate = request.getParameter("startDate");
			System.out.println(startDate);

			FSVO.setStartStation(request.getParameter("startStation"));
			System.out.println(request.getParameter("startStation"));
			FSVO.setStartDate(startDate);
			FSVO.setEndStation(request.getParameter("endStation"));

			List<ReservationVO> FSlist = (List<ReservationVO>) Execute.run(flightStartListService, FSVO);
			request.setAttribute("list", FSlist);
			jsp = "reservation/FSlist";
			break;

		// ?????? ?????? ???????????? ?????? ??????.
		case "/reservation/FSView.do":

			System.out.println(request.getParameter("Flno"));
			String flightNoStr = request.getParameter("Flno");
			int flno = Integer.parseInt(flightNoStr);

			ReservationVO FSView = (ReservationVO) Execute.run(reservationFSViewservice, flno);
			request.setAttribute("view", FSView);
			jsp = "reservation/FSView";

			break;

		case "/reservation/infoWrite.do":
			if (request.getMethod().equals("GET")) {
				System.out.println(request.getParameter("Flno"));
				flightNoStr = request.getParameter("Flno");

				flno = Integer.parseInt(flightNoStr);
				// ???????????? ???????????? ????????????
				String id = ((LoginVO) session.getAttribute("login")).getId();
				// ???????????? ?????? ??????
				request.setAttribute("mview", Execute.run(memberViewService, id));

				System.out.println("12122121");
				ReservationVO FSWrite = (ReservationVO) Execute.run(reservationFSViewservice, flno);
				request.setAttribute("view", FSWrite);

				jsp = "reservation/infoWrite";
			} else {
				// ????????? ???????????? ??????
				System.out.println("222222222222222222222222222222");
				ReservationVO infoWrite = new ReservationVO();

				infoWrite.setId(((LoginVO) session.getAttribute("login")).getName());
				infoWrite.setName(request.getParameter("Name"));
				infoWrite.setStartStation(request.getParameter("StartStaition"));
				infoWrite.setEndStation(request.getParameter("endStaition"));
				infoWrite.setStartDate(request.getParameter("startDate"));
				infoWrite.setMealNo(Integer.parseInt(request.getParameter("mealNo")));
				infoWrite.setSeatInf(request.getParameter("seatInf"));
				// DB??????
				Execute.run(reservationUpdateService, infoWrite);

				jsp = "reservation/paymentWrite";

			}
			break;

		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
		}
		return jsp;
	}
}
