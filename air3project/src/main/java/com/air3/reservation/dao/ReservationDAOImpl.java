package com.air3.reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.air3.io.db.DB;
import com.air3.reservation.vo.ReservationVO;



public class ReservationDAOImpl implements ReservationDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	public List<ReservationVO> FSlist(ReservationVO vo) throws Exception {
		
		
		
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<ReservationVO> list = null;

		try {
			con = DB.getConnection();
		System.out.println("연결");
				String sql = "select cno, cname, startstation, startcon, endstation, endcon, price, startDate, endDate, lt, flightNo " 
						      + " from( "
							  + " select cno, cname, startstation, startcon, endstation, endcon, price, to_char(startDate, 'yyyy-mm-dd hh24:mi') startDate, " 
							  + " to_char(endDate, 'yyyy-mm-dd hh24:mi')endDate, (endDate-startDate)*24*60 lt, flightNo "
							  + " from( " 
							  + " select f.flightNo, c.cname, f.startstation, stc.startcon, f.endstation, ec.endcon, f.price, f.cno, " 
							  + " to_date(f.startdate, 'yyyy-mm-dd hh24:mi') startDate, to_date(f.endDate, 'yyyy-mm-dd hh24:mi') endDate " 
							  + " from flightinf f, craftinf c, startcon stc, endcon ec where(c.cno = f.cno) and (f.startstation = stc.startstation) and (f.endstation = ec.endstation) " 
							  + " )) "
							  + " where startstation = ? and endstation= ? and startDate like ? ";
					
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, vo.getEndStation());
				pstmt.setString(3, "%" + vo.getStartDate() + "%");
				rs = pstmt.executeQuery();
					if (rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while (rs.next()) {
					// list가 null 이면 한번만 생생
					if (list == null) list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					ReservationVO FSVo = new ReservationVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					String s_time = rs.getString("startDate");
					String e_time = rs.getString("endDate");
					String st = s_time.substring(11);
					String sd = s_time.substring(0, 10);
					String et = e_time.substring(11);
					String ed = e_time.substring(0, 10);
					
					
				    System.out.println("");
					
					int l_time = rs.getInt("lt");
					String lt = l_time / 60 +"시간";
					
					if( l_time % 60 > 0 ) {
						lt += l_time % 60 + "분"; 
					}
					
					System.out.println(lt);
					
					System.out.println(st);
					System.out.println(et);
					System.out.println(rs.getInt("lt"));
					FSVo.setFlightNo(rs.getInt("flightNo"));
					FSVo.setcNo(rs.getInt("cNo"));
					FSVo.setcName(rs.getString("cName"));
					FSVo.setStartCon(rs.getString("startCon"));
					FSVo.setStartStation(rs.getString("startStation"));
					FSVo.setEndCon(rs.getString("endCon"));
					FSVo.setEndStation(rs.getString("endStation"));
					FSVo.setStartDate(sd);
					FSVo.setEndDate(ed);
					FSVo.setsTime(st);
					FSVo.seteTime(et);
					FSVo.setPrice(rs.getInt("price"));
					FSVo.setLeadTime(lt);
					
					// 데이터가 담긴 vo를 list에 담는다.

					list.add(FSVo);

				} // end of while
			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("FlightInfDAOImpl.list()- DB쓰다가 오류남");
		} finally {
			DB.close(con, pstmt, rs);
System.out.println("완료");
		}

		return list;
	}// list
	
	@Override
	public ReservationVO view(Integer flno) throws Exception {
		
		// TODO Auto-generated method stub
				System.out.println("ServiceInfoDAOImpl.view().no : " );
				// 리턴 데이터 선언
				ReservationVO FSView = null;
				
				try {
					// 1. 확인 2. 연결
					con = DB.getConnection();
					// 3. sql
					String sql = "select cno, cname, startstation, startcon, endstation, endcon, price, startDate, endDate, lt, flightNo " 
						      + " from( "
							  + " select cno, cname, startstation, startcon, endstation, endcon, price, to_char(startDate, 'yyyy-mm-dd hh24:mi') startDate, " 
							  + " to_char(endDate, 'yyyy-mm-dd hh24:mi')endDate, (endDate-startDate)*24*60 lt, flightNo "
							  + " from( " 
							  + " select f.flightNo, c.cname, f.startstation, stc.startcon, f.endstation, ec.endcon, f.price, f.cno, " 
							  + " to_date(f.startdate, 'yyyy-mm-dd hh24:mi') startDate, to_date(f.endDate, 'yyyy-mm-dd hh24:mi') endDate " 
							  + " from flightinf f, craftinf c, startcon stc, endcon ec where(c.cno = f.cno) and (f.startstation = stc.startstation) and (f.endstation = ec.endstation) " 
							  + " )) "
							  + " where flightNo = ?" ;
					System.out.println("ServiceInfoDAOImpl.view().sql : " + sql);
					// 4. 실행객체 & 데이터 세팅
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, flno);
					// 5. 실행 -> rs
					rs = pstmt.executeQuery();
	
				
					if(rs != null && rs.next()) {
						// rs에 다음 데이터가 있으면 처리
						FSView = new ReservationVO();
						// rs에 데이터를 꺼내서 vo에 담는다.
						// rs에 데이터를 꺼내서 vo에 담는다.
						String s_time = rs.getString("startDate");
						String e_time = rs.getString("endDate");
						String st = s_time.substring(11);
						String sd = s_time.substring(0, 10);
						String et = e_time.substring(11);
						String ed = e_time.substring(0, 10);
						
						
					
						
						int l_time = rs.getInt("lt");
						String lt = l_time / 60 +"시간";
						
						if( l_time % 60 > 0 ) {
							lt += l_time % 60 + "분"; 
						}
						
						System.out.println(lt);
						
						System.out.println(st);
						System.out.println(et);
						System.out.println(rs.getInt("lt"));
						FSView.setFlightNo(rs.getInt("flightNo"));
						FSView.setcNo(rs.getInt("cNo"));
						FSView.setcName(rs.getString("cName"));
						FSView.setStartCon(rs.getString("startCon"));
						FSView.setStartStation(rs.getString("startStation"));
						FSView.setEndCon(rs.getString("endCon"));
						FSView.setEndStation(rs.getString("endStation"));
						FSView.setStartDate(sd);
						FSView.setEndDate(ed);
						FSView.setsTime(st);
						FSView.seteTime(et);
						FSView.setPrice(rs.getInt("price"));
						FSView.setLeadTime(lt);
						
					} // end of if
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace(); // 개발자를 위한 코드
					throw new Exception("게시판 글보기 DB 처리 중 오류 발생");
				} finally {
					// 7. 닫기
					DB.close(con, pstmt, rs);
				} // end of try ~ catch ~ finally
				
				
				return FSView;
		
		
		
	} 
	
	
	
	@Override
	public Integer reservationRegistration(ReservationVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("OrderDAOImpl.write().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql- 상품명, 예약번호,구매일,id,pay,totalPrice,use 
			String sql = "insert all "
					+ " reservation ()"
					
					+ " insert into reservation ( revNo, id, flightNo, peopleNo, total,  use)  "
					
					+ " values( ?, ?, ?, ?, ?, ?)";
					
			System.out.println("reservationDAOImpl.write().sql:" + sql);
			// 4. 실행객체 생성 및 데이터

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getRevNo());
			
		
			

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.write()---주문 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문하기 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	
		
		
	}
	
	
}// end class
