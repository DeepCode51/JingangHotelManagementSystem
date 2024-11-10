<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberInfo.css" />
</head>
<style>
	#t1 tr td{
		height: 40px;
	}
</style>
<body>
	<%@include file="commen/commen.jsp"%>
	<div id="header"><%@include file="commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<a href="${pageContext.request.contextPath }/selectMembers.action?currPage=1&phone=&username=&rankid=">会员信息</a>
			丨
			<a href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=0">会员商品信息</a>
			丨
			<a href="${pageContext.request.contextPath }/selectRanks.action">会员折扣</a>
		</div>
		<hr>
		<div id="section_content">
		<span>会员${memberid }的积分信息如下：</span>
			<table border="solid" cellspacing="0" style="text-align: center;font-size: 13px;" id="t1" width="900px">
				<tr>
					<th width="25%">操作时间</th>
					<th width="15%">状态</th>
					<th width="15%">物品名</th>
					<th width="15%">数量</th>
					<th width="15%">变动积分</th>
					<th width="15%">剩余积分</th>
				</tr>
				<c:forEach var="member" items="${memberInfoBean.list }">
					<tr>
						<td><fmt:formatDate type="date"
								value="${member.operatetime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>${member.status }</td>
						<td><c:choose>
								<c:when test="${member.status == '获得' }">
								</c:when>
								<c:otherwise>
							${member.goodsname }
							</c:otherwise>
							</c:choose>
						</td>
						<td><c:choose>
								<c:when test="${member.status == '获得' }">
								</c:when>
								<c:otherwise>
							${member.number }
							</c:otherwise>
							</c:choose>
						</td>
						<td>${member.score }</td>
						<td>${member.restscore }</td>
					</tr>
				</c:forEach>
				<tr>
				<td colspan="6" align="center">
				第${memberInfoBean.currPage }/${memberInfoBean.totalPage }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总记录数:${memberInfoBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					每页显示的记录数:${memberInfoBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${memberInfoBean.currPage !=1}">
						<a
							href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=1&memberid=${memberid }">首页</a>
						<a
							href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=${memberInfoBean.currPage-1}&memberid=${memberid }">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${memberInfoBean.totalPage }">
						<c:if test="${memberInfoBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=${i }&memberid=${memberid }">[${i
								}]</a>
						</c:if>
						<c:if test="${memberInfoBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${memberInfoBean.currPage!=memberInfoBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=${memberInfoBean.currPage+1}&memberid=${memberid }">下一页</a>
						<a
							href="${pageContext.request.contextPath }/selectMemberInfo.action?currPage=${memberInfoBean.totalPage}&memberid=${memberid }">尾页</a>
					</c:if>
				</td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>
