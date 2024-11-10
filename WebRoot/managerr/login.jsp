<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>login</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/login.css" />
<script type="text/javascript">
	var error = '<%=request.getParameter("status") %>';
	if (error=="error") {
		alert("账号或者密码不正确！");
	}
</script>
</head>
<body>
	<div id="login">
		<span id="title">管理员登陆</span><br />
		<form action="${pageContext.request.contextPath }/mglogin.action"
			method="post" onsubmit="return loginsubmit();">
			<div class="user">
				<span>账号：</span><input type="text" name="adminid" required/> <br/>
				<span id="unerro">账号为11位的手机号</span>
			</div>
			<div class="user">
				<span>密码：</span><input type="password" name="password" required/><br/>
				<span id="pderro">密码长度位8-16位</span>
			</div>
			<div class="button">
				<input type="submit" value="登陆" />
			</div>
		</form>
	</div>
</body>
</html>
