<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>我的订单</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myOrders.css" />
</head>

<body>
	<%@include file="commen/commen.jsp"%>
	<div id="header"><%@include file="commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<form action="${pageContext.request.contextPath }/selectOrders.action" method="get">
			<span>状态：</span>
			<input type="hidden" value="1" name="currPage">
			<select name="status">
				<option value="0" <c:if test="${status=='0' }">selected="selected"</c:if> >所有订单</option>
				<option value="申请取消" <c:if test="${status=='申请取消' }">selected="selected"</c:if>>申请取消订单</option>
				<option value="已取消" <c:if test="${status=='已取消' }">selected="selected"</c:if>>已取消订单</option>
				<option value="已支付" <c:if test="${status=='已支付' }">selected="selected"</c:if>>已支付订单</option>
				<option value="已入住" <c:if test="${status=='已入住' }">selected="selected"</c:if>>已入住订单</option>
				<option value="已完成" <c:if test="${status=='已完成' }">selected="selected"</c:if>>已完成订单</option>
			</select>
			<input type="submit" value="查询" >
			</form>
		</div>
		<hr>
		<div id="section_content">
			<table border="1px" bordercolor="lightyellow" cellspacing="0" width="1000px" style="font-size: 12px;text-align: center;">
				<tr>
					<th width="8%">订单号</th>
					<th width="8%">用户编号</th>
					<th width="8%">状态</th>
					<th width="15%">预定时间</th>
					<th width="8%">房间号</th>
					<th width="15%">入住日期</th>
					<th width="15%">离店日期</th>
					<th width="8%">总价</th>
					<th width="15%">操作</th>
				</tr>
				<c:forEach  var="order" items="${ordersPageBean.list }">
					<tr>
						<td>${order.orderid }</td>
						<td>${order.userid }</td>
						<td>${order.status }</td>
						<td><fmt:formatDate type="date" value="${order.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${order.roomid }</td>
						<td><fmt:formatDate type="date" value="${order.dateofstay }" /></td>
						<td><fmt:formatDate type="date" value="${order.dateofdeparture }" /></td>
						<td>${order.totalprice }</td>
						<td>
						 <c:choose>
						 	<c:when test="${order.status=='申请取消' }">
						 		<a href="${pageContext.request.contextPath }/updateOrderStatus.action?orderid=${order.orderid }&status=已取消&userid=${order.userid }">通过</a>
						 		<a href="${pageContext.request.contextPath }/updateOrderStatus.action?orderid=${order.orderid }&status=已支付&userid=${order.userid }">驳回</a>
						 	</c:when>
						 	<c:when test="${order.status=='已支付' }">
						 		<a href="${pageContext.request.contextPath }/updateOrderStatus.action?orderid=${order.orderid }&status=已入住&userid=${order.userid }">入住</a>
						 		<a href="${pageContext.request.contextPath }/updateOrderStatus.action?orderid=${order.orderid }&status=已取消&userid=${order.userid }">取消</a>
						 	</c:when>
						 	<c:when test="${order.status=='已入住' }">
						 		<a href="${pageContext.request.contextPath }/updateOrderStatus.action?orderid=${order.orderid }&status=已完成&userid=${order.userid }">完成</a>
						 	</c:when>
							 <c:otherwise>
							 	暂无操作
							 </c:otherwise>
						 </c:choose>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${ordersPageBean.totalCount!=0 }">
				<tr>
				<td colspan="7" align="center">第${ordersPageBean.currPage }/${ordersPageBean.totalPage
					}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总记录数:${ordersPageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					每页显示的记录数:${ordersPageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${ordersPageBean.currPage !=1}">
						<a
							href="${pageContext.request.contextPath }/selectOrders.action?currPage=1&status=${status }">首页</a>
						<a
							href="${pageContext.request.contextPath }/selectOrders.action?currPage=${ordersPageBean.currPage-1}&status=${status }">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${ordersPageBean.totalPage }">
						<c:if test="${ordersPageBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/selectOrders.action?currPage=${i }&status=${status }">[${i
								}]</a>
						</c:if>
						<c:if test="${ordersPageBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${ordersPageBean.currPage!=ordersPageBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/selectOrders.action?currPage=${ordersPageBean.currPage+1}&status=${status }">下一页</a>
						<a
							href="${pageContext.request.contextPath }/selectOrders.action?currPage=${ordersPageBean.totalPage}&status=${status }">尾页</a>
					</c:if>
				</td>
			</tr>
			</c:if>
			</table>
		</div>
	</div>
</body>
</html>
