<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客房预定</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/orderRoom.css" />

<script type="text/javascript">
	var error = '<%=request.getParameter("error") %>';
	if (error =="error") {
		alert("选择日期有误！");
	}
</script>
</head>

<body>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<form action="${pageContext.request.contextPath }/queryRoomsSpecail.action" method="get">
				入住 <input type="date" name="dateOfStay" required/> 退房 <input type="date" name="dateOfDeparture" required/>
				选择房型 	<select name="roomtypeid">
							<option value="1">单人间</option>
							<option value="2">双人间</option>
							<option value="3">三人间</option>
							<option value="4">棋牌室</option>
						</select>
				<input type="hidden" name="currPage" value="1"/> 
				<input type="submit" value="查询" />
			</form>
		</div>
		<div id="section_content">
			房间推荐
		</div>
	</div>
</body>
</html>
