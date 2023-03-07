package com.air3.cart.service;

import com.air3.cart.dao.cartDAO;
import com.air3.cart.vo.CartVO;
import com.air3.main.ServiceInterface;

public class CartList2ServiceImpl implements ServiceInterface {
	
	private cartDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (cartDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
//		String id = (String) obj;
//		CartVO cartVO = new CartVO();
		String objs = (String) obj;
		Long a = Long.parseLong(objs);
		return dao.list2( a);
	}


}
