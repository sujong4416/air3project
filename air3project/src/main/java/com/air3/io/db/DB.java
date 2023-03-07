package com.air3.io.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	
	// 접속 정보
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@192.168.0.16:1521:xe";
	private static final String ID = "team3";
	private static final String PW = "team3";

	
	// 드라이버 확인 변수
	private static boolean isCheckDriver = false;
	
	static { // static 초기화 블록
		
		try {
			// 드라이버를 찾는다. 있으면 static 요소를 로딩한다.
			Class.forName(DRIVER);
			isCheckDriver = true;
			System.out.println("DB.static 블록 - 드라이버 확인 성공...");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} // end of try catch
		
	} // end of static
	
	// DB.getConnection()
	public static Connection getConnection() throws Exception {
		// 드라이버가 존재하지 않으면 예외 발생
		if(!isCheckDriver) throw new Exception("오라클 드라이버가 존재하지 않습니다.");
		
		return DriverManager.getConnection(URL, ID, PW);
		
	} // end of getConnection()
	
	// 닫기
	public static void close(Connection con, PreparedStatement pstmt)  throws Exception{
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
		
	} // end of close (con, pstmt)

	// 닫기
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs)  throws Exception{
		close(con, pstmt);
		if(rs!=null) rs.close();
		
	} // end of close (con, pstmt, rs)
	
} // end of DB class
