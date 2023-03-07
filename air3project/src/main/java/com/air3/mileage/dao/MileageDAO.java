package com.air3.mileage.dao;

import java.util.List;

import com.air3.mileage.vo.MileageVO;

public interface MileageDAO {
	
	// 마일리지 적립 - save에 insert
	public int save(MileageVO vo) throws Exception;
	
	// 마일리지 사용 - use에 insert
	public int use(MileageVO vo, int num) throws Exception;
	
	// 마일리지 사용 - save에 update
	public int balanceUpdate(List<MileageVO> list,MileageVO vo) throws Exception;
	
	// 마일리지 사용 - usedetail에 insert
	public int useDetailInsert(List<MileageVO> list, List<Integer> useList, MileageVO vo) throws Exception;
	
	// 마일리지 사용취소 - use_seq 찾기
//	public List<MileageVO> findUseSeq(MileageVO vo) throws Exception;

	// 마일리지 사용취소 - usedetail에 delete
	public int useDetailDelete(MileageVO vo) throws Exception;
	
	// 마일리지 사용취소 - save에 update
	public int balanceCancel(List<MileageVO> list) throws Exception;
	
	// 마일리지 사용취소 - use에 delete
	public int useDelete(MileageVO vo) throws Exception;

	// 예약번호 가져오기
	public List<MileageVO> searchRevNo(String id) throws Exception;
	
	// 주문번호 가져오기
	public List<MileageVO> searchOrdNo(String id) throws Exception;

	// 잔여, 적립, 사용 마일리지 가져오기
	public MileageVO mileageView(String id) throws Exception;

	// 적립 마일리지 상세조회
	public List<MileageVO> saveView(MileageVO inVO) throws Exception;

	// 잔액이 있는 적립번호 가져오기
	public List<MileageVO> searchSaveNo(MileageVO vo) throws Exception;

	// 멤버 테이블에 잔액 업데이트
	public int memberBalance(MileageVO vo) throws Exception;

	// 멤버 테이블 잔액 마이너스
	public int memberBalanceMinus(MileageVO vo) throws Exception;

	// 사용 마일리지 상세조회
	public List<MileageVO> useView(MileageVO inVO) throws Exception;

	// use detail 가져오기
	public List<MileageVO> selectUseDetail(MileageVO inVO) throws Exception;

	

}
