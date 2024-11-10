<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="wyz.jingangHotel02.ssm.autoPo.HManager" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>back</title>
    
  </head>
	<% HManager admin = (HManager)session.getAttribute("admin");
	if(admin==null){
		out.print("<script>window.location.href='"+request.getContextPath()+"/managerr/login.jsp'</script>");
	}
		 %>
  <body>
   
  </body>
</html>
