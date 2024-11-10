<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>erro</title>
  </head>
  <script type="text/javascript">
  	var status = '<%=request.getParameter("status") %>';
  	if (status=="goods") {
		alert("抱歉，积分不足！");
	}
	window.location.href="<% out.write(path); %>"+"/index.jsp";
  </script>
  <body>
  </body>
</html>
