<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>LoginForm</title>

<link rel="stylesheet" type="text/css" href="../auth/style.css">

<script type="text/javascript">
	var Pic = new Array()
	Pic[0] = 'http://4.bp.blogspot.com/-EKptQQal56A/UiX4ddMEYUI/AAAAAAAAANE/xtk3iIxn0ok/s1600/1.jpg'
	Pic[1] = 'http://3.bp.blogspot.com/--ftqEoWXuvI/UiX4d5yG4_I/AAAAAAAAANI/owxZE78DyPY/s1600/2.jpg'
	Pic[2] = 'http://3.bp.blogspot.com/-SmcYEN4DAEU/UiX4ftDt3MI/AAAAAAAAANU/_MUuP30noL4/s1600/3.jpg'
	Pic[3] = 'http://1.bp.blogspot.com/-5jPmO_4cNZE/UiX4gSTJ4BI/AAAAAAAAANc/OI_aMZZ_Jqw/s1600/4.jpg'
	Pic[4] = 'http://1.bp.blogspot.com/-mvCvNR1VmHA/UiX4g5LI0_I/AAAAAAAAANg/_x_5sz19m-I/s1600/5.jpg'

	var p = Pic.length
	var imgLoad = new Array()

	for (i = 0; i < p; i++) {
		imgLoad[i] = new Image()
		imgLoad[i].src = Pic[i]
	}

	window.onload = function setImg() {
			var j = Math.floor(Math.random() * 5);
			document.body.background = Pic[j];
			document.body.background-size = "cover";
	}
</script>
</head>

<body>
	<form method="post" action="signin.do">
		<div id="form">
			<section>
				<header>
					<span id="logo" class="entypo-paper-plane"></span>
					<h1>SPMS.</h1>
				</header>
				<article>
					<div id="contain_fields_two">
						<input type="text" name="email" id="email" placeholder="Email" />
						<input type="password" name="password" id="password"
							placeholder="Password" /> 
						<input type="text" name="username"
							id="username" placeholder="username">
						<input type="text" name="tel"
							id="tel" placeholder="phone">
					</div>
					<input type="submit" value="Sign in"/>
				</article>
				<footer>
					<p>
						<a href="${rootPath}/auth/loginForm.do">Log in</a> to your account
					</p>
				</footer>
			</section>
		</div>
	</form>
</body>

</html>