package com.air3.order.service;

import com.air3.main.ServiceInterface;
import com.air3.order.dao.OrderDAO;
import com.webjjang.util.PageObject;

public class OrderListServiceImpl implements ServiceInterface {

	private OrderDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (OrderDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		System.out.println("OrderListServiceImpl.service()----");
		PageObject pageObject = (PageObject) obj;
		//JSP를 위한 페이지 계산을 진행해야 한다.- 전체 데이터를 가져와서 setTotalRow를 호출한다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		return dao.list(pageObject);
	}

	
}
