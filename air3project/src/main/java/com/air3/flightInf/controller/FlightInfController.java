package com.air3.flightInf.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.flightInf.VO.FlightInfVO;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.webjjang.util.PageObject;






public class FlightInfController {

	private ServiceInterface flightInfListService;
	private ServiceInterface flightInfFlistService;
	private ServiceInterface flightInfWriteService;
	private ServiceInterface flightInfViewService;
	private ServiceInterface flightInfUpdateService;
	private ServiceInterface flightInfDeleteService;
	private ServiceInterface flightInfCraftListService;
	private ServiceInterface flightInfStationListService;

	public void setFlightInfListService(ServiceInterface flightInfListService) {
		this.flightInfListService = flightInfListService;
	}

	public void setFlightInfFlistService(ServiceInterface flightInfFlistService) {
		this.flightInfFlistService = flightInfFlistService;
	}
	public void setflightInfWriteService(ServiceInterface flightInfWriteService) {
		this.flightInfWriteService = flightInfWriteService;
	}
	public void setflightInfViewService(ServiceInterface flightInfViewService) {
		this.flightInfViewService = flightInfViewService;
	}
	public void setflightInfUpdateService(ServiceInterface flightInfUpdateService) {
		this.flightInfUpdateService = flightInfUpdateService;
	}
	public void setflightInfDeleteService(ServiceInterface flightInfDeleteService) {
		this.flightInfDeleteService = flightInfDeleteService;
	}
	public void setflightInfCraftListService(ServiceInterface flightInfCraftListService) {
		this.flightInfCraftListService = flightInfCraftListService;
	}
	public void setflightInfStationListService(ServiceInterface flightInfStationListService) {
		this.flightInfStationListService = flightInfStationListService;
	}

	public String execute(HttpServletRequest request) throws Exception {
		System.out.println("FlightInfController.execute().request : " + request);
		// 어떤 요청
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println("FlightInfController.execute().method : " + method);
		HttpSession session = request.getSession();
		String jsp = null;
		// 처리
		switch (uri) {
		case "/flightInf/list.do":
			//포스트 방식

			// 데이터 수집
			FlightInfVO listVO = new FlightInfVO();
			
			//검색에 필요한 데이터
			listVO.setStartStation(request.getParameter("startStation"));
			listVO.setStartDate(request.getParameter("startDate"));
			listVO.setEndStation(request.getParameter("endStation"));

			// 글등록 처리해 보자.
			List<FlightInfVO> list = (List<FlightInfVO>) Execute.run(flightInfListService, listVO);
			request.setAttribute("list", list);
			jsp = "flightInf/list";

			break;
		
		case "/flightInf/fList.do":
			PageObject pageObject = PageObject.getInstance(request);
			// 글등록 처리해 보자.
			List<FlightInfVO> flist = (List<FlightInfVO>) Execute.run(flightInfFlistService, pageObject);
			request.setAttribute("list", flist);
			request.setAttribute("pageObject", pageObject);
			jsp = "flightInf/fList";

			break;
		case "/flightInf/write.do":
			if(request.getMethod().equals("GET")) {
				List<FlightInfVO> wCraftList = (List<FlightInfVO>) Execute.run(flightInfCraftListService,null );
				System.out.println("wCraftList : " + wCraftList);
				List<FlightInfVO> wStationList = (List<FlightInfVO>) Execute.run(flightInfStationListService,null );
				System.out.println("wStationList : " + wStationList);
				Object[] wObjs = {wCraftList,wStationList}; 
				System.out.println("wObjs"+wObjs);
				request.setAttribute("vo",wObjs);
				jsp = "flightInf/write";
			} else {
				System.out.println("WRITE.DO");
				FlightInfVO writeVO = new FlightInfVO();
				String cNoStr = request.getParameter("cNo");
				Long cNo = Long.parseLong(cNoStr);
				writeVO.setCNo(cNo);
				writeVO.setStartStation(request.getParameter("startStation"));
				writeVO.setEndStation(request.getParameter("endStation"));
				String startDate = request.getParameter("startDate");
				String startTime = request.getParameter("startTime");
				writeVO.setStartDate(startDate+" "+startTime);
				
				
				String endDate = request.getParameter("endDate");
				String endTime = request.getParameter("endTime");
				writeVO.setEndDate(endDate+" "+endTime);
				String priceStr = request.getParameter("price");
				Long price = Long.parseLong(priceStr);
				writeVO.setPrice(price);
				// 글등록 처리해 보자.
				System.out.println(writeVO);
				Execute.run(flightInfWriteService,writeVO);
				jsp = "redirect:fList.do";
			}
			break;
		case "/flightInf/update.do":
			// DB에서 데이터 가져오기
			// 데이터 수집 -> 반드시 리스트 부터 시작하여야 데이터가 넘어온다.
			
			
			if(request.getMethod().equals("GET")) {
				String updateNoStr = request.getParameter("no");
				long updateNo = Long.parseLong(updateNoStr);
				// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
				List<FlightInfVO> craftList = (List<FlightInfVO>) Execute.run(flightInfCraftListService,null );
				List<FlightInfVO> wStationList = (List<FlightInfVO>) Execute.run(flightInfStationListService,null );
				System.out.println("craftList : " + craftList);
				FlightInfVO updateVO = (FlightInfVO) Execute.run(flightInfViewService, updateNo);
				System.out.println("updateVO : " + updateVO);
				Object[] objs = {craftList,updateVO,wStationList}; 
				request.setAttribute("vo",objs);
				jsp = "flightInf/update";
			} else {
				FlightInfVO updateVO = new FlightInfVO();
				// 데이터 수집 vo 넣기
				String flightNoStr = request.getParameter("flightNo");
				System.out.println(flightNoStr);
				Long flightNo = Long.parseLong(flightNoStr);
				updateVO.setFlightNo(flightNo);
				
				String cNoStr = request.getParameter("cNo");
				Long cNo = Long.parseLong(cNoStr);
				updateVO.setcNo(cNo);
				updateVO.setStartStation(request.getParameter("startStation"));
				updateVO.setEndStation(request.getParameter("endStation"));
				updateVO.setStartStation(request.getParameter("startStation"));;
				updateVO.setEndStation(request.getParameter("endStation"));;
				updateVO.setStartDate(request.getParameter("startDate"));
				updateVO.setEndDate(request.getParameter("endDate"));
				String priceStr = request.getParameter("price");
				Long price = Long.parseLong(priceStr);
				updateVO.setPrice(price);
				System.out.println(updateVO);
				
				
				// DB 처리
				Execute.run(flightInfUpdateService, updateVO);
				
				// 글보기로 자동이동 - 글번호와  inc가 필요하다. inc는 무조건 0이다.
				jsp = "redirect:fList.do?no=" + flightNo 
						+ "&page=" + request.getParameter("page")
						+ "&perPageNum=" + request.getParameter("perPageNum")
						+ "&key=" + request.getParameter("key")
						+ "&word=" + URLEncoder.encode(request.getParameter("word"),"utf-8")
						;
				
			}
			break;
		case "/flightInf/delete.do":
			// DB에서 데이터 가져오기
			// 데이터 수집 -> 반드시 리스트 부터 시작하여야 데이터가 넘어온다.
			
			int result = 0;
			String deleteNoStr = request.getParameter("no");
			long deleteNo = Long.parseLong(deleteNoStr);
			
			
			// DB 삭제 처리해 보자.
			result = (int) Execute.run(flightInfDeleteService, deleteNo);
			if(result == 1) jsp = "redirect:fList.do";
			else if(result == 0) {
				jsp = "redirect:fList.do";
			}
			
				
			
			break;
		
		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";

		}// switch
		
		
		
		return jsp;
	}// execute

}// FlightInfController
