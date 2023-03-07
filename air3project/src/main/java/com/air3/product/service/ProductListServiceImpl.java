package com.air3.product.service;
import com.air3.main.ServiceInterface;
import com.air3.product.vo.ProductVO;
import com.webjjang.util.PageObject;
import com.air3.product.dao.ProductDAO;

public class ProductListServiceImpl implements ServiceInterface {
	//DAO 선언 
		private ProductDAO dao;
	@Override
	public void setDao(Object obj) {
		this.dao=(ProductDAO)obj;
	}
	@Override
	public Object service(Object obj) throws Exception {
		
		PageObject pageObject = (PageObject) obj;
		//JSP를 위한 페이지 계산을 진행해야 한다.- 전체 데이터를 가져와서 setTotalRow를 호출한다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		return dao.list(pageObject);
		
	}
}
