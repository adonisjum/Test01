package net.bitacademy.java41.controls.member;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;

public class MemberUpdateFormControl implements PageControl {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
				return "changeForm.jsp";
	}
}











