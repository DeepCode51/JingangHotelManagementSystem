<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="wyz.jingangHotel02.ssm.autoPo.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/top.css">
</head>

<body>
	<div id="top-background">
		<div id="symbol">
			<a href="${pageContext.request.contextPath }/index.jsp"><img src="${pageContext.request.contextPath }/images/symbol.jpg" />
			</a>
		</div>
		<div id="other">
		<% User user=(User)session.getAttribute("user");
			if(user!=null){%>  
　			${user.username }先生,欢迎您！ 
			<a href="${pageContext.request.contextPath }/logout.action">退出</a>
			<%} %>
			联系电话:13325436673&nbsp;&nbsp;
		</div>
	</div>
</body>
</html>
