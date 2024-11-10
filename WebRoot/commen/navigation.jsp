<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/nav.css">
</head>
<body>
	<ul class="nav">
		<li class="li"><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/jsp/personInfo/personInfo.jsp">个人信息</a></li>	
		<li class="li"><a href="${pageContext.request.contextPath }/jsp/memberCenter.jsp">会员中心</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/jsp/orderRoom.jsp">客房预订</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/jsp/orders.jsp">我的订单</a></li>
		<li class="li"><a href="${pageContext.request.contextPath }/findTotalComments.action?currPage=1">宾馆评价</a></li>
	</ul>
</body>
</html>