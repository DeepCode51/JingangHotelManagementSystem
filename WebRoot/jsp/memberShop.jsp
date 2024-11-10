<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/commen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberShop.css" />
</head>

<body>
<% User _user = (User)session.getAttribute("user");
	if(_user==null){
		out.print("<script type='text/javascript'>alert('请您先登录！');");
		out.print("window.location.href='"+request.getContextPath()+"/jsp/login.jsp'</script>");
		}else{
			if(_user.getMemberid()==null){
				out.print("<script type='text/javascript'>alert('抱歉，您还不是会员！');");
				out.print("window.location.href='"+request.getContextPath()+"'</script>");
				}
		}%>
	<div id="header"><%@include file="/commen/top.jsp"%></div>
	<div id="nav">
		<%@ include file="/commen/navigation.jsp"%>
	</div>
	<div id="section">
		<div id="section_top">
			<a href="${pageContext.request.contextPath }/findMemberInfo.action?currPage=1">会员个人信息</a>丨
			<a href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1">会员商城</a>
		</div>
		<table width="1000px">
			<tr>
				<td>商品名</td>
				<td>所需积分</td>
				<td>图片</td>
				<td>选择数量</td>
				<td>购买</td>
			</tr>
			<c:forEach var="goods" items="${goodspageBean.list }">
				<c:if test="${goods.status==0 }">
				<form action ="${pageContext.request.contextPath }/buyGoods.action" method="post">
					<tr>
						<td>${goods.goodsname }<input type="hidden" name="goodsid" value="${goods.goodsid }" /></td>
						<td>${goods.score }<input type="hidden" name="score" value="${goods.score }" /></td>
						<td><img src="/img/jingangHotel/goods/${goods.img }"></td>
						<td><input type="text" name="number" value="1"/></td>
						<td><input type="submit" value="购买"></td>
					</tr>
				</form>
				</c:if>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">第${goodspageBean.currPage }/${goodspageBean.totalPage
					}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总记录数:${goodspageBean.totalCount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					每页显示的记录数:${goodspageBean.pageSize }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${goodspageBean.currPage !=1}">
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=1&status=1">首页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.currPage-1}&status=1">上一页</a>
					</c:if> <c:forEach var="i" begin="1" end="${goodspageBean.totalPage }">
						<c:if test="${goodspageBean.currPage!=i }">
							<a
								href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${i }&status=1">[${i
								}]</a>
						</c:if>
						<c:if test="${goodspageBean.currPage==i }">[${i }]</c:if>

					</c:forEach> <c:if test="${goodspageBean.currPage!=goodspageBean.totalPage }">
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.currPage+1}&status=1">下一页</a>
						<a
							href="${pageContext.request.contextPath }/findGoodsByPage.action?currPage=${goodspageBean.totalPage}&status=1">尾页</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
