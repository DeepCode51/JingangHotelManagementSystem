<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
</head>

<body>
	<%@include file="/commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="content">
			<span style="font-size: 30px;margin: 120px 0 0 200px;display: inline-block;">欢迎来到金港宾馆管理系统！</span>
		</div>
	</div>
</body>
</html>
