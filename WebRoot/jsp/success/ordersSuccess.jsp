<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>预定成功</title>

  </head>
 <script type="text/javascript">
    	alert("预定成功!");
    	window.location.href="<% out.write(path); %>"+"/index.jsp";
   </script>
  <body>
  </body>
</html>
