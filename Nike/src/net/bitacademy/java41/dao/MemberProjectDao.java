package net.bitacademy.java41.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Member;

public class MemberProjectDao {
	DBConnectionPool conPool;
		
	public MemberProjectDao(DBConnectionPool conPool) {
		this.conPool = conPool;
	}
	
	public int add(Member member, int currentPno, int level) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				"insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)"
				+ " values(?, ?, ?)");
			stmt.setString(1, member.getEmail());
			stmt.setInt(2,currentPno);
			stmt.setInt(3, level);
			return stmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
}




