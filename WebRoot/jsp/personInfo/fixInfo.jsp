<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/fixInfo.css" />

</head>
<body>
	<% User _user = (User)session.getAttribute("user");
	if(_user==null){
		out.print("<script type='text/javascript'>alert('请您先登录！');");
		out.print("window.location.href='"+request.getContextPath()+"/jsp/login.jsp'</script>");
		} %>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
	<form action="${pageContext.request.contextPath }/updateUser.action" method="post">
		<table cellpadding="5px" cellspacing="5px">
			<tr>
				<td>性&nbsp;别：</td><td>
				<select name="sex">
					<option value="0">请选择</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select></td>
			</tr>
			<tr>
				<td>手&nbsp;机:</td><td><input type="text" name="phone" value="${user.phone }"/></td>
			</tr>
			<tr>
				<td>邮&nbsp;箱:</td><td><input type="text" name="email" value="${user.email }"/></td>
			</tr>
			<tr>
				<td>生&nbsp;日:</td><td><input type="text" name="birthday" id="birth" value="<fmt:formatDate type="date" value="${user.birthday }"/>"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/jsp/personInfo/personInfo.jsp">返回</a></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
