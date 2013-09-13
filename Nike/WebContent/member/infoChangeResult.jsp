<%@page import="net.bitacademy.java41.vo.Member"%>
<%@page import="net.bitacademy.java41.vo.Project"%>
<%@page import="net.bitacademy.java41.vo.MemberProject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:useBean id="project" class="net.bitacademy.java41.vo.Project"
	scope="session"></jsp:useBean>
<jsp:useBean id="member" class="net.bitacademy.java41.vo.Member"
	scope="session"></jsp:useBean>
<jsp:useBean id="myprojects" scope="session"
	type="java.util.List<net.bitacademy.java41.vo.MemberProject>"></jsp:useBean>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">

<head profile="http://gmpg.org/xfn/11">
<title>SPMS_bit41</title>
<meta http-equiv="Refresh" content="1;url=memview?email=${param.email}">
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
		<c:if test="${member.level == 2}">
				<h1>
				회원관리<br>
				<ul><a href="${rootPath}/member/list.do">멤버 목록</a></ul>
				<ul><a href="${rootPath}/member/addForm.do">멤버 등록</a></ul>
				프로젝트관리<br>
				<ul><a href="#">프로젝트 목록</a></ul>
				<ul><a href="#">프로젝트 등록</a></ul>
				</h1>
			</c:if>
			
			<c:if test="${member.level == 0}">
				<h1>
					My Project<a href="<%=application.getContextPath()%>/project/list.do">[All]</a>
					<ul>
						<%for (MemberProject memproject : myprojects) {%>
						<li><a
							href="${rootPath}/project/view.do?no=<%=memproject.getNo()%>"><%=memproject.getTitle()%>
								<%=(memproject.getLevel() == 0) ? "(PL)" : ""%></a></li>
						<%}%>
					</ul>
				</h1>
			</c:if>
		<h3>
			<c:choose>
				<c:when test="${status == 'PASSWORD_ERROR'}">암호가 일치하지 않습니다.</c:when>
				<c:when test="${status == 'SUCCESS'}">개인정보가 변경되었습니다.</c:when>
			</c:choose>
			<br>
		</h3>
	</div>
</div>
<jsp:include page="/tail.jsp"></jsp:include>
</body>
</html>









