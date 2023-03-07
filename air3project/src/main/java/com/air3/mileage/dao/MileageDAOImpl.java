package com.air3.mileage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.air3.io.db.DB;
import com.air3.mileage.vo.MileageVO;

public class MileageDAOImpl extends DB implements MileageDAO{

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 마일리지 적립 - member에 잔액 업데이트
	@Override
	public int memberBalance(MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.save()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set mileage = mileage + ? "
					+ " where id = ? ";
			System.out.println("MileageDAOImpl.save().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getBalance());
			pstmt.setString(2, vo.getId());
				
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of save()
	
	
	// 마일리지 적립 - member에 잔액 업데이트
	@Override
	public int memberBalanceMinus(MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.save()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set mileage = mileage - ? "
					+ " where id = ? ";
			System.out.println("MileageDAOImpl.save().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getUmoney());
			pstmt.setString(2, vo.getId());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of save()
	
	
	// 마일리지 적립 - save에 insert
	@Override
	public int save(MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.save()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			if(vo.getRevNo() == 0) { // 예약번호 x -> 주문번호 o -> 주문 마일리지 적립
				
				String sql = " insert into m_save(save, id, emoney, balance, orderNo, memo) "
						+ " values(m_save_seq.nextval, ?, ?, ?, ?, ? ) ";
				System.out.println("MileageDAOImpl.save().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setInt(2, vo.getSmoney());
				pstmt.setInt(3, vo.getBalance());
				pstmt.setInt(4, vo.getOrderNo());
				pstmt.setString(5, vo.getSmemo());
				
			} else { // 예약번호 o -> 예약 마일리지 적립
				
				String sql = " insert into m_save(save, id, emoney, balance, revNo, memo) "
						+ " values(m_save_seq.nextval, ?, ?, ?, ?, ? ) ";
				System.out.println("MileageDAOImpl.save().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setInt(2, vo.getSmoney());
				pstmt.setInt(3, vo.getBalance());
				pstmt.setInt(4, vo.getRevNo());
				pstmt.setString(5, vo.getSmemo());
				
			} // end of if else
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리직 적립 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of save()
	
	// 예약번호 가져오기
	@Override
	public List<MileageVO> searchRevNo(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.searchRevNo()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select revno "
					+ " from reservation "
					+ " where id =? "
					+ " minus "
					+ " select revno "
					+ " from m_save "
					+ " where id = ? ";
			System.out.println("MileageDAOImpl.searchRevNo().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					if(list == null)
						list = new ArrayList<>();
					
					MileageVO vo = new MileageVO();
					
					vo.setRevNo(rs.getInt("revNo"));
					
					list.add(vo);
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("예약번호 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of save()
	
	// 주문번호 가져오기
	@Override
	public List<MileageVO> searchOrdNo(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.searchOrdNo()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select orderno "
					+ " from ordertable "
					+ " where id =? "
					+ " minus "
					+ " select orderno "
					+ " from m_save "
					+ " where id = ? ";
			System.out.println("MileageDAOImpl.searchOrdNo().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					if(list == null)
						list = new ArrayList<>();
					
					MileageVO vo = new MileageVO();
					
					vo.setOrderNo(rs.getInt("orderNo"));
					
					list.add(vo);
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("주문번호 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of save()
	
	
	// 잔여마일리지, 적립마일리지, 사용마일리지 가져오기
	@Override
	public MileageVO mileageView(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.mileageView()..........");
		
		// 결과를 전달하는 변수
		MileageVO vo = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select sum(emoney) emoney, sum(balance) balance, sum(umoney) umoney "
					+ " from( "
					+ "    select emoney, balance, 0 as umoney "
					+ "    from m_save "
					+ "    where id = ? "
					+ "    union all "
					+ "    select 0 as emoney, 0 as balance, umoney "
					+ "    from m_use "
					+ "    where id = ? "
					+ ") ";
			System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				vo = new MileageVO();
				
				vo.setSmoney(rs.getInt("emoney"));
				vo.setBalance(rs.getInt("balance"));
				vo.setUmoney(rs.getInt("umoney"));
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("적립, 잔여, 사용 마일리지 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return vo;
		
	} // end of save()
	
	
	// 적립 마일리지 상세조회
	@Override
	public List<MileageVO> saveView(MileageVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.saveView()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select emoney, to_char(regdt, 'yyyy-mm-dd') regdt, revno, orderno "
					+ " from m_save "
					+ " where id=? ";
			
			if(inVO.getCheckPeriod() != 99) // 기간 선택 ( 1,6,12개월 )
				sql += " and regdt > (add_months(sysdate, -?)) ";
			
			if(inVO.getCheckPeriod() == 99) // 기간 수동 설정
				sql += " and ( ? <= regdt ) and ( regdt <= ?) ";
			
			if(inVO.getCheckType() == 2) // 이젠항공 적립 조회
				sql += " and revno is not null ";
			
			if(inVO.getCheckType() == 3) // 쇼핑몰 적립 조회
				sql += " and orderno is not null ";
			
			sql += " order by regdt desc ";
			
			System.out.println("MileageDAOImpl.saveView().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());

			if(inVO.getCheckPeriod() != 99) // 기간 선택 ( 1,6,12개월 )
				pstmt.setInt(2, inVO.getCheckPeriod());

			if(inVO.getCheckPeriod() == 99) { // 기간 수동 설정
				pstmt.setString(2, inVO.getStartDate());
				pstmt.setString(3, inVO.getEndDate());
			}
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null ) {
				
				while(rs.next()) {
					
					if(list == null) list = new ArrayList<>();
				
					MileageVO vo = new MileageVO();
					
					vo.setSmoney(rs.getInt("emoney"));
					vo.setRegdt(rs.getString("regdt"));
					vo.setRevNo(rs.getInt("revno"));
					vo.setOrderNo(rs.getInt("orderno"));
					
					if(rs.getInt("revno") != 0) vo.setSmemo("이젠항공 예매");
					if(rs.getInt("orderno") != 0) vo.setSmemo("쇼핑몰 구매");

					list.add(vo);
				}
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("적립 마일리지 상세조회 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of save()
	
	
	// 사용 마일리지 상세조회
	@Override
	public List<MileageVO> useView(MileageVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.useView()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select umoney, to_char(regdt, 'yyyy-mm-dd') regdt, revno, orderno "
					+ " from m_use "
					+ " where id=? ";
			
			if(inVO.getCheckPeriod() != 99) // 기간 선택 ( 1,6,12개월 )
				sql += " and regdt > (add_months(sysdate, -?)) ";
			
			if(inVO.getCheckPeriod() == 99) // 기간 수동 설정
				sql += " and ( ? <= regdt ) and ( regdt <= ?) ";
			
			if(inVO.getCheckType() == 2) // 이젠항공 적립 조회
				sql += " and revno is not null ";
			
			if(inVO.getCheckType() == 3) // 쇼핑몰 적립 조회
				sql += " and orderno is not null ";
			
			sql += " order by regdt desc ";
			
			System.out.println("MileageDAOImpl.useView().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			
			if(inVO.getCheckPeriod() != 99) // 기간 선택 ( 1,6,12개월 )
				pstmt.setInt(2, inVO.getCheckPeriod());
			
			if(inVO.getCheckPeriod() == 99) { // 기간 수동 설정
				pstmt.setString(2, inVO.getStartDate());
				pstmt.setString(3, inVO.getEndDate());
			}
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null ) {
				
				while(rs.next()) {
					
					if(list == null) list = new ArrayList<>();
					
					MileageVO vo = new MileageVO();
					
					vo.setUmoney(rs.getInt("umoney"));
					vo.setRegdt(rs.getString("regdt"));
					vo.setRevNo(rs.getInt("revno"));
					vo.setOrderNo(rs.getInt("orderno"));
					
					if(rs.getInt("revno") != 0) vo.setSmemo("이젠항공 예매");
					if(rs.getInt("orderno") != 0) vo.setSmemo("쇼핑몰 구매");
					
					list.add(vo);
				}
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("사용 마일리지 상세조회 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of use()
	
	
	// 마일리지 사용 - use에 insert
	@Override
	public int use(MileageVO vo, int num) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.use() - "+vo);
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			
			String sql;
			if( num == 1) { // 주문
				
				// 3. sql 작성
				sql = " insert into m_use(use, orderNo, umoney, id) "
						+ " values(m_use_seq.nextval, (select max(orderNo) from ordertable "
						+ " where id = ?) , ?, ?) ";
				System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
				
			} else { // 예약
				sql = " insert into m_use(use, revNo, umoney, id) "
						+ " values(m_use_seq.nextval, (select max(revNo) from reservation "
						+ " where id = ?) , ?, ?) ";
				System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
				
			} // end of if else
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getUmoney());
			pstmt.setString(3, vo.getId());

			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용 use insert DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		System.out.println("use - " + result);
		
		return result;
		
	} // end of use()

	// 마일리지 사용 - save에 update
	@Override
	public int balanceUpdate(List<MileageVO> list, MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.use()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update m_save set balance = ? "
					+ " where id = ? and save= ? ";
			System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
			
			// 사용할 마일리지
			int money = vo.getUmoney();
			
			// 기존 잔액
			list.get(0).getBalance();
			
			int i;	
			for(i=0; i<=list.size(); i++) {
				
				money -= (list.get(i).getBalance());
				if(money <=0) break;
				
			} // end of for
			
			
			if(i == 0) { // 한개만 update 실행
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, -money);
				pstmt.setString(2, vo.getId());
				pstmt.setInt(3, list.get(0).getSave());
				
				// 5. 실행 -> rs
				result = pstmt.executeUpdate();

			} else { // 여러개 update 실행
				int j;
				for(j=0; j<i; j++) {
					// 4. 실행객체 생성 & 데이터 세팅
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, 0);
					pstmt.setString(2, vo.getId());
					pstmt.setInt(3, list.get(j).getSave());
					// 5. 실행 -> rs
					result = pstmt.executeUpdate();

				} // end of for
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, -money);
				pstmt.setString(2, vo.getId());
				pstmt.setInt(3, list.get(i).getSave());
				// 5. 실행 -> rs
				result = pstmt.executeUpdate();
				
			} // end of if else
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용 balance update DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		System.out.println("balanceUpdate - "+result);
		
		return result;
		
	} // end of balanceUpdate()
	
	// 마일리지 사용 - 잔액이 있는 적립번호 가져오기
	@Override
	public List<MileageVO> searchSaveNo(MileageVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.use()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select save, balance "
					+ " from m_save "
					+ " where id=? and balance is not null "
					+ " order by save asc ";
			System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					if(list == null) list = new ArrayList<>();
					
					MileageVO vo = new MileageVO();
					
					vo.setSave(rs.getInt("save"));
					vo.setBalance(rs.getInt("balance"));
					
					list.add(vo);
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용 적립번호 가져오기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		System.out.println("searchSaveNo - "+list);

		return list;
	} // end of searchSaveNo()

	// 마일리지 사용 - usedetail에 insert
	@Override
	public int useDetailInsert(List<MileageVO> list, List<Integer> useList, MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.use()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " insert into m_useDetail(emoney, use, save) "
					+ " values(?, (select max(use) "
					+ " from m_use "
					+ " where id=? ), ?) ";
			System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
			
			int i;
			
			if(useList.size() == 1) { // 한개만 update 했을때
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(0).getBalance()+useList.get(0));
				pstmt.setString(2, vo.getId());
				pstmt.setInt(3, list.get(0).getSave());
				
				// 5. 실행 -> rs
				result = pstmt.executeUpdate();
				
			} else { // 여러개 update 했을떄
			
				for(i=0; i<useList.size()-1; i++) {
					
					// 4. 실행객체 생성 & 데이터 세팅
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, list.get(i).getBalance());
					pstmt.setString(2, vo.getId());
					pstmt.setInt(3, list.get(i).getSave());
					
					// 5. 실행 -> rs
					result = pstmt.executeUpdate();
				} // end of for
			
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(i).getBalance()+useList.get(i));
				pstmt.setString(2, vo.getId());
				pstmt.setInt(3, list.get(i).getSave());
				
				// 5. 실행 -> rs
				result = pstmt.executeUpdate();
			} // end of if else
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용 useDetail insert DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		System.out.println("useDetailInsert - "+result);

		return result;
	} // end of useDetail insert()

//	// 마일리지 사용취소 - use_seq 찾기
//	@Override
//	public List<MileageVO> findUseSeq(MileageVO inVO) throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("MileageDAOImpl.use()..........");
//		
//		// 결과를 전달하는 변수
//		List<MileageVO> list = null;
//		
//		try {
//			
//			// 1.드라이버 확인 2.연결
//			con = DB.getConnection();
//			
//			// 3. sql 작성
//			String sql = " select u.use, d.emoney, d.save "
//					+ " from m_use u, m_usedetail d "
//					+ " where u.use = d.use and revno = ? ";
//			System.out.println("MileageDAOImpl.mileageView().sql : "+sql);
//			
//			// 4. 실행객체 생성 & 데이터 세팅
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, inVO.getRevNo());
//			
//			// 5. 실행 -> rs
//			rs = pstmt.executeQuery();
//			
//			if(rs != null) {
//				
//				while(rs.next()) {
//					
//					if(list == null) list = new ArrayList<>();
//					
//					MileageVO vo = new MileageVO();
//					
//					vo.setSave(rs.getInt("save"));
//					vo.setBalance(rs.getInt("balance"));
//					
//					list.add(vo);
//				}
//				
//			}
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace(); // 개발자를 위한 코드
//			throw new Exception("마일리지 사용 적립번호 가져오기 DB 처리중 오류가 발생했습니다.");
//			
//		} finally {
//			
//			// 7. 닫기
//			DB.close(con, pstmt, rs);
//			
//		} // end of try catch finally
//		
//		return list;
//	}
//	
	// 마일리지 사용취소 - usedetail select
	@Override
	public List<MileageVO> selectUseDetail(MileageVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.selectUseDetail()..........");
		
		// 결과를 전달하는 변수
		List<MileageVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			if(inVO.getOrderNo() != 0) { // 주문번호 넘어올때
				// 3. sql 작성
				String sql = " select save, emoney "
						+ " from m_usedetail "
						+ " where use = ( "
						+ "    select use "
						+ "    from m_use "
						+ "    where orderno = ? "
						+ " ) ";
				System.out.println("MileageDAOImpl.selectUseDetail().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, inVO.getOrderNo());
				
			} else { // 예약번호 넘어올떄
				
				// 3. sql 작성
				String sql = " select save, emoney "
						+ " from m_usedetail "
						+ " where use = ( "
						+ "    select use "
						+ "    from m_use "
						+ "    where revno = ? "
						+ " ) ";
				System.out.println("MileageDAOImpl.selectUseDetail().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, inVO.getRevNo());
				
			} // end of if else
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					if(list == null) list = new ArrayList<>();
					
					MileageVO vo = new MileageVO();
					
					vo.setSave(rs.getInt("save"));
					vo.setUmoney(rs.getInt("emoney"));
					
					list.add(vo);
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용취소 select use detail DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of selectusedetail()
	
	
	// 마일리지 사용취소 - usedetail에 delete
	@Override
	public int useDetailDelete(MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.useDetailDelete()..........");
		
		// 결과를 전달하는 변수
		int result = 0; 
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			if(vo.getOrderNo() != 0) { // 주문번호 넘어올때
				// 3. sql 작성
				String sql = " delete from m_usedetail "
						+ " where use = ( "
						+ "    select use "
						+ "    from m_use "
						+ "    where orderno = ? "
						+ " ) ";
				System.out.println("MileageDAOImpl.useDetailDelete().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getOrderNo());
				
			} else { // 예약번호 넘어올떄
				
				// 3. sql 작성
				String sql = " delete from m_usedetail "
						+ " where use = ( "
						+ "    select use "
						+ "    from m_use "
						+ "    where orderno = ? "
						+ " ) ";
				System.out.println("MileageDAOImpl.useDetailDelete().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getRevNo());
				
			} // end of if else
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용취소 useDetailDelete DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
	}

	// 마일리지 사용취소 - save에 update
	@Override
	public int balanceCancel(List<MileageVO> list) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.balanceCancel()..........");
		
		// 결과를 전달하는 변수
		int result = 0; 
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
				
			// 3. sql 작성
			String sql = " update m_save "
					+ " set balance = balance + ? "
					+ " where save = ? ";
			System.out.println("MileageDAOImpl.balanceCancel().sql : "+sql);
			
			int i;
			for(i = 0; i<list.size(); i++) {
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(i).getUmoney());
				pstmt.setInt(2, list.get(i).getSave());
				
				// 5. 실행 -> rs
				result = pstmt.executeUpdate();
				
			} // end of for
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용취소 balanceCancel DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
	}

	// 마일리지 사용취소 - use에 delete
	@Override
	public int useDelete(MileageVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageDAOImpl.useDelete()..........");
		
		// 결과를 전달하는 변수
		int result = 0; 
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			if(vo.getOrderNo() != 0) { // 주문번호 넘어올떄
				// 3. sql 작성
				String sql = " delete from m_use "
						+ "	where orderno = ? ";
				System.out.println("MileageDAOImpl.useDelete().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getOrderNo());
			
			} else { // 예약번호 넘어올떄
				// 3. sql 작성
				String sql = " delete from m_use "
						+ "	where revno = ? ";
				System.out.println("MileageDAOImpl.useDelete().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getRevNo());
				
			}
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("마일리지 사용취소 balanceCancel DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
	}

} // end of MileageDAOImpl class
