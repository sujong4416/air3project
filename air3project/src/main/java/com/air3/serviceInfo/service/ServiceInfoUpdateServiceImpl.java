package com.air3.serviceInfo.service;

import com.air3.serviceInfo.dao.ServiceInfoDAO;
import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.air3.main.ServiceInterface;

public class ServiceInfoUpdateServiceImpl implements ServiceInterface{

	// dao 선언
	private ServiceInfoDAO dao;
	// setter
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (ServiceInfoDAO)obj;
	}
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println
		("ServiceInfoUpdateServiceImpl.sevice().vo : " + obj);
		return dao.update((ServiceInfoVO) obj);
	}
	



}
