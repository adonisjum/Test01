<%@page import="net.bitacademy.java41.vo.Member"%>
<%@page import="net.bitacademy.java41.vo.Project"%>
<%@page import="net.bitacademy.java41.vo.MemberProject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>



<jsp:useBean id="member" scope="session" type="net.bitacademy.java41.vo.Member"></jsp:useBean>
<jsp:useBean id="myprojects" scope="session" type="java.util.List<net.bitacademy.java41.vo.MemberProject>"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN"
	dir="ltr">

<head profile="http://gmpg.org/xfn/11">
<title>SPMS_bit41</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />

<c:if test="${member.level == 2}">
<link rel="stylesheet" href="../Mgrstyles/layout.css" type="text/css" />
</c:if>
<c:if test="${member.level == 0}">
<link rel="stylesheet" href="../styles/layout.css" type="text/css" />
</c:if>
</head>
<body id="top">
	<div class="wrapper col1">
		<div id="header">
			<div id="logo">
				<h1>
						<a href="<%=application.getContextPath()%>/main.do">SPMS</a>
				</h1>
				<p>Simple Project Management System</p>
			</div>
			<r> 
			<c:if test="${member.level == 2}">
				<img id="memberPhoto" src="<%=application.getContextPath()%>/images/photo.jpg">
			</c:if>
			<c:if test="${member.level == 0}">
				<img id="memberPhoto" src="<%=application.getContextPath()%>/images/twilight.jpg">
			</c:if>

			<div id="search">
				<ul>
					<c:if test="${member.level == 2}">
						<li>${member.name}</li>		
					</c:if>
					<c:if test="${member.level == 0}">
						<li><a href="${rootPath}/member/view.do?email=${member.email}">${member.name}</a></li>
					</c:if>
					<li>${member.tel}</li>
					<li class="last">${member.email}</li>
					<a href="<%=application.getContextPath()%>/auth/logout.do">log
						out</a>
				</ul>
			</div>
			</r>
			<br class="clear" />
		</div>
	</div>
	<div class="wrapper col2">
		<div id="topbar">
			<div id="topnav">
				<ul>
					<li><a href="#">프로젝트정보</a></li>
					<li><a href="#">멤버</a></li>
					<li><a href="#">자료실</a></li>
					<li><a href="#">작업관리</a></li>
					<li><a href="#">피드</a></li>
				</ul>
			</div>
			<br class="clear" />
		</div>
	</div>