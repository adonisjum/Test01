<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시스템 오류!</title>
<c:if test="${member.level == 2}">
	<link rel="stylesheet" href="Mgrstyles/layout.css" type="text/css"/>
</c:if>
<c:if test="${member.level == 0}">
	<link rel="stylesheet" href="styles/layout.css" type="text/css"/>
</c:if>

<script type="text/javascript">
	var Pic = new Array();
	Pic[0] = 'http://4.bp.blogspot.com/-EKptQQal56A/UiX4ddMEYUI/AAAAAAAAANE/xtk3iIxn0ok/s1600/1.jpg';
	Pic[1] = 'http://3.bp.blogspot.com/--ftqEoWXuvI/UiX4d5yG4_I/AAAAAAAAANI/owxZE78DyPY/s1600/2.jpg';
	Pic[2] = 'http://3.bp.blogspot.com/-SmcYEN4DAEU/UiX4ftDt3MI/AAAAAAAAANU/_MUuP30noL4/s1600/3.jpg';
	Pic[3] = 'http://1.bp.blogspot.com/-5jPmO_4cNZE/UiX4gSTJ4BI/AAAAAAAAANc/OI_aMZZ_Jqw/s1600/4.jpg';
	Pic[4] = 'http://1.bp.blogspot.com/-mvCvNR1VmHA/UiX4g5LI0_I/AAAAAAAAANg/_x_5sz19m-I/s1600/5.jpg';

	var p = Pic.length;
	var imgLoad = new Array();

	for (var i = 0; i < p; i++) {
		imgLoad[i] = new Image();
		imgLoad[i].src = Pic[i];
	}

	window.onload = function setImg() {
			var j = Math.floor(Math.random() * 5);
			document.body.background = Pic[j];
	}
</script>
</head>
<body>
	<form method="post" action="signup">
		<div id="form">
			<section> 
			<br><br><br><br><br><br><br><br>
			<center>
			<H2>처리 중 문제가 발생했습니다.</H2>
			<HR>
			<table>
			<tr width=100%><td>
			관리자에게 문의해 주세요<BR>
			빠른 시일 내에 복구하겠습니다.
			</table>
			</center>
			<meta http-equiv=refresh content="2;url=<%=application.getContextPath()%>/auth/login">
			</section>
		</div>
	</form>
</body>
</html>