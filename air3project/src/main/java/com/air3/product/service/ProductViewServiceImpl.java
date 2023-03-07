package com.air3.product.service;

import com.air3.main.ServiceInterface;
import com.air3.product.dao.ProductDAO;

public class ProductViewServiceImpl implements ServiceInterface{

	private ProductDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (ProductDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		System.out.println("ProductViewServiceImpl.service()"+obj);
		return dao.view((Long)obj);
	}

	
}
