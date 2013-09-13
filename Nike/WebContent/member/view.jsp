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
				Member Info.<br>
				EMAIL : ${member.email}<br> 
				NAME : ${member.name}<br> 
				TEL	: ${member.tel}<br> 
				BLOG : ${member.blog}<br> 
				REG_DATE :	${member.regDate}<br> 
				UPDATE_DATE : ${member.updateDate}<br>
				ADDRESS : ${member.detailAddress}<br> 
				TAG : ${member.tag}<br>
				LEVEL:
				<c:choose>
				<c:when test="${mgrMem.level == 0}">일반회원</c:when>
				<c:when test="${mgrMem.level == 1}">관리자</c:when>
				<c:when test="${mgrMem.level == 2}">PM</c:when>
				<c:otherwise>손님</c:otherwise>
				</c:choose><br>

				
				<c:if test="${member.level == 2}">
						<p>
						<a href="list">[목록]</a>
						<a href="passwordChange?email=${member.email}">[암호변경]</a>
						<a href="update?email=${member.email}">[변경]</a>
						<a href="delete?email=${member.email}">[삭제]</a>
						</p>
				</c:if>
			
				<c:if test="${member.level == 0}">
					<p>
					<a href="../project/list.do">[이전]</a>
					<a href="updateForm.do?email=${member.email}">[정보 변경]</a>
					</p>
				</c:if>
		</div>
			</h3>
		</div>
	</div>

	<jsp:include page="/tail.jsp"></jsp:include>
</body>
</html>
