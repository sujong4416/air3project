package com.air3.reservation.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.flightInf.VO.FlightInfVO;
import com.air3.io.db.DB;
import com.air3.member.vo.MemberVO;
import com.air3.reservation.vo.ReservationVO;
import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.webjjang.util.PageObject;

public class PayReservationDAOImpl implements PayReservationDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

//항공권 예약순서 1
	@Override
	public List<FlightInfVO> list(FlightInfVO vo) throws Exception {
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<FlightInfVO> list = null;

		try {
			con = DB.getConnection();

			if (vo.getStartStation() != null && vo.getEndStation() == null && vo.getStartDate() == "") {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				rs = pstmt.executeQuery();
			} else if (vo.getStartStation() != null && vo.getEndStation() == null && vo.getStartDate() != null) {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? and startdate LIKE ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, "%" + vo.getStartDate() + "%");
				rs = pstmt.executeQuery();
			} else {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? and startdate LIKE ?  and endStation = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, "%" + vo.getStartDate() + "%");
				pstmt.setString(3, vo.getEndStation());
				rs = pstmt.executeQuery();
			}
			if (rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while (rs.next()) {
					// list가 null 이면 한번만 생생
					if (list == null)
						list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					FlightInfVO cVo = new FlightInfVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					cVo.setcNo(rs.getLong("cno"));
					cVo.setcName(rs.getString("cname"));
					cVo.setStartCon(rs.getString("startcon"));
					cVo.setStartStation(rs.getString("startstation"));
					cVo.setEndCon(rs.getString("endcon"));
					cVo.setEndStation(rs.getString("endstation"));
					cVo.setStartDate(rs.getString("startdate"));
					cVo.setEndDate(rs.getString("enddate"));
					cVo.setPrice(rs.getLong("price"));
					// 데이터가 담긴 vo를 list에 담는다.

					list.add(cVo);
				} // end of while
			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("FlightInfDAOImpl.list()- DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt, rs);
		}

		return list;
	}// list

	@Override
	public Integer PaymentWrite(ReservationVO vo) throws Exception {
		Integer result = 0;
		System.out.println("PaymentWrite DaoImpl " + vo);
		try {
			con = DB.getConnection();
			// 생성할 것 - 예약번호, 예약할항공번호, 몇명인지,사용마일리지 ,토탈금액
			String sql = "insert into reservation(revNo,id,flightNo,peopleNo,use,total) "
					+ " VALUES(reservation_seq.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getFlightNo());
			pstmt.setInt(3, vo.getPeopleNo());
			pstmt.setInt(4, vo.getSave());
			pstmt.setInt(5, vo.getTotal());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.paymentWrite() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt);
		}

		return result;
	}

//내 예약 리스트로 보기
	// 내 예약 리스트로 보기
	@Override
	public List<ReservationVO> revList(PageObject pageObject, ReservationVO listVO) throws Exception {

		System.out.println("ReservationDAOImpl.revList()-----------------------" + listVO);
		List<ReservationVO> revList = null;
		String word = pageObject.getWord();
		System.out.println(word);
		System.out.println(listVO.getId());
		System.out.println(pageObject.getStartRow());
		System.out.println(pageObject.getEndRow());
		try {
			con = DB.getConnection();
			
			String sql = "select r.revNo, m.name,m.id, f.startStation,f.endStation,f.startDate,f.endDate "
					+ " from member m ,flightInf f, reservation r ";

			sql += searchSQL(pageObject);
			if (sql.indexOf("where") != -1) {
				
			} else {
				sql += " where ";
				sql += " (m.id = r.id) and (f.flightno = r.flightno) ";
			}
			
             //일반회원일때 아이디를 검색하기
			if (listVO.getGradeNo() == 1) {
				sql += " and m.id = ? ";
			}

			sql += " order by revNo desc";
			// 3-2. 순서 번호 붙이기
			sql = "select rownum rnum, revNo, name,id, startStation,endStation,startDate,endDate  " + " from (" + sql
					+ ")";
			// 3-3. 페이지 데이터 조건문
			sql = "select revNo, name,id, startStation,endStation,startDate,endDate " + " from (" + sql
					+ ") where  rnum between ? and ? ";

			pstmt = con.prepareStatement(sql);
			System.out.println("ReservationDAOImpl.List.sql: " + sql);
			int idx = 0;
			
			// 검색에 대한 데이터를 셋팅
			idx = searchDateSet(pageObject, idx);
			
			if (listVO.getGradeNo() == 1) {
				pstmt.setString(++idx, listVO.getId());
			}

			pstmt.setLong(++idx, pageObject.getStartRow());
			pstmt.setLong(++idx, pageObject.getEndRow());

			rs = pstmt.executeQuery();

			if (rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while (rs.next()) {
					// list가 null 이면 한번만 생생
					if (revList == null)
						revList = new ArrayList<>();

					ReservationVO vo = new ReservationVO();

					vo.setRevNo(rs.getString("revNo"));
					vo.setName(rs.getString("name"));
					vo.setId(rs.getString("id"));
					vo.setStartStation(rs.getString("startStation"));
					vo.setEndStation(rs.getString("endStation"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setEndDate(rs.getString("endDate"));
					System.out.println("11111111111");
					revList.add(vo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.list() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt, rs);
		}

		return revList;
	}// list

	// 검색을 위한 sql작성
	private String searchSQL(PageObject pageObject) {
		// jsp에서 보이고 안보이고가 가능하면 지우기
		System.out.println("11111111111111111111111111");
		//ReservationVO vo = new ReservationVO();
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			// jsp에서 보이고 안보이고가 가능하면 지우기
			//if (vo.getGradeNo()==1) {
				sql += " where(1=1 ";
				if (key.indexOf("ss") >= 0)
					sql += " and f.startStation like ? and ((m.id = r.id) and (f.flightno = r.flightno))";
				if (key.indexOf("sd") >= 0)
					sql += " and f.startDate like ? and ((m.id = r.id) and (f.flightno = r.flightno))";

			//} else {
				//sql += " where(1=1 ";
				if (key.indexOf("i") >= 0)
					sql += "and m.id like ? and (r.id = m.id) and ((m.id = r.id) and (f.flightno = r.flightno))";
//				if (key.indexOf("is") >= 0)
//					sql += "and f.startStation like ? and (r.id = m.id) and (f.flightno = r.flightno)";
//				if (key.indexOf("id") >= 0)
//					sql += "and f.startDate like and (r.id = m.id) and (f.flightno = r.flightno)?";
//			//}
			sql += ")";
		}
		return sql;
	}

	// 검색을 위한 데이터 셋팅 - pageObject는 주소를 받아서 씀
	private int searchDateSet(PageObject pageObject, int idx) throws SQLException {
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			// case by case로 만들면 조건이 많아져서 indexOf로 구성
			if (key.indexOf("ss") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
			if (key.indexOf("sd") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
			
			
			if (key.indexOf("i") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
//			if (key.indexOf("is") >= 0)
//				pstmt.setString(++idx, "%" + word + "%");
//			if (key.indexOf("id") >= 0)
//				pstmt.setString(++idx, "%" + word + "%");
		}
		return idx;
	}

	@Override
	public long getTotalRow(PageObject pageObject) throws Exception {
		System.out.println("ReservationDAOImpl.getTotalRow().pageObject" + pageObject);
		long totalRow = 0;
		try {
			// 1.2
			con = DB.getConnection();

			// 3.sql - 검색때문에 만듦
			String sql = "select count(*) from  reservation r, member m , flightInf f ";
			sql += searchSQL(pageObject);
			if (sql.indexOf("where") == -1) {
				sql += " where ";
				sql += " (m.id = r.id) and (f.flightno = r.flightno) ";
			}
			
			System.out.println("ReservationDAOImpl.getTotalRow().sql" + sql);
			// 4.실행객체 데이터 셋팅
			pstmt = con.prepareStatement(sql);
			// 뒤에 받을게 없으니까 0으로 셋팅.
			int idx = 0;
			idx = searchDateSet(pageObject, idx);
			// 5.실행
			rs = pstmt.executeQuery();
			// 6 저장
			if (rs != null && rs.next()) {
				totalRow = rs.getLong(1);
			} // end if

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("항공권 예약 위한 전체 페이지 갯수 DB처리중 오류");
		} finally {
			// 7.닫기
			DB.close(con, pstmt, rs);
		} // end try - catch - finally

		return totalRow;
	}// end Method
//내 예약 상세보기

	@Override
	public ReservationVO reservationView(String revNo) throws Exception {
		ReservationVO vo = null;
		System.out.println("daoImpl.reservationView." + revNo);
		try {
			con = DB.getConnection();
			String sql = "select r.revNo,m.name,m.tel, m.id,f.flightNo,f.startStation,f.endStation,f.startDate,f.endDate, r.total,v.revMealNo,e.mealName,s.seatInf "
					+ " from meal e, rMeal v, member m ,seat s, "
					+ " flightInf f, reservation r "
					+ " where(e.mealNo=v.mealNo) and (r.revNo=v.revNo) and (m.id = r.id) and (s.revNo= r.revNo) and (f.flightNo =r.flightNo) and r.revNo=?";
       
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, revNo);
			System.out.println("reservation.view.sql" + sql);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				vo = new ReservationVO();
				vo.setRevNo(rs.getString("revNo"));
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setTel(rs.getString("tel"));
				vo.setStartStation(rs.getString("startStation"));
				vo.setEndStation(rs.getString("endStation"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setTotal(rs.getInt("total"));
				vo.setRevMealNo(rs.getString("revMealNo"));
				vo.setMealName(rs.getString("mealName"));
				vo.setSeatInf(rs.getString("seatInf"));

			} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.view() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt, rs);
		} // end finally

		return vo;
	}// end reView
//기내식 수정하기

	@Override
	public Integer reservationUpdate(ReservationVO vo) throws Exception {
		Integer result = 0;
		System.out.println("daoImpl.reservationUpdate." + vo);
		try {
			con = DB.getConnection();

			String sql = "update rMeal set MealNo = ? where revNo =? ";

			pstmt = con.prepareStatement(sql);
			System.out.println("update.sql: " + sql);
			pstmt.setLong(1, vo.getMealNo());
			pstmt.setString(2, vo.getRevNo());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.update() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt);
		}
		return result;
	}

//항공권 삭제
	@Override
	public Integer reservationDelete(ReservationVO vo) throws Exception {
		Integer result = 0;
		System.out.println("daoImpl.reservationUpdate." + vo);
		try {
			con = DB.getConnection();

			String sql = "delete from reservation where revNo =?";

			pstmt = con.prepareStatement(sql);
			System.out.println("update.sql: " + sql);
			pstmt.setString(1, vo.getRevNo());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.update() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt);
		}

		return result;
	}

	// 기내식예약
	@Override
	public int rMeal(ReservationVO vo) throws Exception {
		Integer result = 0;
		System.out.println("daoImpl.reservationUpdate." + vo);
		try {
			con = DB.getConnection();

			String sql = "insert into rMeal(revMealNo, mealNo,revNo) " 
					+ " values(?,?,(select max(revno) from reservation where id = ? )) ";

			pstmt = con.prepareStatement(sql);
			System.out.println("update.sql: " + sql);
			pstmt.setString(1, vo.getRevMealNo());
			pstmt.setLong(2, vo.getMealNo());
			pstmt.setString(3, vo.getId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.update() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt);
		}
		return result;
	}
	
	
	// 기내식예약
	@Override
	public int revSeat(ReservationVO vo) throws Exception {
		Integer result = 0;
		System.out.println("daoImpl.revSeat." + vo);
		try {
			con = DB.getConnection();
			
			String sql = " INSERT INTO seat(seatNo,seatInf, revNo, flightNo) "
					+ "VALUES(seat_seq.NEXTVAL,?,(select max(revno) from reservation where id = ? ),?) ";
			
			pstmt = con.prepareStatement(sql);
			System.out.println("update.sql: " + sql);
			pstmt.setString(1, vo.getSeatInf());
			pstmt.setString(2, vo.getId());
			pstmt.setLong(3, vo.getFlightNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.update() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt);
		}
		return result;
	}
	
	// revno select
	@Override
	public String revNoSelect(ReservationVO vo) throws Exception {
		String revNo = null;
		System.out.println("daoImpl.revSeat." + vo);
		try {
			con = DB.getConnection();
			
			String sql = " select max(revno) revNo from reservation where id = ? ";
			
			pstmt = con.prepareStatement(sql);
			System.out.println("update.sql: " + sql);
			pstmt.setString(1, vo.getId());
			
			
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				revNo = ""+rs.getInt("revNo");
			} // end if
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ReservationDAOImpl.update() DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt,rs);
		}
		return revNo;
	}

}// end class
