package com.air3.reservation.service;

import com.air3.main.ServiceInterface;
import com.air3.reservation.dao.PayReservationDAO;
import com.air3.reservation.vo.ReservationVO;
//import com.air3.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;


public class ReservationListService implements ServiceInterface{
private PayReservationDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (PayReservationDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
	System.out.println("ReservationListService");
	
	Object[] objs = (Object[]) obj;
	
	
	PageObject pageObject = (PageObject)objs[0];
	ReservationVO listVO = (ReservationVO) objs[1];
	
	//JSP를 위한 페이지 계산을 진행해야 한다. -> 전제 데이터를 가져와서 setTotalRow() 호풀
	pageObject.setTotalRow(dao.getTotalRow(pageObject));
	
	System.out.println("ReservationListService.service().pageObject - " + pageObject);
	System.out.println("ReservationListService.service().listVO - " + listVO);
	
	return dao.revList(pageObject, listVO);
	}

}
