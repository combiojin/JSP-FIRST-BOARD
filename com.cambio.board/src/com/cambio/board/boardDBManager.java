package com.cambio.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class boardDBManager {
	
	private static boardDBManager bdm = new boardDBManager();
	private boardDBManager() {}
	public static boardDBManager getInstance() {
		return bdm;
	}
	private staticValues sv = staticValues.getInstance();
	
	//회원목록
	public List doSelect() {
		Connection con = null; //DB 연결 객체
		PreparedStatement pstmt = null; //SQL 질의문 담는 객체
		ResultSet rs = null; // table 내용 담는 객체
		List<memberDTO> list = new ArrayList<memberDTO>();
		try {
			con = doConnection();
			pstmt = con.prepareStatement(" select * from member ");
			rs = pstmt.executeQuery();
			
//			System.out.println("rs.next = " + rs.next());
//			System.out.println("rs.next = " + rs.next());
//			System.out.println("rs.next = " + rs.next());
//			System.out.println("rs.next = " + rs.next());
			
			while(rs.next()) {
				memberDTO md = new memberDTO();
				md.setId(rs.getString("id"));
				md.setName(rs.getString("name"));
				md.setGender(rs.getString("gender"));
				md.setAge(rs.getString("age"));
				md.setAre(rs.getString("are"));
				md.setPhone(rs.getString("phone"));
				md.setMail(rs.getString("mail"));
				list.add(md);
			}
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			doClose(rs, pstmt, con);
		}
		return list;
	}
	
	//회원가입
	public boolean doinsert(memberDTO md) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = doConnection();
			pstmt = con.prepareStatement(" insert into member " + 
										" (id,pw,name,gender,age,are,phone,mail) " + 
										" values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, md.getId());
			pstmt.setString(2, md.getPw());
			pstmt.setString(3, md.getName());
			pstmt.setString(4, md.getGender());
			pstmt.setString(5, md.getAge());
			pstmt.setString(6, md.getAre());
			pstmt.setString(7, md.getPhone());
			pstmt.setString(8, md.getMail());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			doClose(pstmt, con);
		}
		return true;
	}
	
	//로그인
	public boolean checkLogin(String id, String pw) {
		boolean logincheck = true;
		
		//아이디, 패스워드가 DB에 있으면 logincheck = true;
		//아이디, 패스워드가 DB에 없으면 logincheck = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(staticValues.getInstance().oracle);
			
			con = DriverManager.getConnection(sv.dburl, sv.dbuser, sv.dbpw);
			pstmt = con.prepareStatement(" select * from member " + 
										" where id= ? and pw= ? ");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			//rs 에 내용이 있는것은 table 행 값이 있으므로 로그인 성공
			//rs 에 내용이 있는것은 table 행 값이 없으므로 로그인 실패
			//rs.next 메서드로 확인
			if(rs.next()) {
				logincheck = true;
			} else {
				logincheck = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return logincheck;
	}
	
	//마이페이지 수정
	public boolean doUpdateRow(memberDTO md) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = doConnection();
			pstmt = con.prepareStatement(" update member " + 
										" set pw =?, are =?, phone =?, mail =? " + 
										" where id =? ");
			
			pstmt.setString(1, md.getPw());
			pstmt.setString(2, md.getAre());
			pstmt.setString(2, md.getPhone());
			pstmt.setString(2, md.getMail());
			pstmt.setString(3, md.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			doClose(pstmt, con);
		}
		
		return true;
	}
	
	//아이디 확인
	public memberDTO doSelectRow(String id) {
		Connection con = null; //DB 연결 객체
		PreparedStatement pstmt = null; //SQL 질의문 담는 객체
		ResultSet rs = null; // table 내용 담는 객체
		memberDTO md = new memberDTO();
		try {
			con = doConnection();
			pstmt = con.prepareStatement(" select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				md.setId(rs.getString("id"));
				md.setPw(rs.getString("pw"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			doClose(rs, pstmt, con);
		}
		return md;
	}
	
	//연결하기 connection 반환
	public Connection doConnection() {
		Connection con = null;
		try {
			Class.forName(sv.oracle);
			con = DriverManager.getConnection(sv.dburl, sv.dbuser, sv.dbpw);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	//연결끊기
	public void doClose(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//연결끊기
		public void doClose(PreparedStatement pstmt, Connection con) {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
