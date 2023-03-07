package com.air3.flightInf.DAO;

import java.util.List;

import com.air3.flightInf.VO.FlightInfVO;
import com.webjjang.util.PageObject;

public interface FlightInfDAO {
	public List<FlightInfVO> list(FlightInfVO vo) throws Exception;
	
	public List<FlightInfVO> Flist(PageObject pageObject) throws Exception;
	
	public int write(FlightInfVO vo) throws Exception;
	
	public FlightInfVO view(long no) throws Exception;
	
	public int update(FlightInfVO vo) throws Exception;
	
	public int delete(Long no) throws Exception;
	
	public List<FlightInfVO> craftList() throws Exception;
	public List<FlightInfVO> stationList() throws Exception;
	public long getTotalRow(PageObject pageObject) throws Exception;
}
