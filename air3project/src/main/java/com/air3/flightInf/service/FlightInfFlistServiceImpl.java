package com.air3.flightInf.service;

import com.air3.flightInf.DAO.FlightInfDAO;
import com.air3.flightInf.VO.FlightInfVO;
import com.air3.main.ServiceInterface;
import com.webjjang.util.PageObject;

public class FlightInfFlistServiceImpl implements ServiceInterface {

	private FlightInfDAO dao;

	@Override
	public void setDao(Object obj) {

		this.dao = (FlightInfDAO) obj;

	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		PageObject pageObject = (PageObject) obj;

		// JSP를 위한 페이지 계산을 진행해야 한다. -> 전체 데이터를 가져와서 setTotalRow() 호출
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		return dao.Flist(pageObject);
	}

}
