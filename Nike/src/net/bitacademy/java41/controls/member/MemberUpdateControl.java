package net.bitacademy.java41.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.vo.Member;

public class MemberUpdateControl implements PageControl{
	MemberService memberService;
	
	public MemberUpdateControl setMemberService(MemberService memberService) {
		this.memberService = memberService;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception{
		HttpSession session = (HttpSession)model.get("session");
		Member member = (Member)session.getAttribute("member");
		
		@SuppressWarnings("unchecked")
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		Member copy = member.clone();
		System.out.println(copy.getPassword());
		System.out.println(params.get("password"));
		
		
		if(params.get("password")[0].equals(copy.getPassword())){
			System.out.println("비번같음");
			if (params.get("tel")[0]!=null){
				copy.setTel(params.get("tel")[0]);
				System.out.println("텔바뀜");
			}
			if (params.get("blog")!=null){
				copy.setBlog(params.get("blog")[0]);
				System.out.println("블로그바뀜");
			}
			if (params.get("detailAddress")!=null){
				copy.setDetailAddress(params.get("detailAddress")[0]);
			}
			if (params.get("tag")!=null){
				copy.setTag(params.get("tag")[0]);
			}
		}

		memberService.update(copy);
		session.setAttribute("member", copy);
		
		return "/member/view.jsp";
	}
}








