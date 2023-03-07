package com.air3.cart.dao;

import java.util.List;

import com.air3.cart.vo.CartVO;
import com.air3.order.vo.OrderVO;
import com.webjjang.util.PageObject;

public interface cartDAO {
	public Integer addcart(CartVO vo)throws Exception;
	public List<CartVO>list(String id)throws Exception;
	public Integer update(CartVO vo)throws Exception;
	public Integer delete(long cartNo)throws Exception;
	public CartVO list2(Long no) throws Exception;
	public Integer order(CartVO vo) throws Exception;
	public Integer orderDetail(CartVO vo) throws Exception;
	public long serchOrderNo() throws Exception;
	public List<CartVO> searchRevNo(String str) throws Exception;
	public Integer cartDelete(CartVO vo) throws Exception;
}
