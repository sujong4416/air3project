package com.air3.order.dao;

import java.util.List;

import com.air3.member.vo.LoginVO;
import com.air3.order.vo.OrderVO;
import com.webjjang.util.PageObject;

public interface OrderDAO {
	public List<OrderVO>list(PageObject pageObject)throws Exception;
	
	public long getTotalRow(PageObject pageObject)throws Exception;
	
	public OrderVO view(long orderNo)throws Exception;
	
	public Integer order(OrderVO vo)throws Exception;
	
	public Integer update(OrderVO vo)throws Exception;
	
	public Integer delete(long no)throws Exception;
	
	public Integer deleteDetail(long no) throws Exception;
	
	public Integer orderDetail(OrderVO vo)throws Exception;
	
	public List<OrderVO> searchRevNo(OrderVO vo) throws Exception;
	
	public long serchOrderNo() throws Exception;
	
	public int searchM(String id) throws Exception;

}
