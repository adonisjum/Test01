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

		
		
		<form method="post" action="add.do" > 
				<h4>
						프로젝트 생성 <br>
						리더 <input type="checkbox"  name="confirmPL"><br>
						제목 <input type="text" name="title"><br>
						시작일 <input type="text" name="startDate" placeholder="2013-01-01"><br>
						종료일 <input type="text" name="endDate" placeholder="2013-01-01"><br>
						내용 <br>
				<tr> <td colspan="2"><textarea rows="5" name="content" cols="50"></textarea></td></tr><br>
				태그: <input type="text" name="tag" placeholder="ex)tag1 tag2 tag3(공백으로 구분)"><br>
				<input type="submit" value="등록" >
				<input type="submit" value="취소" >
				<!-- <a href="list.do">[목록]</a> -->
				</h4>
		</div>
	</div>
	<jsp:include page="/tail.jsp"></jsp:include>
</body>
</html>
