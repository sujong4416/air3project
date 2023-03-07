package com.air3.craftInf.service;

import com.air3.craftInf.DAO.CraftInfDAO;
import com.air3.craftInf.VO.CraftInfVO;
import com.air3.flightInf.VO.FlightInfVO;
import com.air3.main.ServiceInterface;



public class CraftInfWriteServiceImpl implements ServiceInterface {
	
	private CraftInfDAO dao;
	@Override
	public void setDao(Object obj) {
		
		this.dao = (CraftInfDAO)obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.write((CraftInfVO) obj);
	}

}
