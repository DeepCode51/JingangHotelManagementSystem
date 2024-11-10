<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>宾馆评价</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/comment.css" />

</head>

<body>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
	<div id="section_top">
		<a href="${pageContext.request.contextPath }/findTotalComments.action?currPage=1">宾馆评价</a>丨
		<a href="${pageContext.request.contextPath }/jsp/comments.jsp">我的评价</a>
	</div>
	<hr>
	<div id="section_content">
		<div id="avgScore">
			金港宾馆总评分:${avgScore }/5.0
		</div>
		<div>
		<table width="1000px" cellspacing="0" border="solid" bordercolor="black" style="text-align: center;">
				<tr height="33px">
					<th>用户</th>
					<th>评价时间</th>
					<th>状态</th>
					<th>评分</th>
					<th>评价内容</th>
					<th>管理员回复</th>
				</tr>
				<c:forEach items="${tPageBean.list }" var="comment">
				<tr height="99px">
					<td>${comment.userCommemts.phone }</td>
					<td><fmt:formatDate value="${comment.userCommemts.commenttime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${comment.userCommemts.status }</td>
					<td>${comment.userCommemts.score }</td>
					<td>${comment.userCommemts.commetcontent }</td>
					<td>${comment.userCommemts.commentreply }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="bottom">
		第${tPageBean.currPage }/${tPageBean.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		总记录数:${tPageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		每页显示的记录数:${tPageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${tPageBean.currPage !=1}">
				<a
					href="${pageContext.request.contextPath }/findTotalComments.action?currPage=1">首页</a>
				<a
					href="${pageContext.request.contextPath }/findTotalComments.action?currPage=${tPageBean.currPage-1}">上一页</a>
			</c:if> <c:forEach var="i" begin="1" end="${tPageBean.totalPage }">
				<c:if test="${tPageBean.currPage!=i }">
					<a
						href="${pageContext.request.contextPath }/findTotalComments.action?currPage=${i }">[${i
						}]</a>
				</c:if>
				<c:if test="${tPageBean.currPage==i }">[${i }]</c:if>

			</c:forEach> <c:if test="${tPageBean.currPage!=tPageBean.totalPage }">
				<a
					href="${pageContext.request.contextPath }/findTotalComments.action?currPage=${tPageBean.currPage+1}">下一页</a>
				<a
					href="${pageContext.request.contextPath }/findTotalComments.action?currPage=${tPageBean.totalPage}">尾页</a>
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>
