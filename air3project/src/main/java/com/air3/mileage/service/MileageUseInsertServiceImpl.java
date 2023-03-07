package com.air3.mileage.service;

import java.util.ArrayList;
import java.util.List;

import com.air3.main.ServiceInterface;
import com.air3.mileage.dao.MileageDAO;
import com.air3.mileage.vo.MileageVO;

public class MileageUseInsertServiceImpl implements ServiceInterface{

	private MileageDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MileageDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		Object[] objs = (Object[]) obj;
		obj = objs[0];
		int num = (int) objs[1];
		
		// use 테이블 insert
		dao.use((MileageVO) obj, num);
		System.out.println("============ obj : "+obj);
		// 적립테이블 - 잔액 있는 적립번호 가져오기
		List<MileageVO> list = dao.searchSaveNo((MileageVO) obj);
		System.out.println("============ list : "+list);
		// save 테이블 잔액 update
		dao.balanceUpdate(list, (MileageVO) obj);
		
			
			List<Integer> useList = new ArrayList<>(); ;
			// 사용할 마일리지
			int money = ((MileageVO) obj).getUmoney();
			
			// 기존 잔액
			list.get(0).getBalance();
			
			int i;	
			for(i=0; i<=list.size(); i++) {
				
				money -= (list.get(i).getBalance());
				
				useList.add(money);
				
				if(money <=0) break;
				
			} // end of for
		
			System.out.println("============ useList"+useList);
			System.out.println("============ obj"+obj);
		// member 테이블 마일리지 update
		dao.memberBalanceMinus((MileageVO) obj);
			
		// detail 테이블 insert
		return dao.useDetailInsert(list, useList, (MileageVO) obj);
			
	}

}
