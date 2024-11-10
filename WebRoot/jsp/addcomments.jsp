<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加评论</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/addcomments.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".cmt").click(function(){
			$(this).parent().next().toggle(1000);
		});
	});
</script>
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
			<div><a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=0&currPage=1">我的评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=1&currPage=1">待审核评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=0&currPage=1">已通过评价</a>丨<a href="${pageContext.request.contextPath }/findMyCommemts.action?comstatus=2&currPage=1">未通过评价</a>丨<a href="${pageContext.request.contextPath }/findNotComments.action">我要评价</a></div>
		</div>
		<hr>
		<div id="section_content">
			<c:forEach items="${notCommentsOrdersList }" var="list">
				<div class="listdiv">
					<div class="fe_top">
						<span>${list.roomid }</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span><fmt:formatDate value="${list.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span>价格：${list.totalprice }</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="cmt">添加评论</a>
					</div>
					<div class="fe_bottom">
						<form action="${pageContext.request.contextPath }/addComment.action" method="post">
							<input type="hidden" name="orderid" value="${list.orderid }" />
							<textarea name="commetcontent" cols="50" rows="5"></textarea>
							<span>请打分:</span>
							<select name="score">
								<option value="-1">请选择</option>
								<option value="5.0">5.0</option>
								<option value="4.5">4.5</option>
								<option value="4.0">4.0</option>
								<option value="3.5">3.5</option>
								<option value="3.0">3.0</option>
								<option value="2.5">2.5</option>
								<option value="2.0">2.0</option>
								<option value="1.5">1.5</option>
								<option value="1.0">1.0</option>
								<option value="0.5">0.5</option>
								<option value="0.0">0.0</option>
							</select>
							<input type="submit" value="提交"/>
						</form>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
</body>
</html>
