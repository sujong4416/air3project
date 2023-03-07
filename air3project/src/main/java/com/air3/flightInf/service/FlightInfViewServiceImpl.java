package com.air3.flightInf.service;

import com.air3.flightInf.DAO.FlightInfDAO;
import com.air3.flightInf.VO.FlightInfVO;
import com.air3.main.ServiceInterface;



public class FlightInfViewServiceImpl implements ServiceInterface {
	
	private FlightInfDAO dao;
	@Override
	public void setDao(Object obj) {
		
		this.dao = (FlightInfDAO)obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.view((long) obj);
	}

}
