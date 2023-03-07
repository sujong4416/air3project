package com.air3.product.dao;

import java.util.List;

import com.air3.product.vo.ProductVO;
import com.webjjang.util.PageObject;

public interface ProductDAO {
	public List<ProductVO>list(PageObject pageObject)throws Exception;
	//pageObject 검색을 위해서 넘기는 
	public long getTotalRow(PageObject pageObject)throws Exception;
	public ProductVO view(long productNo)throws Exception;
	public Integer write(ProductVO vo)throws Exception;
	public Integer updateImage(ProductVO vo) throws Exception;
	public Integer update(ProductVO vo)throws Exception;
	public Integer delete(long productno)throws Exception;

}
