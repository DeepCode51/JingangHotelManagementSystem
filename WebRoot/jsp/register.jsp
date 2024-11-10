<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>register</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/register.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/register.js"
	type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div id="register">
		<form action="${pageContext.request.contextPath }/register.action"
			method="post" onsubmit="return registersubmit()">
			<span id="title">用户注册</span>

			<div class="user">
				<span>姓名：</span><input type="text" name="username" id="username"/>
			</div>

			<!-- <div class="user">
				<span>性别：</span>
				<select name="sex">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div> -->

			<div class="user">
				<span>身份证：</span><input type="text" name="useridcard" id="useridcard"/>
			</div>

			<div class="user">
				<span>手机号：</span><input type="text" name="phone" id="phone"/>
			</div>

			<!-- <div class="user">
				<span>邮箱：</span><input type="text" name="email" />
			</div>

			<div class="user">
				<span>生日：</span><input type="date" name="birthday" />
			</div> -->

			<div class="user">
				<span>密码：</span><input type="password" name="userpassword" id="userpassword"/>
			</div>

			<div class="user">
				<span>确认密码：</span><input type="password" name="_userpassword" id="_userpassword"/>
			</div>

			<div class="button">
				<input type="submit" value="注册" /><a
					href="${pageContext.request.contextPath }/jsp/login.jsp">登陆</a>
			</div>

		</form>
	</div>
</body>
</html>
