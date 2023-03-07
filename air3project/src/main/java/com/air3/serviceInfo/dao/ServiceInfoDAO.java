package com.air3.serviceInfo.dao;

import java.util.List;

import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.webjjang.util.PageObject;


public interface ServiceInfoDAO {

	public List<ServiceInfoVO> list(PageObject pageObject) throws Exception;

	public long getTotalRow(PageObject pageObject) throws Exception;
	
	public ServiceInfoVO view(long no) throws Exception;
	
	public int write(ServiceInfoVO vo) throws Exception;

	public int update(ServiceInfoVO vo) throws Exception;
	
	public int updateImage(ServiceInfoVO vo) throws Exception;
	
	public int delete(long no) throws Exception;
	
}
