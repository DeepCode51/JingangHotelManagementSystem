<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="wyz.jingangHotel02.ssm.autoPo.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/personInfo.css" />
<script type="text/javascript">
	var status = '<%=request.getParameter("status") %>';
	if (status=="success") {
		alert("修改成功!");
	}else if (status == "fail") {
		alert("修改失败!");
	}else if (status == "fail2") {
		alert("该手机号已被注册，修改失败！");
	}
</script>
</head>
<body>
	<%
		User _user = (User) session.getAttribute("user");
		if (_user == null) {
			out.print("<script type='text/javascript'>alert('请您先登录！');");
			out.print("window.location.href='" + request.getContextPath()
					+ "/jsp/login.jsp'</script>");
		}
	%>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="one">姓名&nbsp;:&nbsp;${user.username } </div>
		<div id="two">性别&nbsp;:&nbsp;
		<c:choose>
			<c:when test="${user.sex !=null}">
  		${user.sex }     
   </c:when>
			<c:otherwise> 
   	 尚未填写
   </c:otherwise>
		</c:choose>
		</div>
		<div id="three">生日&nbsp;:&nbsp;
		<c:choose>
		<c:when test="${user.birthday !=null}">
   <fmt:formatDate type="date" value="${user.birthday }" />     
   </c:when>
			<c:otherwise> 
   	 尚未填写
   </c:otherwise>
		</c:choose>
		</div>
		<div id="four">手机&nbsp;:&nbsp;
		<c:choose>
			<c:when test="${user.phone !=null}">
		${user.phone }      
   </c:when>
			<c:otherwise> 
   	 尚未填写
   </c:otherwise>
		</c:choose>
		</div>
		<div id="five">邮箱&nbsp;:&nbsp;
		<c:choose>
			<c:when test="${user.email !=null}">
   		${user.email }      
   </c:when>
			<c:otherwise> 
   	 尚未填写
   </c:otherwise>
		</c:choose>
		</div>
		<div id="six"><a href="${pageContext.request.contextPath }/jsp/personInfo/fixInfo.jsp" id="fix">修改信息</a></div>
	</div>

</body>
</html>
