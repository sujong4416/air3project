package com.air3.flightInf.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.air3.flightInf.VO.FlightInfVO;
import com.air3.io.db.DB;
import com.webjjang.util.PageObject;




public class FlightInfDAOImpl implements FlightInfDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public List<FlightInfVO> list(FlightInfVO vo) throws Exception {
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<FlightInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
			if(vo.getStartStation() != ""&&vo.getEndStation() == ""&&vo.getStartDate() == ""){
			String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
					+ " where startstation = ? ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getStartStation());
			rs = pstmt.executeQuery();
			}else if(vo.getStartStation() != ""&&vo.getEndStation() != ""&&vo.getStartDate() == "") {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? and endstation = ? ";
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, vo.getEndStation());
				rs = pstmt.executeQuery();
			
			}else if(vo.getStartStation() != null&&vo.getEndStation() == ""&&vo.getStartDate() != "") {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? and startdate LIKE ? ";
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, "%"+vo.getStartDate()+"%");
				rs = pstmt.executeQuery();
			}else {
				String sql = "select cno, cname, startcon, startstation, endcon, endstation, startdate, enddate, price from result "
						+ " where startstation = ? and startdate LIKE ?  and endStation = ? ";
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getStartStation());
				pstmt.setString(2, "%"+vo.getStartDate()+"%");
				pstmt.setString(3, vo.getEndStation());
				rs = pstmt.executeQuery();
			}
			if(rs != null) {
				// rs??? ?????? ???????????? ????????? ??????
				while(rs.next()) {
					// list??? null ?????? ????????? ??????
					if(list == null) list = new ArrayList<>();
					// ???????????? ?????? vo ????????? ????????????.
					FlightInfVO cVo = new FlightInfVO();
					// rs??? ???????????? ????????? vo??? ?????????.
					cVo.setcNo(rs.getLong("cno"));
					cVo.setcName(rs.getString("cname"));
					cVo.setStartCon(rs.getString("startcon"));
					cVo.setStartStation(rs.getString("startstation"));
					cVo.setEndCon(rs.getString("endcon"));
					cVo.setEndStation(rs.getString("endstation"));
					cVo.setStartDate(rs.getString("startdate"));
					cVo.setEndDate(rs.getString("enddate"));
					cVo.setPrice(rs.getLong("price"));
					// ???????????? ?????? vo??? list??? ?????????.
					
					list.add(cVo);
				}// end of while
			} // end of if
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}//list

	@Override
	public List<FlightInfVO> Flist(PageObject pageObject) throws Exception {
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<FlightInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
		
			String sql = "select flightno, cno, startstation, endstation, startdate, enddate, price from flightinf ";
			
			sql += searchSQL(pageObject);
			sql += "order by flightno desc";
			sql = "select rownum rnum, flightno, cno, startstation, endstation, startdate,enddate, price from (" + sql + ")";
					
			sql = "select flightno, cno, startstation, endstation, startdate, enddate, price from (" + sql + ") where rnum between ? and ? ";
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			// ????????? ?????? ????????? ??????
			idx = searchDataSet(pageObject, idx);
			pstmt.setLong(++idx, pageObject.getStartRow());
			pstmt.setLong(++idx, pageObject.getEndRow());
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				// rs??? ?????? ???????????? ????????? ??????
				while(rs.next()) {
					// list??? null ?????? ????????? ??????
					if(list == null) list = new ArrayList<>();
					// ???????????? ?????? vo ????????? ????????????.
					FlightInfVO Vo = new FlightInfVO();
					// rs??? ???????????? ????????? vo??? ?????????.
					Vo.setFlightNo(rs.getLong("flightno"));
					Vo.setcNo(rs.getLong("cno"));
					Vo.setStartStation(rs.getString("startstation"));
					Vo.setEndStation(rs.getString("endstation"));
					Vo.setStartDate(rs.getString("startdate"));
					Vo.setEndDate(rs.getString("enddate"));
					Vo.setPrice(rs.getLong("price"));
					// ???????????? ?????? vo??? list??? ?????????.
					
					list.add(Vo);
				}// end of while
			} // end of if
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	
	
	
	private String searchSQL(PageObject pageObject) {
		String sql = "";
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if(word != null && !word.equals("")) {
			sql += " where (1=0 ";
			if(key.indexOf("n") >= 0) sql += " or flightno like ? ";
			if(key.indexOf("s") >= 0) sql += " or startstation like ? ";
			if(key.indexOf("e") >= 0) sql += " or endstation like ? ";
			sql += ") ";
		}
		return sql;
	}
	
	// ????????? ?????? ????????? ??????
	private int searchDataSet(PageObject pageObject, int idx) throws SQLException {
		String word = pageObject.getWord();
		String key = pageObject.getKey();
		if(word != null && !word.equals("")) {
			if(key.indexOf("n") >= 0) pstmt.setString(++idx, "%" + word + "%");
			if(key.indexOf("s") >= 0) pstmt.setString(++idx, "%" + word + "%");
			if(key.indexOf("e") >= 0) pstmt.setString(++idx, "%" + word + "%");
		}
		return idx;
	}

	@Override
	public int write(FlightInfVO vo) throws Exception {
		System.out.println("BoardDAOImpl.write() : ");
		int result = 0;
		
		try {
			// 1. ?????? 2. ??????
			con = DB.getConnection();
			// 3. sql
			String sql = "INSERT INTO FLIGHTINF(FLIGHTNO, CNO, STARTSTATION, ENDSTATION, STARTDATE, ENDDATE,PRICE)"
					+ "VALUES(FLIGHTINF_SEQ.NEXTVAL,?,?,?,?,?,?)";
			System.out.println("BoardDAOImpl.write().sql : " + sql);
			// 4. ???????????? & ????????? ??????
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, vo.getcNo());
			pstmt.setString(2, vo.getStartStation());
			pstmt.setString(3, vo.getEndStation());
			pstmt.setString(4, vo.getStartDate());
			pstmt.setString(5, vo.getEndDate());
			pstmt.setLong(6, vo.getPrice());
			
			// 5. ?????? -> rs
			result = pstmt.executeUpdate();
			// 6. ????????? ?????? - list
			// rs??? null ??? ????????? ????????????
			System.out.println("BoardDAOImpl.write() - ????????? ??????");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // ???????????? ?????? ??????
			throw new Exception("????????? ????????? DB ?????? ??? ?????? ??????");
		} finally {
			// 7. ??????
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	@Override
	public FlightInfVO view(long no) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("FlightInfDAOImpl.view().no : " + no);
				// ?????? ????????? ??????
				FlightInfVO vo = null;
				
				try {
					// 1. ?????? 2. ??????
					con = DB.getConnection();
					// 3. sql
					String sql = "select flightNo, startDate, endDate, price, cno, endStation, startStation FROM FLIGHTiNF WHERE FLIGHTNO = ?  ";
					System.out.println("BoardDAOImpl.view().sql : " + sql);
					// 4. ???????????? & ????????? ??????
					pstmt = con.prepareStatement(sql);
					pstmt.setLong(1, no);
					// 5. ?????? -> rs
					rs = pstmt.executeQuery();
					// 6. ????????? ?????? - list
					// rs??? null ??? ????????? ????????????
					if(rs != null && rs.next()) {
						// rs??? ?????? ???????????? ????????? ??????
						vo = new FlightInfVO();
						// rs??? ???????????? ????????? vo??? ?????????.
						vo.setFlightNo(rs.getLong("flightNo"));
						vo.setStartDate(rs.getString("startDate"));
						vo.setEndDate(rs.getString("endDate"));
						vo.setEndStation(rs.getString("endStation"));
						vo.setStartStation(rs.getString("startStation"));
						vo.setPrice(rs.getLong("price"));
						vo.setCNo(rs.getLong("cno"));
					} // end of if
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace(); // ???????????? ?????? ??????
					throw new Exception("??????????????? DB ?????? ??? ?????? ??????");
				} finally {
					// 7. ??????
					DB.close(con, pstmt, rs);
				} // end of try ~ catch ~ finally
				
				
				return vo;
	}

	@Override
	public int update(FlightInfVO vo) throws Exception {
		System.out.println("FlightDAOImpl.update().vo : " + vo);
		int result = 0;
		
		try {
			// 1. ?????? 2. ??????
			con = DB.getConnection();
			// 3. sql
			String sql = "update flightInf set cno = ?,  startStation= ?, endStation= ?, startDate= ?, "
						+ "endDate = ?,price= ? where flightNo= ? ";
			System.out.println("BoardDAOImpl.update().sql : " + sql);
			// 4. ???????????? & ????????? ??????
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, vo.getCNo());
			pstmt.setString(2, vo.getStartStation());
			pstmt.setString(3, vo.getEndStation());
			pstmt.setString(4, vo.getStartDate());
			pstmt.setString(5, vo.getEndDate());
			pstmt.setLong(6, vo.getPrice());
			pstmt.setLong(7, vo.getFlightNo());
			// 5. ?????? -> rs
			result = pstmt.executeUpdate();
			// 6. ????????? ?????? - list
			// rs??? null ??? ????????? ????????????
			System.out.println("BoardDAOImpl.update() - ????????? ??????");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // ???????????? ?????? ??????
			throw new Exception("????????? ????????? DB ?????? ??? ?????? ??????");
		} finally {
			// 7. ??????
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	@Override
	public int delete(Long no) throws Exception {
		System.out.println("BoardDAOImpl.delete().vo : " + no);
		int result = 0;
		
		try {
			// 1. ?????? 2. ??????
			con = DB.getConnection();
			// 3. sql
			String sql = "delete from flightInf "
					+ " where flightNo = ? ";
			System.out.println("flightDAOImpl.delete().sql : " + sql);
			// 4. ???????????? & ????????? ??????
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			
			// 5. ?????? -> rs
			result = pstmt.executeUpdate();
			// 6. ????????? ?????? - list
			// rs??? null ??? ????????? ????????????
			if(result==1)System.out.println("flightDAOImpl.delete() - ????????? ??????");
			else System.out.println("?????? ????????? ?????? ?????????");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // ???????????? ?????? ??????
			throw new Exception("????????? ?????? DB ?????? ??? ?????? ??????");
		} finally {
			// 7. ??????
			DB.close(con, pstmt);
		} // end of try ~ catch ~ finally
		
		
		return result;
	}

	@Override
	public List<FlightInfVO> craftList() throws Exception {
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<FlightInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
		
			String sql = "select cNo,cname from craftInf";
					
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				// rs??? ?????? ???????????? ????????? ??????
				while(rs.next()) {
					// list??? null ?????? ????????? ??????
					if(list == null) list = new ArrayList<>();
					// ???????????? ?????? vo ????????? ????????????.
					FlightInfVO Vo = new FlightInfVO();
					// rs??? ???????????? ????????? vo??? ?????????.
					Vo.setcNo(rs.getLong("cNo"));
					Vo.setcName(rs.getString("cname"));
					
					// ???????????? ?????? vo??? list??? ?????????.
					
					list.add(Vo);
				}// end of while
			} // end of if
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}

	@Override
	public List<FlightInfVO> stationList() throws Exception {
		System.out.println("FlightInfDAOImpl.list()-----------------------");
		List<FlightInfVO> list = null;
		
		try {
			con = DB.getConnection();
			
		
			String sql = "select startcon,startstation from startcon";
					
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				// rs??? ?????? ???????????? ????????? ??????
				while(rs.next()) {
					// list??? null ?????? ????????? ??????
					if(list == null) list = new ArrayList<>();
					// ???????????? ?????? vo ????????? ????????????.
					FlightInfVO Vo = new FlightInfVO();
					// rs??? ???????????? ????????? vo??? ?????????.
					Vo.setStartCon(rs.getString("startcon"));
					Vo.setStartStation(rs.getString("startstation"));
					
					// ???????????? ?????? vo??? list??? ?????????.
					
					list.add(Vo);
				}// end of while
			} // end of if
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	public long getTotalRow(PageObject pageObject) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDAOImpl.getTotalRow().pageObject : " + pageObject);
		// ?????? ????????? ??????
		long totalRow = 0;
		
		try {
			// 1. ?????? 2. ??????
			con = DB.getConnection();
			// 3. sql
			String sql = "select count(*) from flightinf ";
			sql += searchSQL(pageObject);
			System.out.println("flightInfDAOImpl.getTotalRow().sql : " + sql);
			// 4. ???????????? & ????????? ??????
			pstmt = con.prepareStatement(sql);
			int idx = 0;
			idx = searchDataSet(pageObject, idx);
			// 5. ?????? -> rs
			rs = pstmt.executeQuery();
			// 6. ????????? ?????? - list
			// rs??? null ??? ????????? ????????????
			if(rs != null && rs.next()) {
				// rs??? ?????? ???????????? ????????? ??????
				totalRow = rs.getLong(1);
			} // end of if
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // ???????????? ?????? ??????
			throw new Exception("????????? ???????????? ?????? ?????? ????????? ?????? DB ?????? ??? ?????? ??????");
		} finally {
			// 7. ??????
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		
		return totalRow;
	}
}//class
	