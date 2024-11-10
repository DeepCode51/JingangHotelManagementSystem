<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
</head>
<style>
	#content {
		margin-top: 50px;
		margin-left: 50px;
	}
</style>
<body>
	<%@include file="commen/commen.jsp"%>
	<%@include file="commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="content">
			<span style="font-size: 30px;">欢迎来到金港宾馆管理系统！</span>
		</div>
	</div>
</body>
</html>
