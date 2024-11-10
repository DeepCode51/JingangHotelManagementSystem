<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>宾馆评价</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myComments.css" />

</head>

<body>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<div><a href="${pageContext.request.contextPath }/findTotalComments.action?currPage=1">宾馆评价</a>丨<a href="${pageContext.request.contextPath }/jsp/comments.jsp">我的评价</a></div>
			<hr/>
			<div><a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=-1&currPage=1">我的评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=1&currPage=1">待审核评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=0&currPage=1">已通过评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=2&currPage=1">未通过评价</a>丨<a href="${pageContext.request.contextPath }/findNotComments.action">我要评价</a></div>
		</div>
		<hr>
		<div id="section_content">
					<table width="1000px" cellspacing="0" border="solid" bordercolor="black" style="text-align: center;">
						<tr height="33px">
							<th>评价时间</th>
							<th>状态</th>
							<th>评分</th>
							<th>评价内容</th>
							<th>管理员回复</th>
						</tr>
						<c:forEach items="${cPageBean.list }" var="comment">
						<tr height="99px">
							<td><fmt:formatDate value="${comment.commenttime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${comment.status }</td>
							<td>${comment.score }</td>
							<td>${comment.commetcontent }</td>
							<td>${comment.commentreply }</td>
						</tr>
						</c:forEach>
					</table>
		</div>
		<div id="bottom">
		<c:if test="${cPageBean.totalCount!=0 }">
			第${cPageBean.currPage }/${cPageBean.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			总记录数:${cPageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			每页显示的记录数:${cPageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${cPageBean.currPage !=1}">
					<a
						href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=${comstatus }&currPage=1">首页</a>
					<a
						href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=${comstatus }&currPage=${cPageBean.currPage-1}">上一页</a>
				</c:if> <c:forEach var="i" begin="1" end="${cPageBean.totalPage }">
					<c:if test="${cPageBean.currPage!=i }">
						<a
							href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=${comstatus }&currPage=${i }">[${i
							}]</a>
					</c:if>
					<c:if test="${cPageBean.currPage==i }">[${i }]</c:if>
	
				</c:forEach> <c:if test="${cPageBean.currPage!=cPageBean.totalPage }">
					<a
						href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=${comstatus }&currPage=${cPageBean.currPage+1}">下一页</a>
					<a
						href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=${comstatus }&currPage=${cPageBean.totalPage}">尾页</a>
				</c:if>
		</c:if>
		</div>
	</div>
</body>
</html>
