package com.air3.order.service;

import com.air3.main.ServiceInterface;
import com.air3.order.dao.OrderDAO;
import com.air3.order.vo.OrderVO;

public class OrderOrderServiceImpl implements ServiceInterface {

	private OrderDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (OrderDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		
		OrderVO vo = (OrderVO)obj;
		
		dao.order((OrderVO)obj);
		vo.setOrderNo(dao.serchOrderNo());
		System.out.println("vo = " + vo );
		return dao.orderDetail((OrderVO)obj);
	}

	
}
