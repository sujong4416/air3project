package com.air3.product.service;

import com.air3.main.ServiceInterface;
import com.air3.product.dao.ProductDAO;

public class ProductDeleteServiceImpl implements ServiceInterface {

	private ProductDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (ProductDAO) obj;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete((long)obj);
	}

	
}
