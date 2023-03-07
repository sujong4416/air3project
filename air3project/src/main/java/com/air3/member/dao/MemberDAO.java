package com.air3.member.dao;

import java.util.List;

import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberDAO {
	
	// 로그인
	public LoginVO login(LoginVO inVO) throws Exception;

	// 회원리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception;
	
	// 리스트 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// 회원등급변경
	public int updateGrade(MemberVO inVO) throws Exception;
	
	// 회원정보보기
	public MemberVO view(String id) throws Exception;
	
	// 아이디 찾기
	public MemberVO findId(MemberVO inVO) throws Exception;
	
	// 비밀번호 찾기
	public String findPw(MemberVO inVO) throws Exception;
	
	// 임시비밀번호로 변경
	public int changePw(MemberVO inVO) throws Exception;
	
	// 회원가입
	public int signUp(MemberVO inVO) throws Exception;
	
	// 아이디 검색
	public int searchId(String id) throws Exception;
	
	// 회원정보변경
	public int update(MemberVO inVO) throws Exception;
	
	// 비밀번호변경
	public int updatePw(MemberVO inVO, String chgPw) throws Exception;
	
	// 회원탈퇴
	public int delete(LoginVO inVO) throws Exception;

	// 회원정보 변경 (관리자)
	public int updateMember(MemberVO inVO) throws Exception;

	
}
