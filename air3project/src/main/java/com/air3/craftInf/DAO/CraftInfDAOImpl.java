package com.air3.craftInf.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.air3.craftInf.VO.CraftInfVO;
import com.air3.flightInf.VO.FlightInfVO;
import com.air3.io.db.DB;





public class CraftInfDAOImpl implements CraftInfDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	@Override
	public List<CraftInfVO> voingList() throws Exception {
		System.out.println("CraftInfDAOImpl.voingList()-----------------------");
		List<CraftInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
			
			String sql = "SELECT CNO, CNAME FROM CRAFTINF WHERE cDIV = 1";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while(rs.next()) {
					// list가 null 이면 한번만 생생
					if(list == null) list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					CraftInfVO vo = new CraftInfVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					vo.setcNo(rs.getLong("CNO"));
					vo.setcName(rs.getString("CNAME"));
					// 데이터가 담긴 vo를 list에 담는다.
					
					list.add(vo);
				}// end of while
			} // end of if
			System.out.println("dao.voingLust " + list);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	@Override
	public List<CraftInfVO> airbusList() throws Exception {
		System.out.println("CraftInfDAOImpl.voingList()-----------------------");
		List<CraftInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
			
			String sql = "SELECT CNO, CNAME FROM CRAFTINF WHERE cDIV = 2";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while(rs.next()) {
					// list가 null 이면 한번만 생생
					if(list == null) list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					CraftInfVO vo = new CraftInfVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					vo.setcNo(rs.getLong("CNO"));
					vo.setcName(rs.getString("CNAME"));
					// 데이터가 담긴 vo를 list에 담는다.
					
					list.add(vo);
				}// end of while
			} // end of if
			
			System.out.println("dao.airbusList " + list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	@Override
	public CraftInfVO view(long no) throws Exception {
		System.out.println("CraftDAOImpl.view().no : " + no);
		// 리턴 데이터 선언
		CraftInfVO vo = null;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "select cno, cname, cimg, cchairimg, cdistance, cspeed, cchairn from craftInf where cno = ? ";
			System.out.println("CraftDAOImpl.view().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			
			if(rs != null && rs.next()) {
				// rs에 다음 데이터가 있으면 처리
				vo = new CraftInfVO();
				
				vo.setcNo(rs.getLong("cno"));
				vo.setcName(rs.getString("cname"));
				vo.setcChairImg(rs.getString("cchairimg"));
				vo.setcImg(rs.getString("cimg"));
				vo.setcDistance(rs.getLong("cdistance"));
				vo.setcSpeed(rs.getLong("cspeed"));
				vo.setcChairN(rs.getLong("cchairn"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("이미지 글보기 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		
		return vo;
	}
	@Override
	public int write(CraftInfVO vo) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("CraftInfDAOImpl.write().vo : " + vo);
				int result = 0;
				
				try {
					// 1. 확인 2. 연결
					con = DB.getConnection();
					// 3. sql
					String sql = "insert into craftInf(cno,cname,cimg,cchairimg,cdistance,cspeed,cchairrown,cdiv,cchairn,cchairlinen)"
							+ "values(craftInf_seq.nextval,?,?,?,?,?,?,?,?,?)";
					System.out.println("CraftInfDAOImpl.write().sql : " + sql);
					
					pstmt = con.prepareStatement(sql);
					// 4. 실행객체 & 데이터 세팅
					pstmt.setString(1, vo.getcName());
					pstmt.setString(2, vo.getcImg());
					pstmt.setString(3, vo.getcChairImg());
					pstmt.setLong(4, vo.getcDistance());
					pstmt.setLong(5, vo.getcSpeed());
					pstmt.setLong(6, vo.getcChairRowN());
					pstmt.setLong(7, vo.getcDiv());
					pstmt.setLong(8, vo.getcChairN());
					pstmt.setString(9, vo.getcChairLineN());
					
					// 5. 실행 -> rs
					result = pstmt.executeUpdate();
					// 6. 데이터 저장 - list
					// rs가 null 이 아니면 처리하자
					System.out.println("ImageDAOImpl.write() - 이미지 등록 완료");
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace(); // 개발자를 위한 코드
					throw new Exception("이미지 등록 DB 처리 중 오류 발생");
				} finally {
					// 7. 닫기
					DB.close(con, pstmt);
				} // end of try ~ catch ~ finally
				
				
				return result;
	}
	@Override
	public int delete(long no) throws Exception {
		System.out.println("ImageDAOImpl.delete().no : " + no);
		int result = 0;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "delete from craftInf where cno = ?";
			System.out.println("ImageDAOImpl.delete().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			System.out.println("ImageDAOImpl.delete() - 글삭제 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("이미지 글삭제 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}
	@Override
	public int update(CraftInfVO vo) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("ImageDAOImpl.update().vo : " + vo);
				int result = 0;
				
				try {
					// 1. 확인 2. 연결
					con = DB.getConnection();
					// 3. sql
					String sql = "update craftInf set cname = ? ,cdistance = ?, "
							+ " cspeed = ? , cchairrown = ? , cdiv = ? , cchairn = ? , cchairlinen = ? "
							+ " where cno = ? ";
					System.out.println("ImageDAOImpl.update().sql : " + sql);
					// 4. 실행객체 & 데이터 세팅
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,vo.getcName());
					pstmt.setLong(2,vo.getcDistance());
					pstmt.setLong(3,vo.getcSpeed());
					pstmt.setLong(4,vo.getcChairRowN());
					pstmt.setLong(5,vo.getcDiv());
					pstmt.setLong(6,vo.getcChairN());
					pstmt.setString(7,vo.getcChairLineN());
					pstmt.setLong(8,vo.getcNo());
					// 5. 실행 -> rs
					result = pstmt.executeUpdate();
					// 6. 데이터 저장 - list
					// rs가 null 이 아니면 처리하자
					System.out.println("ImageDAOImpl.update() - 글수정 완료");
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace(); // 개발자를 위한 코드
					throw new Exception("이미지 글수정 DB 처리 중 오류 발생");
				} finally {
					// 7. 닫기
					DB.close(con, pstmt);
				} // end of try ~ catch ~ finally
				
				
				return result;
	}
	@Override
	public int updateImage(CraftInfVO vo) throws Exception {
		System.out.println("CraftInfDAOImpl.updateImage().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "update craftinf set cchairImg = ? where cno =?";
			System.out.println("ProductDAOImpl.updateImage().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getcChairImg());
			pstmt.setLong(2, vo.getcNo());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.updateImage()---이미지바꾸기 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품 이미지 바꾸기 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}
	
	public int updateImage2(CraftInfVO vo) throws Exception {
		System.out.println("CraftInfDAOImpl.updateImage().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "update craftinf set cImg = ? where cno =?";
			System.out.println("ProductDAOImpl.updateImage().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getcImg());
			pstmt.setLong(2, vo.getcNo());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.updateImage()---이미지바꾸기 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품 이미지 바꾸기 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;
	}
	
	
	
}//class
	