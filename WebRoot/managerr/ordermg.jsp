<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单管理</title>
  </head>
  
  <body>
   <script type='text/javascript'>
	var status = '<%=request.getParameter("status") %>';
	if (status=="fss") {
		alert("修改成功！");
	}
		window.location.href="<% out.write(path); %>"+"/selectOrders.action?currPage=1&status=0";
</script>
  </body>
</html>
