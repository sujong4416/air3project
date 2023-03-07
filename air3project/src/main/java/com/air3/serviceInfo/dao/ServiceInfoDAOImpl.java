package com.air3.serviceInfo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.io.db.DB;
import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.webjjang.util.PageObject;




public class ServiceInfoDAOImpl implements ServiceInfoDAO{

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	@Override
	public List<ServiceInfoVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.list()");
		// 결과를 전달되는 변수
		List<ServiceInfoVO> list = null;
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			//  3-1 원본데이터 가져오기 
			String sql = "select isv.no, isv.title, isv.id, isv.fileName, "
					+ " to_char(isv.updateDate, 'yyyy-mm-dd') updateDate "
					+ " from info_service isv , member m ";
			sql += searchSQL(pageObject);
			
			if(sql.indexOf("where") != -1) sql += " and ";
			else sql += " where ";
			
			sql += " (m.id = isv.id) order by no desc";
			      
			//  3-2 순서 번호 붙이기
			sql= "select rownum rnum, no, title, updateDate, fileName"
					+ " from (" + sql + ")";
			// 3-3. 페이지 데이터 조건문 
			sql= "select no, title, updateDate, fileName from (" + sql + ") where rnum between ? and ?";
			System.out.println("ServiceInfoDAOImpl.list().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			// 검색에 대한 데이터 세팅
			idx = searchDataSet(pageObject, idx);
			pstmt.setLong(++idx, pageObject.getStartRow());
			pstmt.setLong(++idx, pageObject.getEndRow());
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			if(rs != null) {
				// rs에 다음 데이터가 있으면 처리
				while(rs.next()) {
					// list가 null 이면 한번만 생생
					if(list == null) list = new ArrayList<>();
					// 데이터를 담을 vo 객체를 생성한다.
					ServiceInfoVO vo = new ServiceInfoVO();
					// rs에 데이터를 꺼내서 vo에 담는다.
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setUpdateDate(rs.getString("updateDate"));
					vo.setFileName(rs.getString("fileName"));
					
					// 데이터가 담긴 vo를 list에 담는다.
					list.add(vo);
				}// end of while
			} // end of if
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 리스트 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		return list;
	} // end of list()
	
	private String searchSQL(PageObject pageObject) {
		
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if(word != null && !word.equals("")) {
			sql += " where (1=0 ";
			if(key.indexOf("t") >= 0) sql += " or title like ? ";
			if(key.indexOf("c") >= 0) sql += " or content like ? ";
			sql += " ) ";
		}
		return sql;
	}
	
	// 검색을 위한 데이터 세팅
	private int searchDataSet(PageObject pageObject, int idx) throws SQLException {
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if(word != null && !word.equals("")) {
			if(key.indexOf("t") >= 0) pstmt.setString(++idx, "%" + word + "%");
			if(key.indexOf("c") >= 0) pstmt.setString(++idx, "%" + word + "%");
			}
		return idx;
	}
	
	@Override
	public long getTotalRow(PageObject pageObject) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.getTotalRow().pageObject : " + pageObject);
		// 리턴 데이터 선언
		long totalRow = 0;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "select count(*) from info_service";
			sql += searchSQL(pageObject);
			System.out.println("ServiceInfoDAOImpl.getTotalRow().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			idx = searchDataSet(pageObject, idx);
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			if(rs != null && rs.next()) {
				// rs에 다음 데이터가 있으면 처리
				totalRow = rs.getLong(1);
			} // end of if
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 리스트를 위한 전체 데이터 개수 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		
		return totalRow;
	}
	
	@Override
	public ServiceInfoVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.view().no : " + no);
		// 리턴 데이터 선언
		ServiceInfoVO vo = null;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "select no, title, content, fileName, id, to_char(updateDate, 'yyyy-mm-dd') updateDate"
					+ " from info_service"
					+ " where no = ? ";
			System.out.println("ServiceInfoDAOImpl.view().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			if(rs != null && rs.next()) {
				// rs에 다음 데이터가 있으면 처리
				vo = new ServiceInfoVO();
				// rs에 데이터를 꺼내서 vo에 담는다.
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setId(rs.getString("id"));
				vo.setUpdateDate(rs.getString("updateDate"));
				vo.setFileName(rs.getString("fileName"));
			} // end of if
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 글보기 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		
		return vo;
	}

	

	@Override
	public int write(ServiceInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.write().vo : " + vo);
		int result = 0;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "insert into info_service(no, title, content, id, fileName) "
					+ " values(info_service_seq.nextval, ?, ?, ?, ?)";
			System.out.println("ServiceInfoDAOImpl.write().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getFileName());
		
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			System.out.println("ServiceInfoDAOImpl.write() - 글등록 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 글등록 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	@Override
	public int update(ServiceInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.update().vo : " + vo);
		int result = 0;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "update info_service set title = ?, content=? "
					+ " where no = ?";
			System.out.println("ServiceInfoDAOImpl.update().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setLong(3, vo.getNo());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			System.out.println("ServiceInfoDAOImpl.update() - 글수정 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 글수정 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	public int updateImage(ServiceInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceInfoDAOImpl.updateimage().vo : " + vo);
		int result = 0;
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "update info_service set fileName = ?"
					+ " where no = ?";
			System.out.println("ServiceInfoDAOImpl.update().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getFileName());
			pstmt.setLong(2, vo.getNo());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			System.out.println("ServiceInfoDAOImpl.update() - 사진변경 완료");
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
	public int delete(long no) throws Exception {
		System.out.println("ServiceInfoDAOImpl.delete().vo : " + no);
		// TODO Auto-generated method stub
		int result = 0;
		
		
		try {
			// 1. 확인 2. 연결
			con = DB.getConnection();
			// 3. sql
			String sql = "delete from info_service "
					+ " where no = ?";
			System.out.println("ServiceInfoDAOImpl.delete().sql : " + sql);
			// 4. 실행객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			
			pstmt.setLong(1, no);
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 - list
			// rs가 null 이 아니면 처리하자
			System.out.println("ServiceInfoDAOImpl.update() - 글삭제 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("게시판 글삭제 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	

} // end of ServiceInfoDAOImpl class



