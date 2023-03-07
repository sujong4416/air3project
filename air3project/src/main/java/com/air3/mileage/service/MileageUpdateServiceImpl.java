package com.air3.mileage.service;

import java.util.List;

import com.air3.main.ServiceInterface;
import com.air3.mileage.dao.MileageDAO;
import com.air3.mileage.vo.MileageVO;

public class MileageUpdateServiceImpl implements ServiceInterface{

	private MileageDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MileageDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("========== obj"+obj);
		// 마일리지 사용 정보 가져오기 - 주문번호
		List<MileageVO> useList = dao.selectUseDetail((MileageVO) obj);
		System.out.println("=========== useList"+useList);
		
		for(int i=0; i<useList.size(); i++) {
			int use = useList.get(i).getUmoney();
			((MileageVO)obj).setBalance(((MileageVO)obj).getBalance()+use);
		}
		
		// use detail 삭제 - 주문번호 - use seq
		dao.useDetailDelete((MileageVO) obj);
		
		// use 삭제
		dao.useDelete((MileageVO) obj);
		
		// save update - save, balance
		dao.balanceCancel(useList);
		
		for(int i=0; i<useList.size()-1; i++) {
			((MileageVO)obj).setBalance( ((MileageVO)obj).getBalance() + useList.get(i).getBalance() );
		}
		
		// member update - id, money
		return dao.memberBalance((MileageVO) obj);
		
	}

}
