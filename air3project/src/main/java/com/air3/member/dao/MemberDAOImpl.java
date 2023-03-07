package com.air3.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.io.db.DB;
import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public class MemberDAOImpl extends DB implements MemberDAO{

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 로그인
	@Override
	public LoginVO login(LoginVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.login()..........");
		
		// 결과를 전달하는 변수
		LoginVO vo = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = "select m.id, m.name, m.e_name, m.gradeNo, g.gradeName, m.mileage "
					+ " from member m, grade g "
					+ " where (id = ? and pw = ?) and (m.gradeNo = g.gradeNo) and not m.status in ('탈퇴')";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			pstmt.setString(2, inVO.getPw());
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null && rs.next()) { // rs가 null이 아니고 rs에 다음 데이터가 있으면 처리
				
				// 데이터를 담을 vo 객체를 생성
				vo = new LoginVO();
				
				// rs의 데이터를 vo 객체에 담는다.
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setEname(rs.getString("e_name"));
				vo.setGradeNo(rs.getInt("gradeNo"));
				vo.setGradeName(rs.getString("gradeName"));
				vo.setMileage(rs.getInt("mileage"));
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("로그인 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return vo;
		
	} // end of login()


	// 회원리스트
	@Override
	public List<MemberVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.list()..........");
		
		// 결과를 전달하는 변수
		List<MemberVO> list = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select m.id, m.name, to_char(m.birth, 'yyyy-mm-dd') birth, "
					+ " m.gender, m.tel, m.gradeNo, g.gradeName, m.status "
					+ " from member m, grade g ";
			
			sql += searchSQL(pageObject);
					
			if(sql.indexOf("where") == -1) sql += " where not m.status in ('탈퇴') ";
			else sql += " and not m.status in ('탈퇴') ";
			
			sql += " and (g.gradeNo = m.gradeNo) "
					+ " order by id asc ";
			
			sql = " select rownum rnum, id, name, birth, "
					+ " gender, tel, gradeNo, gradeName, status "
					+ " from ( " +sql+" ) ";
			
			sql = " select id, name, birth, "
					+ " gender, tel, gradeNo, gradeName, status "
					+ " from ( " +sql+" ) "
					+ " where rnum between ? and ? ";
			
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			int idx = 1;
			idx = searchDataSet(pageObject, idx);
			
			pstmt.setLong(idx++, pageObject.getStartRow());
			pstmt.setLong(idx, pageObject.getEndRow());
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null ) { // rs가 null이 아니면 처리
				
				while(rs.next()) { // rs.next 가 있으면 반복처리
					
					// 한번만 생성
					if(list == null) list = new ArrayList<>(); 
					
					// 데이터를 담을 vo 객체를 생성
					MemberVO vo = new MemberVO();
					
					// rs의 데이터를 vo 객체에 담는다.
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setBirth(rs.getString("birth"));
					vo.setGender(rs.getString("gender"));
					vo.setTel(rs.getString("tel"));
					vo.setGradeNo(rs.getInt("gradeNo"));
					vo.setGradeName(rs.getString("gradeName"));
					vo.setStatus(rs.getString("status"));
					
					list.add(vo);
					
				} // end of while
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원리스트 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return list;
		
	} // end of list()

	// 검색을 위한 sql 작성 메서드
	private String searchSQL(PageObject pageObject) {
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		
		if(word != null && !(word.equals(""))) {
			
			sql += " where (1=0 ";
			
			if(key.indexOf("i") >= 0) sql += " or id like ? ";
			if(key.indexOf("n") >= 0) sql += " or name like ? ";
			if(key.indexOf("t") >= 0) sql += " or tel like ? ";
			
			sql += " ) ";
			
		} // end of if
		
		return sql;
		
	} // end of searchSQL()
	
	// 검색을 위한 데이터 세팅
	private int searchDataSet(PageObject pageObject, int idx) throws SQLException {
		
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		
		if(word != null && !(word.equals(""))) {
			
			if(key.indexOf("i") >= 0) pstmt.setString(idx++, "%"+word+"%");
			if(key.indexOf("n") >= 0) pstmt.setString(idx++, "%"+word+"%");
			if(key.indexOf("t") >= 0) pstmt.setString(idx++, "%"+word+"%");
			
		} // end of if
		
		return idx;
		
	} // end of searchDataSet
		
	@Override
	public long getTotalRow(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.getTotalRow().pageObject : "+pageObject);
		
		// 결과를 전달하는 변수
		long totalRow = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select count(*) from member";
			
			sql += searchSQL(pageObject);
			
			if(sql.indexOf("where") == -1) sql += " where ";
			else sql += " and ";
			
			sql += " status = '정상' or status ='휴면' ";
			 
			System.out.println("MemberDAOImpl.getTotalRow().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			searchDataSet(pageObject, 1);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null | rs.next()) { // rs가 null이 아니고 rs에 다음 데이터가 있으면 처리
				
				totalRow = rs.getLong(1);
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원 리스트를 위한 전체 데이터 개수 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		System.out.println("totalRow - "+totalRow);
		
		return totalRow;
		
	} // end of getTotalRow()
	

	// 회원등급변경
	@Override
	public int updateGrade(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.updateGrade()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set gradeNo=? where id=? and not status in ('탈퇴')";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inVO.getGradeNo());
			pstmt.setString(2, inVO.getId());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원 등급변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
	} // end of updateGrade()


	// 회원정보보기
	@Override
	public MemberVO view(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.view()..........");
		
		// 결과를 전달하는 변수
		MemberVO vo = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select name, e_name, id, gender, to_char(birth, 'yyyy-mm-dd') birth, email, tel, country, "
					+ " p_nationality, p_country, p_no, to_char(p_date, 'yyyy-mm-dd') p_date "
					+ " from member "
					+ " where id = ? ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null && rs.next() ) { // rs가 null이 아니고 rs.next 가 있으면 처리
				
				vo = new MemberVO();
				
				vo.setName(rs.getString("name"));
				vo.setE_name(rs.getString("e_name"));
				vo.setId(rs.getString("id"));
				vo.setGender(rs.getString("gender"));
				vo.setBirth(rs.getString("birth"));
				
				String email = rs.getString("email");
				
				vo.setEmail1(email.substring(0, email.indexOf("@")));
				vo.setEmail2(email.substring(email.indexOf("@")+1));
				
				vo.setTel(rs.getString("tel"));
				vo.setCountry(rs.getString("country"));
				vo.setP_nationality(rs.getString("p_nationality"));
				vo.setP_country(rs.getString("p_country"));
				vo.setP_no(rs.getString("p_no"));
				vo.setP_date(rs.getString("p_date"));
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원정보 보기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return vo;
		
	} // end of view()


	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.findId()..........");
		
		// 결과를 전달하는 변수
		MemberVO vo = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select id, regdate from member "
					+ " where name=? and email=? and birth=? and not status in ('탈퇴') ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getName());
			pstmt.setString(2, inVO.getEmail());
			pstmt.setString(3, inVO.getBirth());
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null && rs.next() ) { // rs가 null이 아니고 rs.next 가 있으면 처리
				
				vo = new MemberVO();
				
				vo.setId(rs.getString("id"));
				vo.setRegDate(rs.getString("regdate"));
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("아이디찾기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return vo;
		
	} // end of findId()


	// 비밀번호 찾기
	@Override
	public String findPw(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.findPw()..........");
		
		// 결과를 전달하는 변수
		String pw = null;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select pw from member "
					+ " where id=? and name=? and birth=? and not status in ('탈퇴') ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			pstmt.setString(2, inVO.getName());
			pstmt.setString(3, inVO.getBirth());
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 6. 데이터 저장 -> list에 저장
			if(rs != null && rs.next() ) { // rs가 null이 아니고 rs.next 가 있으면 처리
				
				pw = rs.getString("pw");
				
			} // end of if
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("비밀번호찾기 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return pw;
		
	} // end of findPw()


	
	// 임시비밀번호로 변경
	@Override
	public int changePw(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.changePw()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set pw=? where id=? and not status in ('탈퇴')";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getPw());
			pstmt.setString(2, inVO.getId());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("임시비밀번호 변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of findPw()
	
	
	// 회원가입
	@Override
	public int signUp(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.signUp()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " insert into member(id, pw, name, e_name, gender,"
					+ " birth, tel, email, country, p_nationality, "
					+ " p_country, p_no, p_date) "
					+ " values(?, ?, ?, ?, ?, "
					+ " ?, ?, ?, ?, ?, ?, ?, ?) ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			pstmt.setString(2, inVO.getPw());
			pstmt.setString(3, inVO.getName());
			pstmt.setString(4, inVO.getE_name());
			pstmt.setString(5, inVO.getGender());
			pstmt.setString(6, inVO.getBirth());
			pstmt.setString(7, inVO.getTel());
			pstmt.setString(8, inVO.getEmail());
			pstmt.setString(9, inVO.getCountry());
			pstmt.setString(10, inVO.getP_nationality());
			pstmt.setString(11, inVO.getP_country());
			pstmt.setString(12, inVO.getP_no());
			pstmt.setString(13, inVO.getP_date());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원가입 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of signUp()


	// 아이디 검색 - 중복확인
	@Override
	public int searchId(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.searchId().id - "+id);
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " select id from member where id = ? ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 5. 실행 -> rs
			rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) { // rs가 null이 아니고 rs에 다음 데이터가 있으면 처리
				
				result= 1;
				
			} // end of if
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("아이디 중복확인 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt, rs);
			
		} // end of try catch finally
		
		return result;
		
	} // end of searchId()

	
	// 회원정보 변경
	@Override
	public int updateMember(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.updateMember()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set birth =? , gender =?, email =?, "
					+ " tel =? where id=? and not status in ('탈퇴') ";
			System.out.println("MemberDAOImpl.updateMember().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getBirth());
			pstmt.setString(2, inVO.getGender());
			pstmt.setString(3, inVO.getEmail());
			pstmt.setString(4, inVO.getTel());
			pstmt.setString(5, inVO.getId());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원정보 변경(관리자) DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of update()
	

	// 회원정보 변경
	@Override
	public int update(MemberVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.update()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set birth =? , gender =?, email =?, "
					+ " tel =?, country=?, p_nationality=? , p_country =?, "
					+ " p_no=?, p_date =? where id=? and pw=? and not status in ('탈퇴') ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getBirth());
			pstmt.setString(2, inVO.getGender());
			pstmt.setString(3, inVO.getEmail());
			pstmt.setString(4, inVO.getTel());
			pstmt.setString(5, inVO.getCountry());
			pstmt.setString(6, inVO.getP_nationality());
			pstmt.setString(7, inVO.getP_country());
			pstmt.setString(8, inVO.getP_no());
			pstmt.setString(9, inVO.getP_date());
			pstmt.setString(10, inVO.getId());
			pstmt.setString(11, inVO.getPw());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원정보 변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of update()


	// 비밀번호 변경
	@Override
	public int updatePw(MemberVO inVO, String chgPw) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.changePw()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			String sql = " update member set pw=? where id=? and pw=? and not status in ('탈퇴') ";
			System.out.println("MemberDAOImpl.login().sql : "+sql);
			
			// 4. 실행객체 생성 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, chgPw);
			pstmt.setString(2, inVO.getId());
			pstmt.setString(3, inVO.getPw());
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("비밀번호 변경 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
		
	} // end of updatePw


	// 회원탈퇴
	@Override
	public int delete(LoginVO inVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberDAOImpl.delete()..........");
		
		// 결과를 전달하는 변수
		int result = 0;
		
		try {
			
			// 1.드라이버 확인 2.연결
			con = DB.getConnection();
			
			// 3. sql 작성
			if(inVO.getGradeNo()==1) { // 회원이 직접 탈퇴
				String sql = " update member set status='탈퇴' where id = ? and pw = ? ";
				System.out.println("MemberDAOImpl.login().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, inVO.getId());
				pstmt.setString(2, inVO.getPw());
				
			} else { // 관리자가 탈퇴 처리
				
				String sql = " update member set status='탈퇴' where id = ? ";
				System.out.println("MemberDAOImpl.login().sql : "+sql);
				
				// 4. 실행객체 생성 & 데이터 세팅
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, inVO.getId());
			} // end of if else
			
			// 5. 실행 -> rs
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 개발자를 위한 코드
			throw new Exception("회원탈퇴 DB 처리중 오류가 발생했습니다.");
			
		} finally {
			
			// 7. 닫기
			DB.close(con, pstmt);
			
		} // end of try catch finally
		
		return result;
	} // end of delete()

} // end of MemberDAOImpl class
