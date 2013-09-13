<%@page import="net.bitacademy.java41.vo.Member"%>
<%@page import="net.bitacademy.java41.vo.Project"%>
<%@page import="net.bitacademy.java41.vo.MemberProject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<jsp:useBean id="myprojects" scope="session"
	type="java.util.List<net.bitacademy.java41.vo.MemberProject>"></jsp:useBean>

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

			<div id="box">
			<h3>
				번호 : ${project.no}<br>
				프로젝트명 : ${project.title}<br>
				내용 : ${project.content}<br>
				시작일 : ${project.startDate}<br>
				종료일 : ${project.endDate}<br>
				태그 : ${project.tag}<br>
				<p><a href="list.do">[목록]</a></p>
			</h3>
			<h6>
				<table>
					<tr>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>블로그</th>
					</tr>
					
					<c:forEach var="team" items="${team}">
					<tr>
						<td>${team.name}</td>
						<td>${team.email}</td>
						<td>${team.tel}</td>
						<td>${team.blog}</td>
					</tr>
					</c:forEach>
				</table>
			</h6>
			</div>			
			
		</div>
	</div>
	<jsp:include page="/tail.jsp"></jsp:include>
</body>
</html>
