package net.bitacademy.java41.services;

import java.util.List;

import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Project;

public class ProjectService {
	ProjectDao projectDao;
	
	public ProjectService setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
		return this;
	}

	public void add(Project project) throws Exception {
		projectDao.add(project);	
	}

	public List<Project> list() throws Exception{
		return projectDao.list();
	}
	
	public Project get(int no) throws Exception{
		return projectDao.get(no);
	}
}
