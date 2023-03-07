package com.air3.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.air3.cart.vo.CartVO;
import com.air3.io.db.DB;

import com.air3.product.vo.ProductVO;
import com.webjjang.util.PageObject;

public class CartDAOImpl implements cartDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	@Override
	public Integer addcart(CartVO vo) throws Exception {
		System.out.println("CartDAOImpl.addcart()"+vo);
		int result = 0;
		try {
			//1 2 드라이버 확인 
				con = DB.getConnection();
				String sql="INSERT INTO cart (cartNo, productNo, quantity, id) "
						+ " VALUES (cart_seq.nextval, ?, ?, ?)";
				System.out.println("sql" + sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, vo.getProductNo());
				pstmt.setLong(2, vo.getQuantity());
				pstmt.setString(3, vo.getId());
				result = pstmt.executeUpdate();
//				}
				System.out.println("CartDAOImpl.addcart()---장바구니 등록완료");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("장바구니 추가 DB 처리 중 오류 발생");
		} finally {
			// 6. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}// end of CartDAOImpl.addcart()

	@Override
	public List<CartVO> list(String id) throws Exception {
		System.out.println("CartDAOImpl.list()");
		List<CartVO> list = null;
		try {
			// 1.2 드라이버 확인 및 생성
			con = DB.getConnection();
			// 3.sql
			// String sql = "SELECT * FROM cart WHERE id=?";
			String sql = "select c.cartNo,p.productno,p.name,p.price,p.img,c.quantity " + " from cart c,product p "
					+ " where p.productno = c.productNo and id=? order by cartno desc";
			// 4.실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 5. 실행 >> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 세팅
			if (rs != null) {
				// rs의 그 다음 데이터가 있으면 처리가 하도록
				while (rs.next()) {
					// list가 null이면 한번만 생성
					if (list == null)
						list = new ArrayList<>();
					// 상품의 이름, 가격
					CartVO vo = new CartVO();
					vo.setCartNo(rs.getLong("cartNo"));
					vo.setProductNo(rs.getLong("productno"));
					vo.setName(rs.getString("name"));
					vo.setPrice(rs.getLong("price"));
					vo.setImg(rs.getString("img"));
					vo.setQuantity(rs.getLong("quantity"));
//			         vo.setId(rs.getString("id"));
					list.add(vo);
				}
				System.out.println("장바구니 리스트 성공");
			}
		} catch (Exception e) {

			e.printStackTrace();
			throw new Exception("장바구니 리스트 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return list;
	}// end of CartDAOImpl.list()

	@Override
	public Integer update(CartVO vo) throws Exception {
		System.out.println("CartDAOImpl.update().vo" + vo);
		int result = 0;
		
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			System.out.println("수량 증가 dao 드라이버 확인 ");
			// 3. sql
			String sql = "update cart set quantity=? where cartNo=?";
			System.out.println("CartDAOImpl.update().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			System.out.println(vo);
			pstmt.setLong(1, vo.getQuantity());
			pstmt.setLong(2, vo.getCartNo());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("CartDAOImpl.update()---장바구니 수량 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("장바구니수정 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}

	@Override
	public Integer delete(long cartNo) throws Exception {
		System.out.println("CartDAOImpl.delete().no" + cartNo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "delete from cart where cartNo=?";
			System.out.println("CartDAOImpl.delete().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, cartNo);
			//pstmt.setString(1, vo.getId());
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("CartDAOImpl.delete()---장바구니 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("장바구니삭제 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}//end of delete
	public CartVO list2(Long no) throws Exception {
		System.out.println("CartDAOImpl.list()");
		CartVO vo = null;
		
		try {
			// 1.2 드라이버 확인 및 생성
			con = DB.getConnection();
			// 3.sql
			// String sql = "SELECT * FROM cart WHERE id=?";
			String sql = "select c.cartNo,p.productno,p.name,p.price,p.img,c.quantity " + " from cart c,product p "
					+ " where p.productno = c.productNo and cartno=? order by cartno desc";
			// 4.실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행 >> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 세팅
			if(rs != null && rs.next()) {
					// 상품의 이름, 가격
					vo = new CartVO();
					vo.setCartNo(rs.getLong("cartNo"));
					vo.setProductNo(rs.getLong("productno"));
					vo.setName(rs.getString("name"));
					vo.setPrice(rs.getLong("price"));
					vo.setImg(rs.getString("img"));
					vo.setQuantity(rs.getLong("quantity"));
//			         vo.setId(rs.getString("id"));
					
				}
				System.out.println("장바구니 리스트 성공");
			
		} catch (Exception e) {

			e.printStackTrace();
			throw new Exception("장바구니 리스트 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return vo;
	}// end of CartDAOImpl.list()
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
	public Integer orderDetail(CartVO vo) throws Exception {
		System.out.println("CartDAOImpl.orderDetail().vo:" + vo);

		int result = 0;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - order_detail 테이블에 데이터 삽입
			String sql = "INSERT INTO order_detail (order_detailno, productno, quantity, orderstatus, orderno)"
					+ " SELECT order_detail_seq.nextval, productno, quantity, ?, (select max(orderno) from ordertable where id = ?)"
					+ " FROM cart"
					+ " WHERE cartno IN ( ? ";
			for(int i = 1; i < vo.getbCartNoList().length; i++) {
					sql += " , ? ";
				}
				sql	+= " ) ";

			System.out.println("OrderDAOImpl.orderDetail().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int j = 1;
			pstmt.setString(j++, vo.getOrderStatus());
			System.out.println("==============="+vo.getOrderStatus());
			pstmt.setString(j++, vo.getId());
			System.out.println("==============="+vo.getId());
			
			pstmt.setLong(j++, Long.parseLong(vo.getbCartNoList()[0]));
			System.out.println("==============="+Long.parseLong(vo.getbCartNoList()[0]));
			
			for(int i = 1; i < vo.getbCartNoList().length; i++) {
				System.out.println("==============="+Long.parseLong(vo.getbCartNoList()[i]));
				System.out.println("====================="+(j+i-1));
			    pstmt.setLong(j+i-1, Long.parseLong(vo.getbCartNoList()[i]));
			}
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
	}// end of orderDatail
	
	public Integer order(CartVO vo) throws Exception {
		System.out.println("CartDAOImpl.order().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql- 상품명, 예약번호,구매일,id,pay,totalPrice,use
//			String sql = "INSERT INTO ordertable(ORDERNO,ORDERNAME,REVNO,ID,PAY,TOTALPRICE)"
//					+ "VALUES(order_seq.nextval,?,?,?,?,?)";
			//마일리지 사용 여부에 따른 sql
			String sql; 
			if (vo.getUse() > 0) {// 마일리지 사용
				int totalPriceAfterMileage = (int) (vo.getTotalPrice() - vo.getUse());
			    sql = "INSERT INTO ordertable(ORDERNO,ORDERNAME,REVNO,ID,PAY,TOTALPRICE,USE) VALUES(order_seq.nextval,?,?,?,?,?,?)";
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, vo.getName() +" 외 "+(vo.getQuantity()-1)+"개");
			    pstmt.setLong(2, vo.getRevNo());
			    pstmt.setString(3, vo.getId());
			    pstmt.setString(4, vo.getPay());
			    pstmt.setLong(5, totalPriceAfterMileage);
			    pstmt.setLong(6, vo.getUse());
			} else {// 마일리지 미사용
			    sql = "INSERT INTO ordertable(ORDERNO,ORDERNAME,REVNO,ID,PAY,TOTALPRICE) VALUES(order_seq.nextval,?,?,?,?,?)";
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, vo.getName() +" 외 "+(vo.getQuantity()-1)+"개");
			    pstmt.setLong(2, vo.getRevNo());
			    pstmt.setString(3, vo.getId());
			    pstmt.setString(4, vo.getPay());
			    pstmt.setLong(5, vo.getTotalPrice());
			}

			System.out.println("OrderDAOImpl.order().sql:" + sql);
		
			// 5. 실행
			result = pstmt.executeUpdate();
			
			// 6. 데이터 저장 및 표시
			System.out.println("CartDAOImpl.order()---주문 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("주문하기 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}//end of order
	
	public List<CartVO> searchRevNo(String str) throws Exception {
		System.out.println("CartDAOImpl.searchRevNo().vo:" + str);
		

		List<CartVO> list = null;
		CartVO vo = null;
		try {
			// 1.2. 드라이버 확인과 생성
			con = DB.getConnection();
			// 3. sql - order_detail 테이블에 데이터 삽입
			String sql = "select FLIGHTNO, STARTDATE, STARTSTATION, ENDDATE, ENDSTATION, REVNO from orderRev where id = ?";

			System.out.println("CartDAOImpl.searchRevNo().sql:" + sql);
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str);

			rs = pstmt.executeQuery();
			
				if (rs != null) {
					// rs의 그 다음 데이터가 있으면 처리가 하도록
					while (rs.next()) {
						// list가 null이면 한번만 생성
						if (list == null)
							list = new ArrayList<>();
						// 데이터를 담을 vo객체를 생성한다.
						vo = new CartVO();
						vo.setFlightNo(rs.getLong("FLIGHTNO"));
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
		
	}//end of searchRevNo
	public Integer cartDelete(CartVO vo) throws Exception {
	    System.out.println("CartDAOImpl.cartDelete()");
	    int result = 0;
	    try {
	        // 1.2 드라이버 확인
	        con = DB.getConnection();
	      
	        // 2. SQL 
	        String sql = "DELETE FROM cart WHERE cartno IN ( ? ";
	         for(int i=1; i<vo.getbCartNoList().length; i++) {
	        	 sql+=",?";
	         }
	         sql+=")";
	    
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			
			int j = 1;
		
			pstmt.setLong(j++, Long.parseLong(vo.getbCartNoList()[0]));
			System.out.println("==============="+Long.parseLong(vo.getbCartNoList()[0]));
			
			for(int i = 1; i < vo.getbCartNoList().length; i++) {
				System.out.println("==============="+Long.parseLong(vo.getbCartNoList()[i]));
				System.out.println("====================="+(j+i-1));
			    pstmt.setLong(j+i-1, Long.parseLong(vo.getbCartNoList()[i]));
			}
	        // 3. 실행
	        result = pstmt.executeUpdate();
	        // 4. 데이터 저장 및 표시
	        System.out.println("CartDAOImpl.cartDelete()---장바구니 결제 품목 삭제 완료");
	    } catch (Exception e) {
	        e.printStackTrace();// 개발자를 위한 코드
	        throw new Exception("장바구니삭제 DB처리 중 오류가 발생하였습니다.");
	    } finally {
	        // 5. 닫기
	        DB.close(con, pstmt);
	    }
	    return result;
	}


	
}
