package com.air3.craftInf.service;

import com.air3.craftInf.DAO.CraftInfDAO;
import com.air3.main.ServiceInterface;



public class CraftInfViewServiceImpl implements ServiceInterface {
	
	private CraftInfDAO dao;
	@Override
	public void setDao(Object obj) {
		
		this.dao = (CraftInfDAO)obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.view((long) obj);
	}

}
