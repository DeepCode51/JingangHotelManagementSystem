<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>cancel</title>
<script type="text/javascript">
  	alert("已提交申请！");
    window.location.href="<% out.write(path); %>"+"/findUserOrders.action?status=0&currPage=1";
 </script>
  </head>
  
  <body>
  </body>
</html>
