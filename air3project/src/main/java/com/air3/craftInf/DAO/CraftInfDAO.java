package com.air3.craftInf.DAO;

import java.util.List;

import com.air3.craftInf.VO.CraftInfVO;


public interface CraftInfDAO {
	public List<CraftInfVO> voingList() throws Exception;
	
	public List<CraftInfVO> airbusList() throws Exception;
	
	public CraftInfVO view(long no) throws Exception;
	
	public int write(CraftInfVO vo) throws Exception;
	
	public int delete(long no) throws Exception;
	
	public int update(CraftInfVO vo) throws Exception;
	
	public int updateImage(CraftInfVO vo) throws Exception;
	
	public int updateImage2(CraftInfVO vo) throws Exception;
}
