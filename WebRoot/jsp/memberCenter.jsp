<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="wyz.jingangHotel02.ssm.autoPo.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员中心</title>
  </head>
  
  <body>
   <% User _user = (User)session.getAttribute("user");
	if(_user==null){
		out.print("<script type='text/javascript'>alert('请您先登录！');");
		out.print("window.location.href='"+request.getContextPath()+"/jsp/login.jsp'</script>");
		}else{
			if(_user.getMemberid()==null){
				out.print("<script type='text/javascript'>alert('抱歉，您还不是会员！');");
				out.print("window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
				}
		}
		out.print("<script type='text/javascript'>window.location.href='"+request.getContextPath()+"/findMemberInfo.action?currPage=1'</script>");
		 %>
  </body>
</html>
