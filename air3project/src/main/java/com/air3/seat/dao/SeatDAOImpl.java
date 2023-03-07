package com.air3.seat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.air3.io.db.DB;
import com.air3.reservation.vo.ReservationVO;

public class SeatDAOImpl implements SeatDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	@Override
	public List<String> Seatlist(ReservationVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<String> list = null;

		try {
		con = DB.getConnection();
		System.out.println("연결");
				String sql = "select seatInf from seat where flightNo= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getFlightNo());
		
				rs = pstmt.executeQuery();
					if (rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while (rs.next()) {
					// list가 null 이면 한번만 생생
					if (list == null) list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					ReservationVO seatvo = new ReservationVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					seatvo.setSeatInf(rs.getString("seatInf"));
					
					// 데이터가 담긴 vo를 list에 담는다.

					list.add(rs.getString("seatInf"));

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


}
