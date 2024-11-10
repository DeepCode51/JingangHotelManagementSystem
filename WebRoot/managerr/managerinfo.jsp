<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
</head>
<style>
	.content {
		margin-top: 20px;
		margin-left: 50px;
	}
	form{
		margin-top:20px; 
	}
	form div{
		margin-top: 15px;
	}
	input[type=submit]{
		margin-right: 20px;
	}
	.fix{
		 cursor:pointer;
		 color:blue ;
	}
</style>
<script type="text/javascript">
	function add(){
		$("#t1").hide();
		$("#psd").hide();
		$("#fix").hide();
		$("input[type='text']").val("");
		$("input[type='password']").val("");
		$("#add").show();
	}
	
	function fix(){
		$("#t1").hide();
		$("#add").hide();
		$("#fix").hide();
		$("input[type='text']").val("");
		$("input[type='password']").val("");
		$("#psd").show();
	}
	
	function fixmanager(it){
		var father = $(it).parent().parent();
		var id = father.children("td").eq(0).html();
		var adminid = father.children("td").eq(1).html();
		var password = father.children("td").eq(3).html();
		$("#t1").hide();
		$("#psd").hide();
		$("#add").hide();
		$("input[type='text']").val("");
		$("input[type='password']").val("");
		$("#adminid").val(adminid);
		$("#password").val(password);
		$("#id").val(id);
		$("#fix").show();
	}
</script>
<body>
	<%@include file="commen/commen.jsp"%>
	<%@include file="commen/top.jsp"%>
	<div style="position: absolute;">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div class="content">
			<div class="top">
			<c:if test="${admin.level==1 }">
				<a href="javascript:add()">新增管理员</a>
				|
			</c:if>
				<a href="javascript:fix()">修改密码</a>
			</div>
			<hr>
			<div class="middle">
				<table width="1000px" border="solid" cellspacing="0" style="text-align: center;" id="t1">
					<tr height="40px">
						<th width="25%">用户名</th>
						<th width="25%">等级</th>
						<th width="25%">密码</th>
						<c:if test="${admin.level==1 }">
						<th width="25%">操作</th>
						</c:if>
					</tr>
					<c:forEach items="${list }" var="manager">
					<tr height="50px">
						<td style="display: none;">${manager.id }</td>
						<td>${manager.adminid }</td>
						<td>${manager.level }</td>
						<td style="display: none;">${manager.password }</td>
						<td>
							<c:choose>
								<c:when test="${admin.level==1 }">
								${manager.password }
								</c:when>
								<c:otherwise>
								权限不够！
								</c:otherwise>
							</c:choose>
						</td>
						<c:if test="${admin.level==1 }">
						<td>
							<c:choose>
							<c:when test="${manager.id!=1 }">
								<a class="fix" onclick="fixmanager(this)">修改</a>
								<a href="${pageContext.request.contextPath }/deleteManager.action?id=${manager.id }">删除</a>
							</c:when>
							<c:otherwise>
								不能操作超级管理员！
							</c:otherwise>
							</c:choose>
						</td>
						</c:if>
					</tr>
					</c:forEach>
				</table>
				<form id="add" style="text-align: center;display: none;" action="${pageContext.request.contextPath }/insertManager.action" method="post">
					<div><span style="font-size: 25px;">新增管理员</span></div>
					<div>账号：<input type="text" name="adminid" required></div>
					<div>密码：<input type="password" name="password" required></div>
					<div><input type="submit" value="新增"><a href="javascript:window.location.reload();">返回</a></div>
				</form>
				<form id="psd" style="text-align: center;display: none;" action="${pageContext.request.contextPath }/updatePsd.action" method="post">
					<div><span style="font-size: 25px;">修改密码</span></div>
					<div>旧密码：<input type="text" name="adminid" required></div>
					<div>新密码：<input type="password" name="password" required></div>
					<div>确认密码：<input type="password" name="_password" required></div>
					<div><input type="submit" value="新增"><a href="javascript:window.location.reload();">返回</a></div>
				</form>
				<form id="fix" style="text-align: center;display: none;" action="${pageContext.request.contextPath }/updateManager.action" method="post">
					<div>修改管理员信息</div>
					<div>账号：<input type="text" name="adminid" required id="adminid"></div>
					<div>密码：<input type="password" name="password" required id="password"></div>
					<div>
						<input type="hidden" name="id" id="id">
						<input type="submit" value="修改">
						<a href="javascript:window.location.reload();">返回</a>
					</div>
				</form> 
			</div>
		</div>
	</div>
</body>
</html>
