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
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<a href="${pageContext.request.contextPath }/findUserOrders.action?status=0&currPage=1" >所有订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=1" >申请取消订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=2" >已取消订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=3" >待付款订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=4" >已支付订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=5" >已入住订单</a>丨
			<a href="${pageContext.request.contextPath }/findUserOrders.action?currPage=1&status=6" >已完成订单</a>
		</div>
		<hr>
		<div id="section_content">
			<table border="1px" bordercolor="lightyellow" cellspacing="0" width="1000px">
				<tr><th>预定时间</th><th>房间号</th><th>入住日期</th><th>离店日期</th><th>订单状态</th><th>总价</th>
				<th>申请取消</th>
				</tr>
				<c:forEach  var="order" items="${ordersPageBean.list }">
					<tr>
						<td><fmt:formatDate type="date" value="${order.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${order.roomid }</td>
						<td><fmt:formatDate type="date" value="${order.dateofstay }" /></td>
						<td><fmt:formatDate type="date" value="${order.dateofdeparture }" /></td>
						<td>${order.status }</td>
						<td>${order.totalprice }</td>
						<td>
						  <c:if test="${order.status=='已支付'}">
						       <a href="${pageContext.request.contextPath }/applyCancelOrder.action?orderid=${order.orderid }">申请取消</a>
						  </c:if>
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
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=${status }">首页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${ordersPageBean.currPage-1}&status=${status }">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${ordersPageBean.totalPage }">
						<c:if test="${ordersPageBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${i }&status=${status }">[${i
								}]</a>
						</c:if>
						<c:if test="${ordersPageBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${ordersPageBean.currPage!=ordersPageBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${ordersPageBean.currPage+1}&status=${status }">下一页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${ordersPageBean.totalPage}&status=${status }">尾页</a>
					</c:if>
				</td>
			</tr>
			</c:if>
			</table>
		</div>
	</div>
</body>
</html>
