<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>兑换成功</title>

  </head>
  
  <body>
    <script type="text/javascript">
    	alert("兑换成功");
    	window.location.href="<% out.write(path); %>"+"/findMemberInfo.action?currPage=1";
    </script>
  </body>
</html>
