<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/navm.css">
</head>
<body>
	<ul class="nav">
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/index.jsp">首页</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/managermg.jsp">管理员信息</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/usermg.jsp">用户管理</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/membermg.jsp">会员管理</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/roomsmg.jsp">客房管理</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/ordermg.jsp">订单管理</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/commentmg.jsp">评论管理</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/managerr/roomstatistics.jsp">统计分析</a></li>
	</ul>
</body>
</html>