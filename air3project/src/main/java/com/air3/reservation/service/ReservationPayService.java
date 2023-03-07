package com.air3.reservation.service;

import java.security.SecureRandom;
import java.util.Date;

import com.air3.main.ServiceInterface;
import com.air3.member.vo.MemberVO;
import com.air3.reservation.dao.PayReservationDAO;
import com.air3.reservation.vo.ReservationVO;

public class ReservationPayService implements ServiceInterface{

	private PayReservationDAO dao;
	
	@Override
	public void setDao(Object obj) {
		
		this.dao = (PayReservationDAO) obj;	
	}
	
	
	@Override
	public Object service(Object obj) throws Exception {
		System.out.println("ReservationPayService.");
		
		// reservation insert
		dao.PaymentWrite((ReservationVO)obj);
		
		// seat insert
		dao.revSeat((ReservationVO) obj);
		
		// rmeal insert
		String revMealNo = ((ReservationVO)obj).getRevMealNo();
		revMealNo = getRandomRevNo(5);
		((ReservationVO)obj).setRevMealNo(revMealNo);
		dao.rMeal((ReservationVO)obj);
		
		return dao.revNoSelect((ReservationVO) obj);
		
	}
	
//	// 랜덤번호 생성
		 private String getRandomRevNo(int size) {
	        char[] charSet = new char[] {
		                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
		                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

		        StringBuffer sb = new StringBuffer();
		        SecureRandom sr = new SecureRandom();
		        sr.setSeed(new Date().getTime());

		        int idx = 0;
		        int len = charSet.length;
		        for (int i=0; i<size; i++) {
		            // idx = (int) (len * Math.random());
		            idx = sr.nextInt(len); 
		            sb.append(charSet[idx]);
		        } // end of for

		        return sb.toString();
		 } // end of getRandomPassword
}
