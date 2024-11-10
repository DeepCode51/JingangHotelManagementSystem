<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户管理</title>
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
	#fix table{
		margin-top:20px;
		margin-left: 150px;
	}
	#fix table tr td:first-child{
		text-align: right;
	}
	#fix table tr td:last-child{
		text-align: left;
	}
	#t1 tr td{
		height: 60px;
	}
	#fixtitle{
		display: none;
		font-weight: bold;
		margin-left: 400px;
	}
	.middle {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function fix(it){
		var father = $(it).parent().parent();
		var userid = $(father).children("td").eq(0).html();
		var phone = $(father).children("td").eq(1).html();
		var userpassword = $(father).children("td").eq(2).html();
		var username = $(father).children("td").eq(3).html();
		var useridcard = $(father).children("td").eq(4).html();
		var sex = $(father).children("td").eq(5).html();
		var birthday = $(father).children("td").eq(6).html().trim();
		var email = $(father).children("td").eq(7).html();
		var memberid = $(father).children("td").eq(8).html();
		$("#userid").val(userid);
		$("#phone").val(phone);
		$("#userpassword").val(userpassword);
		$("#username").val(username);
		$("#useridcard").val(useridcard);
		$("#sex").val(sex);
		$("#birthday").val(birthday);
		$("#email").val(email);
		$("#memberid").val(memberid);
		$("#t1").hide();
		$("#search").hide();
		$("#fix").show();
		$("#fixtitle").show();
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
			<form action="${pageContext.request.contextPath }/selectAllUsers.action" method="get" id="search">
				<input type="hidden" name="currPage" value="1">
				<span>手机号</span><input type="text" name="phone" value="${_user.phone }">
				<span>姓名</span><input type="text" name="username" value="${_user.username }">
				<span>性别</span>
				<select name="sex">
					<option value="0" <c:if test="${_user.sex=='0' }">selected="selected"</c:if> >请选择</option>
					<option value="男" <c:if test="${_user.sex=='男' }">selected="selected"</c:if> >男</option>
					<option value="女" <c:if test="${_user.sex=='女' }">selected="selected"</c:if> >女</option>
				</select>
				<input type="submit" value="查询">
			</form>
			<span id="fixtitle">修改用户信息</span>
			</div>
			<hr>
			<div class="middle">
				<table width="1000px" border="solid" cellspacing="0" style="text-align: center;font-size: 13px;" id="t1">
					<tr height="40px">
						<th width="10%">用户编号</th>
						<th width="10%">手机号</th>
						<th width="10%">密码</th>
						<th width="10%">真实姓名</th>
						<th width="15%">身份证号</th>
						<th width="5%" >性别</th>
						<th width="10%">生日</th>
						<th width="10%">邮箱</th>
						<th width="10%">会员号</th>
						<th width="10%">操作</th>
					</tr>
					<c:forEach items="${pageBean.list }" var="user">
					<tr height="20px">
						<td>${user.userid }</td>
						<td>${user.phone }</td>
						<td>${user.userpassword }</td>
						<td>${user.username }</td>
						<td>${user.useridcard }</td>
						<td>${user.sex }</td>
						<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/> </td>
						<td>${user.email }</td>
						<td>${user.memberid }</td>
						<td>
							<a href="javascript:void(0)" onclick="fix(this)">修改</a>
							<c:if test="${user.memberid==null }">
								<a href="${pageContext.request.contextPath }/updateUserToMember.action?userid=${user.userid }">升级会员</a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="10" align="center" style="height: 30px;">
			            <c:choose>
				            <c:when test="${pageBean.list!=null and pageBean.list.size()>0 }">
										<span>第${pageBean.currPage }/${pageBean.totalPage}页</span>
										<span>总记录数:${pageBean.totalCount }</span>
										<span>每页显示的记录数:${pageBean.pageSize }</span>
										<c:if test="${pageBean.currPage !=1}">
											<a href="${pageContext.request.contextPath }/selectAllUsers.action?currPage=1&username=${_user.username }&phone=${_user.phone }&sex=${_user.sex }">首页</a>
											<a href="${pageContext.request.contextPath }/selectAllUsers.action?currPage=${pageBean.currPage-1}&username=${_user.username }&phone=${_user.phone }&sex=${_user.sex }">上一页</a>
										</c:if> <c:forEach var="i" begin="1" end="${pageBean.totalPage }">
											<c:if test="${pageBean.currPage!=i }">
												<a href="${pageContext.request.contextPath }/selectAllUsers.action?currPage=${i }&username=${_user.username }&phone=${_user.phone }&sex=${_user.sex }">[${i}]</a>
											</c:if>
											<c:if test="${pageBean.currPage==i }">[${i }]</c:if>
					
										</c:forEach> <c:if test="${pageBean.currPage!=pageBean.totalPage }">
											<a href="${pageContext.request.contextPath }/selectAllUsers.action?currPage=${pageBean.currPage+1}&username=${_user.username }&phone=${_user.phone }&sex=${_user.sex }">下一页</a>
											<a href="${pageContext.request.contextPath }/selectAllUsers.action?currPage=${pageBean.totalPage}&username=${_user.username }&phone=${_user.phone }&sex=${_user.sex }">尾页</a>
										</c:if>
							</c:when>
							<c:otherwise>
								抱歉没有查询到用户信息！
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</table>
				<form id="fix" style="text-align: center;display: none;" action="${pageContext.request.contextPath }/updateUserByManager.action" method="post">
					<table cellspacing="0" width="600px" height="300px">
					<tr>
						<td>用户编号：</td>
						<td><input type="text" name="userid" id="userid" readonly="readonly"></td>
					</tr>
					<tr>
						<td>手机号：</td>
						<td><input type="text" name="phone" id="phone" required></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="text" name="userpassword" id="userpassword" required></td>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input type="text" name="username" id="username" required></td>
					</tr>
					<tr>
						<td>身份证号：</td>
						<td><input type="text" name="useridcard" id="useridcard" required></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<select name="sex" id="sex">
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>生日：</td>
						<td><input type="date" name="birthday" id="birthday" ></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" name="email" id="email" ></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="修改" style="margin-left: 170px;">
							<a href="javascript:window.location.reload();">返回</a>
						</td>
					</tr>
					</table>
				</form> 
			</div>
		</div>
	</div>
</body>
</html>
