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
    <title>管理员管理</title>
  </head>
  
  <body>
   <script type='text/javascript'>
	var status = '<%=request.getParameter("status") %>';
	if (status=="as") {
		alert("添加成功！");
	}
	if (status=="af") {
		alert("该用户已存在，添加失败！");
	}
	if (status=="sid") {
		alert("该用户名已被占用！");
	}
	if (status=="fs") {
		alert("修改成功！");
	}
	if (status=="ds") {
		alert("删除成功！");
	}
	if (status=="fl") {
		alert("抱歉，最多只能拥有6名二级管理员");
	}
		window.location.href="<% out.write(path); %>"+"/selectAllManager.action";
</script>
  </body>
</html>
