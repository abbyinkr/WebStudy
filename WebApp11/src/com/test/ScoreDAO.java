package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	//생성자로 데이터베이스 연결
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 인원수 조회 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// prestatement 로 객체 생성 및 쿼리문 수행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 출력 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ " FROM TBL_SCORE ORDER BY SID";
		
		// 작업객체 생성 및 쿼리문 수행
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      ResultSet rs = pstmt.executeQuery();
      
		while(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getString("KOR"));
			dto.setEng(rs.getString("ENG"));
			dto.setMat(rs.getString("MAT"));
			dto.setTot(rs.getString("TOT"));
			dto.setAvg(rs.getString("AVG"));

			
			result.add(dto);
			
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	// 데이터 입력 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result=0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// 작업객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getKor());
		pstmt.setString(3, dto.getEng());
		pstmt.setString(4, dto.getMat());
		
		// 쿼리문 수행
		result = pstmt.executeUpdate();
		
		return result;
		
	}

	// 데이터베이스 종료 메소드
	public void close() throws SQLException
	{
		DBConn.close();
		
	}
	
	
	
	
}
