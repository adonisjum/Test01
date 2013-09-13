<%@page import="net.bitacademy.java41.vo.Member"%>
<%@page import="net.bitacademy.java41.vo.Project"%>
<%@page import="net.bitacademy.java41.vo.MemberProject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:useBean id="project" class="net.bitacademy.java41.vo.Project" scope="session"></jsp:useBean>
<jsp:useBean id="member" class="net.bitacademy.java41.vo.Member" scope="session"></jsp:useBean>	
<jsp:useBean id="myprojects" scope="session"	type="java.util.List<net.bitacademy.java41.vo.MemberProject>"></jsp:useBean>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">

<head profile="http://gmpg.org/xfn/11">
<title>SPMS_bit41</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<c:if test="${member.level == 2}">
	<link rel="stylesheet" href="Mgrstyles/layout.css" type="text/css"/>
</c:if>
<c:if test="${member.level == 0}">
	<link rel="stylesheet" href="styles/layout.css" type="text/css"/>
</c:if>
</head>
<jsp:include page="/header.jsp"></jsp:include>


	
	<div class="wrapper col4">
		<div id="container">
		<form method="post" action="add.do" > 
			<c:if test="${member.level == 2}">
				<h1>
				회원관리<br>
				<ul><a href="${rootPath}/member/list.do">멤버 목록</a></ul>
				<ul><a href="${rootPath}/member/add.do">멤버 등록</a></ul>
				프로젝트관리<br>
				<ul><a href="${rootPath}/project/list.do">프로젝트 목록</a></ul>
				<ul><a href="${rootPath}/project/addForm.do">프로젝트 등록</a></ul>
				</h1>
			</c:if>
			
			<c:if test="${member.level == 0}">
				<h1>
					My Project<a href="<%=application.getContextPath()%>/project/list.do">[All]</a>
					<ul>
						<%for (MemberProject memproject : myprojects) {%>
						<li><a
							href="${rootPath}/project/view.do?no=<%=memproject.getNo()%>"><%=memproject.getTitle()%>
								<%=(memproject.getLevel() == 1) ? "(PL)" : ""%></a></li>
						<%}%>
					</ul>
				</h1>
			</c:if>
				<h3>
						멤버 등록(*필수)<br>
						<form action="add.do" method="post">
						*이메일<br><input type="text" name="email"><br>
						*암호<br> <input type="password" name="password"><br>
						암호 확인<br> <input type="password" name="password2"><br>
						*이름<br> <input type="text" name="name"><br>
						*전화<br> <input type="text" name="tel"><br>
						블로그<br> <input type="text" name="blog"><br>
						우편번호<br> <input type="text" name="postno">
								<input type="button" value="우편번호찾기"><br>
						기본주소<br> <input type="text" name="basicAddr"><br>
						상세주소<br> <input type="text" name="detailAddr"><br>
						태그<br> <input type="text" name="tag"><br>
						권한 <select name="level">
						<option value="0" selected>일반회원</option>
						<option value="1">관리자</option>
						<option value="2">PM</option>
						<option value="9">손님</option>
						</select><br><br>
					<input type="submit" value="등록">
					<input type="reset" value="취소">
					<a href="list.do">[목록]</a>
				</form>
				
			</div>
		</div>
<jsp:include page="/tail.jsp"></jsp:include>
</body>
</html>
