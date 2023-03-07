package com.air3.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.io.db.DB;
import com.air3.product.vo.ProductVO;
import com.webjjang.util.PageObject;

public class ProductDAOImpl implements ProductDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	@Override
	public List<ProductVO> list(PageObject pageObject) throws Exception {
		System.out.println("ProductDAOImpl.list()");
		List<ProductVO> list = null;
		try {
			// 1.2 드라이버 확인 및 생성
			con = DB.getConnection();
			// 3.sql
			String sql = "select productno,name,description,price,stock,img from product ";
			sql += searchSQL(pageObject);
			sql += " order by productno desc";

			// 3 순서번호 붙이기
			sql = "select rownum rnum,productno,name,description,price,stock,img " + " from (" + sql + ")";
			// 3 페이지 데이터 조거문 붙이기
			sql = " select productno,name,description,price,stock,img " + " from (" + sql + ") where rnum between ? and ?";
			System.out.println("3.ProductDAOImpl.list().sql" + sql);

			// 4.실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			// 검색에 대한 데이터 세팅
			idx = searchDataSet(pageObject, idx);
			pstmt.setLong(++idx, pageObject.getStartRow());
			pstmt.setLong(++idx, pageObject.getEndRow());
			// 5. 실행 >> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 세팅
			if (rs != null) {
				// rs의 그 다음 데이터가 있으면 처리가 하도록
				while (rs.next()) {
					// list가 null이면 한번만 생성
					if (list == null)
						list = new ArrayList<>();
					// 데이터를 담을 vo객체를 생성한다.
					// 필요한 경우에는 생성을 해서 작성을 한다.
					ProductVO vo = new ProductVO();
					// rs의 데이터를 꺼내서 vo에 담는다.
					vo.setProductno(rs.getLong("productno"));
					vo.setName(rs.getString("name"));
					vo.setDescription(rs.getString("description"));
					vo.setPrice(rs.getLong("price"));
					vo.setStock(rs.getLong("stock"));
					vo.setImg(rs.getString("img"));

					// 데이터가 담긴 vo를 list에 담는다.
					list.add(vo);
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
			throw new Exception("상품 리스트 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return list;
	}// end of ProductDAOImpl.list()

	// 검색을 위한 sql 추가 작성
	private String searchSQL(PageObject pageObject) {
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			sql += " where (1=0 ";
			if (key.indexOf("t") >= 0)
				sql += " or name like ?";
			if (key.indexOf("c") >= 0)
				sql += " or description like ?";
			sql += ") ";
		}
		return sql;
	}// end of searchSQL
		// 검색을 위한 데이터 세팅

	private int searchDataSet(PageObject pageObject, int idx) throws SQLException {
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if (word != null && !word.equals("")) {
			if (key.indexOf("t") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
			if (key.indexOf("c") >= 0)
				pstmt.setString(++idx, "%" + word + "%");
		}
		return idx;
	}

	@Override
	public long getTotalRow(PageObject pageObject) throws Exception {
		System.out.println("ProductDAOImpl.getTotalRow().PageObject");
		long totalRow = 0;

		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "select count(*)from product";
			sql += searchSQL(pageObject);
			System.out.println("ProductDAOImpl.getTotalRow().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			idx = searchDataSet(pageObject, idx);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 데이터 저장 및 표시
			if (rs != null && rs.next()) {
				// 첫번째 데이터를 꺼내오자.
				totalRow = rs.getLong(1);

			}
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품 리스트를 위한 전체 데이터 개수 DB처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return totalRow;
	}// end of getTotalRow

	@Override
	public ProductVO view(long productno) throws Exception {
		System.out.println("ProductDAOImpl.view()");
		ProductVO vo = null;
		try {
			// 1.2 드라이버 확인 및 생성
			con = DB.getConnection();
			// 3.sql
			String sql = "select productno,name,description,price,stock,img "
					+ " from product where productno =?";
			System.out.println("3.ProductDAOImpl.view().sql" + sql);

			// 4.실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, productno);
			// 5. 실행 >> rs
			rs = pstmt.executeQuery();
			// 6. 데이터 세팅
			if (rs != null && rs.next()) {
				vo = new ProductVO();
				// rs의 데이터를 꺼내서 vo에 담는다.
				vo.setProductno(rs.getLong("productno"));
				vo.setName(rs.getString("name"));
				vo.setDescription(rs.getString("description"));
				vo.setPrice(rs.getLong("price"));
				vo.setStock(rs.getLong("stock"));
				vo.setImg(rs.getString("img"));
			}

		} catch (Exception e) {

			e.printStackTrace();
			throw new Exception("상품 보기 DB 처리 중 오류 발생 ");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}
		return vo;
	}// end of view

	@Override
	public Integer write(ProductVO vo) throws Exception {
		System.out.println("ProductDAOImpl.write().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "insert into product (productno,name,description,price,stock,img) "
					+ " values(product_seq.nextval,?,?,?,?,?)";
			System.out.println("BoardDAOImpl.write().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getDescription());
			pstmt.setLong(3, vo.getPrice());
			pstmt.setLong(4, vo.getStock());
			pstmt.setString(5, vo.getImg());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.write()---상품등록 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품 등록 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}// end of write

	@Override
	public Integer updateImage(ProductVO vo) throws Exception {
		System.out.println("ProductDAOImpl.updateImage().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "update product set img = ? where productno =?";
			System.out.println("ProductDAOImpl.updateImage().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getImg());
			pstmt.setLong(2, vo.getProductno());

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

	}//end of updateImage

	@Override
	public Integer update(ProductVO vo) throws Exception {
		System.out.println("ProductDAOImpl.update().vo" + vo);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "update product set name=?,description=?,price=?,stock=?"
					+ " where productno=? ";
			System.out.println("ProductDAOImpl.update().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getDescription());
			pstmt.setLong(3, vo.getPrice());
			pstmt.setLong(4, vo.getStock());
			pstmt.setLong(5, vo.getProductno());

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.update()---상품 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품수정 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}//end of update

	@Override
	public Integer delete(long productno) throws Exception {
		System.out.println("ProductDAOImpl.delete().no" + productno);
		int result = 0;
		try {
			// 1.2 드라이버 확인
			con = DB.getConnection();
			// 3. sql
			String sql = "delete from product where productno=?";
			System.out.println("ProductDAOImpl.delete().sql:" + sql);
			// 4. 실행객체 생성 및 데이터
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, productno);

			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 저장 및 표시
			System.out.println("ProductDAOImpl.update()---상품 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();// 개발자를 위한 코드
			throw new Exception("상품삭제 DB처리 중 오류가 발생하였습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		return result;

	}//end of delete

}
