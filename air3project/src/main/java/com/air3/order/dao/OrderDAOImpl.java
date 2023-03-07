package com.air3.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.order.vo.OrderVO;
import com.webjjang.util.PageObject;
import com.air3.io.db.DB;
import com.air3.member.vo.LoginVO;

public class OrderDAOImpl implements OrderDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	@Override
	public List<OrderVO> list(PageObject pageObject) throws Exception {
		System.out.println("OrderDAOImpl.list()");
		// 결과를 전달되는 변수 선언
		List<OrderVO> list = null;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3.sql
			String sql = "select  orderno, ordername, orderdate, id, totalprice from orderrs ";
			// 검색 조건 처리
			sql += searchSQL(pageObject);
			sql += " order by orderno desc";
			//   3-2. 순서 번호 붙이기
			sql = "select rownum rnum, orderno, ordername, orderdate, id, totalprice "
				+ " from (" + sql + ")";
			//   3-3. 페이지 데이터 조건문
			sql = "select orderno, ordername, orderdate, id, totalprice "
					+ " from (" + sql + ") where rnum between ? and ? ";

			

			System.out.println("3.orderDAOImpl.list().sql" + sql);
			// 4.실행객체 생성 & 데이터 세팅
			
			// 검색에 대한 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			// 검색에 대한 데이터 세팅
			idx = searchDataSet(pageObject, idx);
			pstmt.setLong(++idx, pageObject.getStartRow());
			pstmt.setLong(++idx, pageObject.getEndRow());
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();

			// 6. 데이터 표시 및 저장 - list
			// rs가 null이 아니면 처리하자.
			if (rs != null) {
				// rs의 그 다음 데이터가 있으면 처리가 하도록
				while (rs.next()) {
					// list가 null이면 한번만 생성
					if (list == null)
						list = new ArrayList<>();
					// 데이터를 담을 vo객체를 생성한다.
					OrderVO vo = new OrderVO();
					// rs의 데이터를 꺼내서 vo에 담는다.
					vo.setOrderNo(rs.getLong("orderNo"));
					vo.setOrderName(rs.getString("orderName"));
					vo.setId(rs.getString("id"));
					vo.setOrderDate(rs.getString("orderDate"));
					vo.setTotalPrice(rs.getLong("totalPrice"));
					// 데이터가 담긴 vo를 list에 담는다.
					list.add(vo);
				} // end of while
			} // end of if
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			// 이렇게 메세지를 넣어서 보여줘도 된다.
			throw new Exception("주문내역 리스트 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return list;
	}// end of List<orderVO> list()

	@Override
	public long getTotalRow(PageObject pageObject) throws Exception {
		System.out.println("OrderDAOImpl.getTotalRow().PageObject");

		long totalRow = 0;

		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "select count(*)from orderTable";
			System.out.println("OrderDAOImpl.getTotalRow().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 및 표시
			if (rs != null && rs.next()) {
				// 첫번째 데이터를 꺼내오자.
				totalRow = rs.getLong(1);

			}
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("공지사항 리스트를 위한 전체 데이터 개수 DB처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return totalRow;

	}// end of getTotalRow

	@Override
	public OrderVO view(long orderNo) throws Exception {
		System.out.println("OrderDAOImpl.list()");
		// 결과를 전달되는 변수 선언
		// 결과를 전달되는 변수 선언
		
		OrderVO orderVO = new OrderVO();
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3.sql - 주문 번호,주문품목,주문날짜,주문총금액,주문수량,결제내역,마일리지,
			String sql = "select orderno, id, img, name, orderdate, quantity, totalprice, "
						+ " pay, orderstatus, startstation , startdate, "
						+ " endstation, enddate, revno, use from orderview where orderno = ? ";
			
			System.out.println("3.OrderDAOImpl.view().sql" + sql);
			// 4.실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, orderNo);
			// 5. 실행 >> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 표시 및 저장 - list
			if (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderNo(rs.getLong("orderno"));
				orderVO.setImg(rs.getString("id"));
				orderVO.setImg(rs.getString("img"));
				orderVO.setName(rs.getString("name"));
				orderVO.setOrderDate(rs.getString("orderdate"));
				
				orderVO.setQuantity(rs.getLong("quantity"));
				orderVO.setTotalPrice(rs.getLong("totalprice"));
				orderVO.setPay(rs.getString("pay"));
				
				orderVO.setOrderStatus(rs.getString("orderstatus"));
				orderVO.setStartStation(rs.getString("startstation"));
				orderVO.setEndStation(rs.getString("endstation"));
				orderVO.setStartDate(rs.getString("startdate"));
				orderVO.setEndDate(rs.getString("enddate"));
				orderVO.setRevNo(rs.getLong("revno"));
				orderVO.setUsemileage(rs.getLong("use"));
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			// 이렇게 메세지를 넣어서 보여줘도 된다.
			throw new Exception("주문내역 리스트 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return orderVO;
	}

	@Override
	public Integer order(OrderVO vo) throws Exception {
		System.out.println("OrderDAOImpl.order().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql- 상품명, 예약번호,구매일,id,pay,totalPrice,use
			String sql = "INSERT INTO ordertable(ORDERNO,ORDERNAME,REVNO,ID,PAY,TOTALPRICE)"
					+ "VALUES(order_seq.nextval,?,?,?,?,?)";
			System.out.println("OrderDAOImpl.write().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getOrderName());
			pstmt.setLong(2, vo.getRevNo());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getPay());
			pstmt.setLong(5, vo.getTotalPrice());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("OrderDAOImpl.write()---주문 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문하기 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}

	@Override
	public Integer update(OrderVO vo) throws Exception {
		System.out.println("OrderDAOImpl.update().vo" + vo);
		int result = 0;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - 주문번호, 상품명, 주문날짜, 결제내역, 주문총금액, 사용한 마일리지, 주문자 아이디
			String sql = "update order_Detail set orderStatus=? where orderNo=? ";
		//String sql = "UPDATE orderDetail od JOIN orderTable ot ON od.orderNo = ot.orderNo SET od.orderStatus=?, ot.pay=? WHERE ot.id=?";

			System.out.println("OrderDAOImpl.update().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getOrderStatus());
			pstmt.setLong(2, vo.getOrderNo());
		
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 표시 및 저장
			System.out.println("OrderDAOImpl.update()---주문내역 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문내역 수정 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}

	@Override
	public Integer delete(long no) throws Exception {
		System.out.println("OrderDAOImpl.delete().no" + no);
		int result = 0;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - 주문번호
			String sql = "delete from orderTable where orderNo=?";
			System.out.println("OrderDAOImpl.delete().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 표시 및 저장
			System.out.println("OrderDAOImpl.delete()---주문내역 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문내역 삭제 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}
	public Integer deleteDetail(long no) throws Exception {
		System.out.println("OrderDAOImpl.delete().no" + no);
		int result = 0;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - 주문번호
			String sql = "delete from order_detail where orderNo=?";
			System.out.println("OrderDAOImpl.delete().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 표시 및 저장
			System.out.println("OrderDAOImpl.delete()---주문내역 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문내역 삭제 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}

	@Override
	public Integer orderDetail(OrderVO vo) throws Exception {
		System.out.println("OrderDAOImpl.orderDetail().vo:" + vo);

		int result = 0;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - order_detail 테이블에 데이터 삽입
			String sql = "insert into order_detail(order_detailno,productno,quantity,orderstatus,orderno)values(order_detail_seq.nextval,?,?,?,?)";

			System.out.println("OrderDAOImpl.orderDetail().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, vo.getProductNo());
			pstmt.setLong(2, vo.getQuantity());
			pstmt.setString(3, vo.getOrderStatus());
			pstmt.setLong(4, vo.getOrderNo());
			// 5. 실행
			System.out.println("");
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("OrderDAOImpl.orderDetail() - 주문 상세 정보 등록 완료");
		} catch (Exception e) {
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("주문 상세 정보 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}

	public List<OrderVO> searchRevNo(OrderVO vo) throws Exception {
		System.out.println("OrderDAOImpl.orderDetail().vo:" + vo);

		List<OrderVO> list = null;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - order_detail 테이블에 데이터 삽입
			String sql = "select FLIGHTNO, STARTDATE, STARTSTATION, ENDDATE, ENDSTATION, REVNO from orderRev where id = ?";

			System.out.println("OrderDAOImpl.orderDetail().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());

			rs = pstmt.executeQuery();
			
				if (rs != null) {
					// rs의 그 다음 데이터가 있으면 처리가 하도록
					while (rs.next()) {
						// list가 null이면 한번만 생성
						if (list == null)
							list = new ArrayList<>();
						// 데이터를 담을 vo객체를 생성한다.
						vo = new OrderVO();
						vo.setFlightno(rs.getLong("FLIGHTNO"));
						vo.setStartDate(rs.getString("STARTDATE"));
						vo.setStartStation(rs.getString("STARTSTATION"));
						vo.setEndStation(rs.getString("ENDSTATION"));
						vo.setEndDate(rs.getString("ENDDATE"));
						vo.setRevNo(rs.getLong("REVNO"));
						// 데이터가 담긴 vo를 list에 담는다.
						list.add(vo);
						

			}
					
				}
			

			// 5. 실행

			// 6. 데이터 저장 및 표시

		} catch (Exception e) {
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("주문 상세 정보 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		System.out.println("list : "+list);
		return list;
	}

	@Override
	public long serchOrderNo() throws Exception {
		try {
			con = DB.getConnection();
			String sql = "SELECT max(orderNo) orderNo FROM ordertable";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs != null)
				rs.next();
			return rs.getLong("orderNo");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		} finally {
			try {
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				throw new Exception();
			}
		}
	}

	private String searchSQL(PageObject pageObject) {
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			sql += " where (1=0 ";
			if (key.indexOf("n") >= 0)
				sql += " or flightno like ? ";
			if (key.indexOf("s") >= 0)
				sql += " or startstation like ? ";
			if (key.indexOf("e") >= 0)
				sql += " or endstation like ? ";
			sql += ") ";
		}
		return sql;
	}

	private int searchDataSet(PageObject pageObject, int idx) throws SQLException {
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			if (key.indexOf("n") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
			if (key.indexOf("s") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
			if (key.indexOf("e") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
		}
		return idx;
	}
	@Override
	public int searchM(String id) throws Exception {
		try {
			con = DB.getConnection();
			String sql = "select mileage from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs != null)
				rs.next();
			
			return rs.getInt("mileage");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception();
		} finally {
			try {
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				throw new Exception();
			}
		}
	}
	

}
