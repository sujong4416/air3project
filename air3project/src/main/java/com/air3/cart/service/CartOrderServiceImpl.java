package com.air3.cart.service;

import com.air3.cart.dao.cartDAO;
import com.air3.cart.vo.CartVO;
import com.air3.main.ServiceInterface;

import com.air3.order.vo.OrderVO;

public class CartOrderServiceImpl implements ServiceInterface {

	private cartDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (cartDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		

		// ordertable에 insert
		dao.order((CartVO) obj);
		dao.orderDetail((CartVO) obj);
		
		// order detail에 insert
		return dao.cartDelete((CartVO) obj);
		
	}

	
}
