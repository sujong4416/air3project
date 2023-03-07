package com.air3.order.service;

import com.air3.main.ServiceInterface;
import com.air3.order.dao.OrderDAO;
import com.air3.order.vo.OrderVO;

public class OrderSearchRevServiceImpl implements ServiceInterface{
	//dao 선언 
	private OrderDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (OrderDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		System.out.println("OrdersearchRevNoServiceImpl.service");
		return dao.searchRevNo((OrderVO) obj);
	}


}
