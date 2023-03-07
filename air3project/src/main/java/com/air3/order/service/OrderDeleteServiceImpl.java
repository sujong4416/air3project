package com.air3.order.service;

import com.air3.main.ServiceInterface;
import com.air3.order.dao.OrderDAO;

public class OrderDeleteServiceImpl implements ServiceInterface{
	
	private OrderDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (OrderDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteDetail((long) obj);
		return dao.delete((Long)obj);
	}


}
