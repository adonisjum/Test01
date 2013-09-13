package net.bitacademy.java41.vo;

import java.io.Serializable;

import net.bitacademy.java41.util.DBConnectionPool;

public class MemberProject implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public static final int LVL_LEADER=0;
	public static final int LVL_GENERAL=1;
	public static final int LVL_GUEST=9;
	DBConnectionPool conPool;
	
	String title;
	int level;
	int no;
	
	public int getNo() {
		return no;
	}
	public MemberProject setNo(int no) {
		this.no = no;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public MemberProject setTitle(String title) {
		this.title = title;
		return this;
	}
	public int getLevel() {
		return level;
	}
	public MemberProject setLevel(int level) {
		this.level = level;
		return this;
	}
}
