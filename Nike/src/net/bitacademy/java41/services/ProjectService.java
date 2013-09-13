package net.bitacademy.java41.services;

import java.sql.Connection;
import java.util.List;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Project;

public class ProjectService {
	ProjectDao projectDao;
	DBConnectionPool dbPool;
	MemberDao memberDao;
	
	public ProjectService setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
		return this;
	}
	
	public ProjectService setDBConnectionPool(DBConnectionPool dbPool) {
		this.dbPool = dbPool;
		return this;
	}
	
	public void add(Project project) throws Exception {
		Connection con = dbPool.getConnection();
		con.setAutoCommit(false);
		try {
			projectDao.add(project, con);
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw e;
			
		} finally {
			con.setAutoCommit(true);
			dbPool.returnConnection(con);
		}
	}

	public List<Project> list() throws Exception{
		return projectDao.list();
	}
	
	public Project get(int no) throws Exception{
		return projectDao.get(no);
	}
}
