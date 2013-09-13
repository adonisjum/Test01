package net.bitacademy.java41.controls.project;

import java.util.List;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.services.ProjectService;
import net.bitacademy.java41.vo.Member;

public class ProjectViewControl implements PageControl {
	ProjectService projectService;
	MemberService memberService;
	
	public ProjectViewControl setProjectService(ProjectService projectService, MemberService memberService) {
		this.projectService = projectService;
		this.memberService = memberService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		int no = Integer.parseInt(params.get("no")[0]);
		List<Member> list = memberService.listByProject(no);

		model.put("project", projectService.get(no));
		model.put("team", list);
		
		return "/project/view.jsp";
	}
}













