package com.air3.member.service;

import java.security.SecureRandom;
import java.util.Date;

import com.air3.main.ServiceInterface;
import com.air3.member.dao.MemberDAO;
import com.air3.member.vo.MemberVO;

public class MemberFindPwServiceImpl implements ServiceInterface{

	private MemberDAO dao;
	
	@Override
	public void setDao(Object obj) {
		// TODO Auto-generated method stub
		this.dao = (MemberDAO) obj;
		
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberFindPwServiceImpl.service()..............");
		
		// 입력한정보로 기존 비밀번호 가져오기
		String pw = dao.findPw((MemberVO) obj);
		String chgPw = null;
		// 기존 비밀번호를 가져왔으면 임시비밀번호 변경 처리
		if(pw !=null) {
			// 8자리 임시 비밀번호 발급 (대문자,소문자,숫자 포함)
			chgPw = getRandomPassword(8);
			// 비밀번호 변경
			((MemberVO)obj).setPw(chgPw);
			dao.changePw((MemberVO) obj);
		} // end of if
		
		return chgPw;
	} // end of service

	// 랜덤 비밀번호 생성
	 private String getRandomPassword(int size) {
	        char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };

	        StringBuffer sb = new StringBuffer();
	        SecureRandom sr = new SecureRandom();
	        sr.setSeed(new Date().getTime());

	        int idx = 0;
	        int len = charSet.length;
	        for (int i=0; i<size; i++) {
	            // idx = (int) (len * Math.random());
	            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
	            sb.append(charSet[idx]);
	        } // end of for

	        return sb.toString();
	 } // end of getRandomPassword
	
} // end of MemberFindPwServiceImpl class
