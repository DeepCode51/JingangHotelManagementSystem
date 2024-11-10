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
    <title>客房管理</title>
  </head>
  
  <body>
   <script type='text/javascript'>
	var status = '<%=request.getParameter("status") %>';
	if (status=="fps" || status=="frs") {
		alert("修改成功！");
	}else if(status=="is"){
		alert("添加失败，该房间号已存在");
	}else if(status=="irs"){
		alert("添加成功！");
	}

		window.location.href="<% out.write(path); %>"+"/selectRooms.action?currPage=1&roomid=&roomtypeid=";
</script>
  </body>
</html>
